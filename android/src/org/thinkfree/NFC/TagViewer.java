/*
 * Copyright (C) 2010 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.thinkfree.NFC;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.nfc.NdefMessage;
import android.nfc.NdefRecord;
import android.nfc.NfcAdapter;
import android.os.Bundle;
import android.os.Parcelable;
import android.util.Log;

import org.thinkfree.NFC.record.ParsedNdefRecord;

import java.util.List;

/**
 * An {@link Activity} which handles a broadcast of a new tag that the device
 * just discovered.
 */
public class TagViewer extends Activity {

    static final String TAG = "ViewTag";

    /**
     * This activity will finish itself in this amount of time if the user
     * doesn't do anything.
     */
    static final int ACTIVITY_TIMEOUT_MS = 1 * 1000;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        resolveIntent(getIntent());
    }

    void resolveIntent(Intent intent) {

        Log.e(TAG, "Tag detected");
        String action = intent.getAction();

        Log.e(TAG, action);

        if (NfcAdapter.ACTION_NDEF_DISCOVERED.equals(action)) {

            Parcelable[] rawMsgs = intent.getParcelableArrayExtra(NfcAdapter.EXTRA_NDEF_MESSAGES);
            NdefMessage[] msgs;

            if (rawMsgs != null) {
                msgs = new NdefMessage[rawMsgs.length];
                for (int i = 0; i < rawMsgs.length; i++) {
                    msgs[i] = (NdefMessage) rawMsgs[i];
                }
            } else {
                // Unknown tag type
            	Log.e(TAG, "Unknown tag type");
                byte[] empty = new byte[] {};
                NdefRecord record = new NdefRecord(NdefRecord.TNF_UNKNOWN, empty, empty, empty);
                NdefMessage msg = new NdefMessage(new NdefRecord[] {record});
                msgs = new NdefMessage[] {msg};
            }
            // Setup the views
            loadWebView(msgs);
        }
        else {

            Log.e(TAG, "Unknown intent " + intent);
            finish();
            return;
        }
    }

    void loadWebView(NdefMessage[] msgs) {
    	Log.e("loading", "Loading webview methode");
        if (msgs == null || msgs.length == 0) {
        	finish();
            return;
        }
        List<ParsedNdefRecord> records = NdefMessageParser.parse(msgs[0]);
        final int size = records.size();
        
        for (int i = 0; i < size; i++) {
            ParsedNdefRecord record = records.get(i);
            
            String str = record.getText();
            String key = str.split("=")[0];
            if ( key.equals("MIMIC")){
            	String value = str.split("=")[1];
            	Log.e("load","Loading web : " + value);
            	Uri uri = Uri.parse(value);
            	Intent intent = new Intent(Intent.ACTION_VIEW, uri);
            	startActivity(intent);
            }
        }
        
        // TODO : Remove me
       	Uri uri = Uri.parse("http://www.google.com");
       	Intent intent = new Intent(Intent.ACTION_VIEW, uri);
       	startActivity(intent);
       	
        finish();
        return;
    }

    @Override
    public void onNewIntent(Intent intent) {
        setIntent(intent);
        resolveIntent(intent);
    }
}

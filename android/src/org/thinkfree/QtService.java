/***
  Copyright (c) 2008-2012 CommonsWare, LLC
  Licensed under the Apache License, Version 2.0 (the "License"); you may not
  use this file except in compliance with the License. You may obtain	a copy
  of the License at http://www.apache.org/licenses/LICENSE-2.0. Unless required
  by applicable law or agreed to in writing, software distributed under the
  License is distributed on an "AS IS" BASIS,	WITHOUT	WARRANTIES OR CONDITIONS
  OF ANY KIND, either express or implied. See the License for the specific
  language governing permissions and limitations under the License.

  From _The Busy Coder's Guide to Android Development_
    http://commonsware.com/Android
*/

package org.thinkfree;

import android.app.Notification;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import android.util.Log;

import android.content.pm.PackageItemInfo;
import android.content.pm.PackageManager;
import android.content.pm.ServiceInfo;
import android.content.ComponentName;
import android.os.Bundle;

public class QtService extends Service
{
    public static final String EXTRA_MESSAGE="EXTRA_MESSAGE";

    private boolean isRunning=false;
    private ComponentName myService;

    @Override
    public int onStartCommand(Intent intent, int flags, int startId)
    {
        if(!isRunning)
        {
            myService = new ComponentName(this, this.getClass());
            String message = intent.getStringExtra(EXTRA_MESSAGE);
            start(message);
        }

        return(START_STICKY);
    }

    @Override
    public void onDestroy()
    {
        stop();
    }

    @Override
    public IBinder onBind(Intent intent)
    {
        return(null);
    }

    private void start(String message)
    {
        if (!isRunning)
        {
            Log.w(getClass().getName(), "Service is running..");
            isRunning = true;

            try
            {
                Bundle data = getPackageManager().getServiceInfo(myService, PackageManager.GET_META_DATA).metaData;

                Notification note = new Notification(data.getInt("android.app.notificon"),
                    message,
                    System.currentTimeMillis());

                Intent i = new Intent(this, QtServiceActivity.class);

                i.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_SINGLE_TOP);

                PendingIntent pi = PendingIntent.getActivity(this, 0, i, 0);

                note.setLatestEventInfo(this, data.getString("android.app.name"),
                                      "Running",
                                      pi);
                note.flags |= Notification.FLAG_NO_CLEAR;

                startForeground(1338, note);

            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        }
  }

    private void stop()
    {
        if (isRunning)
        {
            Log.w(getClass().getName(), "Stopping!");
            isRunning=false;
            stopForeground(true);
        }
    }
}

package org.thinkfree;

import org.qtproject.qt5.android.addons.qtactivityapp.QtServiceActivity;
import org.qtproject.qt5.android.addons.qtactivityapp.QtService;
import android.os.Bundle;
import android.content.Intent;
import android.content.ComponentName;
import android.util.Log;

public class AxihomeActivity extends QtServiceActivity
{
    public void onCreate(Bundle savedInstanceState)
    {
        Log.w(getClass().getName(), "Starting axihome");

        super.setServiceClass(AxihomeService.class);
        super.onCreate(savedInstanceState);
    }
}

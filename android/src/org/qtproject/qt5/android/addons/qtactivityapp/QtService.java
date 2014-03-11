package org.qtproject.qt5.android.addons.qtactivityapp;

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

    /* Event handling */

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

    /* Start stop service */

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

                note.setLatestEventInfo(this, splitCamelCase(data.getString("android.app.name")),
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

    /* Helper classes */

    static String splitCamelCase(String sp) {

        String s = Character.toUpperCase(sp.charAt(0)) + sp.substring(1);

        return s.replaceAll(
          String.format("%s|%s|%s",
             "(?<=[A-Z])(?=[A-Z][a-z])",
             "(?<=[^A-Z])(?=[A-Z])",
             "(?<=[A-Za-z])(?=[^A-Za-z])"
          ),
          " "
       );
    }
}

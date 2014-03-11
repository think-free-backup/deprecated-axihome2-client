package org.thinkfree;

import org.qtproject.qt5.android.addons.qtactivityapp.QtService;
import android.util.Log;

public class AxihomeService extends QtService
{
    public void onCreate()
    {
        Log.w(getClass().getName(), "Starting axihome service");
        super.setActivityClass(AxihomeActivity.class);
        super.onCreate();
    }
}

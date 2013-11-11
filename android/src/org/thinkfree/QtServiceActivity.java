package org.thinkfree;

import org.qtproject.qt5.android.bindings.QtActivity;

import android.app.Activity;
import android.content.pm.ActivityInfo;
import android.content.ComponentName;
import android.os.Bundle;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.util.Log;
import android.content.Intent;

public class QtServiceActivity extends QtActivity
{

    private ActivityInfo m_activityInfo = null;

    private int loadService()
    {
        int retVal = -1;
        Log.w("Qt", "loadService");
        try
        {
            Intent i = new Intent(this, QtService.class);
            i.putExtra(QtService.EXTRA_MESSAGE, "Loading " + m_activityInfo.metaData.getString("android.app.lib_name"));
            ComponentName cn = startService(i);
            retVal = 0;
        }
        catch (Exception e)
        {
            Log.e("Qt", "Can't create service" + e);
        }

        return retVal;
    }

    @Override
    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        
        try {
            m_activityInfo = getPackageManager().getActivityInfo(getComponentName(), PackageManager.GET_META_DATA);
        } 
        catch (NameNotFoundException e) {
            e.printStackTrace();
            finish();
            return;
        }
        
        loadService();
    }
}

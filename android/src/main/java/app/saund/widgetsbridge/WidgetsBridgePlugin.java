package app.saund.widgetsbridge;

import android.appwidget.AppWidgetManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;

import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "WidgetsBridge")
public class WidgetsBridgePlugin extends Plugin {

    @PluginMethod
    public void setItem(PluginCall call) {
        String key = call.getString("key");
        String value = call.getString("value");
        String group = call.getString("group");

        SharedPreferences sharedPref = getContext().getSharedPreferences(group, Context.MODE_PRIVATE);
        SharedPreferences.Editor editor = sharedPref.edit();
        editor.putString(key, value);
        editor.apply();
        
        call.resolve();
    }

    @PluginMethod
    public void reloadTimeline(PluginCall call) {
        reloadAllTimelines(call);
    }

    @PluginMethod
    public void reloadAllTimelines(PluginCall call) {
        String javaClass = call.getString("javaClass");
        if (javaClass == null) {
            call.reject("javaClass is required");
            return;
        }

        Class<?> clazz = null;
        try {
            clazz = Class.forName(javaClass);
        } catch (ClassNotFoundException e) {
            call.reject("javaClass is invalid");
            return;
        }

        Intent intent = new Intent(getContext(), clazz);
        intent.setAction(AppWidgetManager.ACTION_APPWIDGET_UPDATE);

        int[] ids = AppWidgetManager.getInstance(getContext())
                .getAppWidgetIds(new ComponentName(getContext(), clazz));
        intent.putExtra(AppWidgetManager.EXTRA_APPWIDGET_IDS, ids);

        getContext().sendBroadcast(intent);
        call.resolve();
    }

}

package com.luminsmart.plugins.permissions;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "PermissionsChecker")
public class PermissionsCheckerPlugin extends Plugin {

    private PermissionsChecker implementation = new PermissionsChecker();

    @PluginMethod
    public void checkPermission(PluginCall call) {
        String permission = call.getString("permission");

        JSObject ret = new JSObject();
        ret.put("status", permission);
        call.resolve(ret);
    }

    @PluginMethod
    public void requestPermission(PluginCall call) {
        String permission = call.getString("permission");

        JSObject ret = new JSObject();
        ret.put("status", permission);
        call.resolve(ret);
    }
}

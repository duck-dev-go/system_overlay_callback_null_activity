package com.example.null_activity_example

import `in`.jvapps.system_alert_window.SystemAlertWindowPlugin

import io.flutter.app.FlutterApplication
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback
import io.flutter.view.FlutterMain

public class Application: FlutterApplication(), PluginRegistrantCallback {

   override fun onCreate() {
     super.onCreate();
     SystemAlertWindowPlugin.setPluginRegistrant(this);
     FlutterMain.startInitialization(this);
   }

   override fun registerWith(registry: PluginRegistry?) {
    if (!registry!!.hasPlugin("in.jvapps.system_alert_window")) {
      SystemAlertWindowPlugin.registerWith(registry!!.registrarFor("in.jvapps.system_alert_window"));
    }
   }
}
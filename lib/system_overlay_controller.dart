import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:system_alert_window/system_alert_window.dart';

class SystemOverlayController {
  static Future<void> initialize() async {
    await SystemAlertWindow.checkPermissions;

    try {
      SystemAlertWindow.registerOnClickListener(systemOverlayOnClickListner);
    } catch (ignoreError) {}
  }

  static Future<void> systemOverlayOnClickListner(String tag) async {
    if (tag == 'button_close_window') {
      await SystemAlertWindow.closeSystemWindow();
      return;
    }
    if (tag == 'button_app_to_foreground') {
      await SystemAlertWindow.openApp('com.example.null_activity_example');
      await SystemAlertWindow.closeSystemWindow();
      return;
    }
  }

  static Future<void> showSimpleSystemOverlay(ThemeData theme,
      {String title = 'title', String body = 'body'}) async {
    await SystemAlertWindow.closeSystemWindow();

    SystemWindowHeader windowHeader = SystemWindowHeader(
      title: SystemWindowText(
        text: title,
        fontSize: 16,
        fontWeight: FontWeight.BOLD,
        textColor: theme.textTheme.subtitle1.color,
      ),
      padding: SystemWindowPadding.setSymmetricPadding(12, 20),
      decoration: SystemWindowDecoration(
        startColor: theme.backgroundColor,
      ),
    );

    SystemWindowBody windowBody = SystemWindowBody(
      rows: [
        EachRow(
          columns: [
            EachColumn(
              text: SystemWindowText(
                text: body,
                fontSize: 20,
                fontWeight: FontWeight.BOLD,
                textColor: theme.textTheme.bodyText1.color,
              ),
            ),
          ],
          gravity: ContentGravity.CENTER,
        ),
      ],
      padding: SystemWindowPadding(left: 20, right: 20, bottom: 10, top: 10),
      decoration: SystemWindowDecoration(
        startColor: theme.backgroundColor,
      ),
    );

    SystemWindowFooter windowFooter = SystemWindowFooter(
      buttons: [
        SystemWindowButton(
          text: SystemWindowText(
              text: "Exit",
              fontSize: 16,
              textColor: theme.textTheme.subtitle1.color),
          tag: "button_close_window",
          padding:
              SystemWindowPadding(left: 10, right: 10, bottom: 10, top: 10),
          width: 130,
          height: SystemWindowButton.WRAP_CONTENT,
          decoration: SystemWindowDecoration(
            startColor: theme.backgroundColor,
            endColor: theme.backgroundColor,
            borderWidth: 0,
          ),
        ),
        SystemWindowButton(
          text: SystemWindowText(
              text: "Open",
              fontSize: 16,
              textColor: theme.textTheme.subtitle1.color),
          tag: "button_app_to_foreground",
          padding:
              SystemWindowPadding(left: 10, right: 10, bottom: 10, top: 10),
          width: 130,
          height: SystemWindowButton.WRAP_CONTENT,
          decoration: SystemWindowDecoration(
            startColor: theme.backgroundColor,
            endColor: theme.backgroundColor,
            borderWidth: 0,
          ),
        ),
      ],
      decoration: SystemWindowDecoration(startColor: theme.backgroundColor),
      buttonsPosition: ButtonPosition.TRAILING,
    );

    SystemAlertWindow.showSystemWindow(
      height: 0,
      width: 300,
      header: windowHeader,
      body: windowBody,
      footer: windowFooter,
      gravity: SystemWindowGravity.CENTER,
    );
  }
}

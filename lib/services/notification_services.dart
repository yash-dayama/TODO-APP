import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class NotifyHelper {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  get notificationTapBackground => null; //

  initializeNotification() async {
    //tz.initializeTimeZones();
//  final IOSInitializationSettings initializationSettingsIOS =
//      IOSInitializationSettings(
//          requestSoundPermission: false,
//          requestBadgePermission: false,
//          requestAlertPermission: false,
//          onDidReceiveLocalNotification: onDidReceiveLocalNotification
//      );

    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("appicon");

//  final Android InitializationSettings initializationSettingsAndroid =
//      Android InitializationSettings("appicon);

    final InitializationSettings initializationSettings =
        InitializationSettings(
      //  iOS: initializationSettingsIOS,
      android: initializationSettingsAndroid,
    );
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse: onselectNotification);
// // first is for initiizing(both) and 2 is for showing content
//   }
// }
//  Future<void> onSelectNotification(NotificationResponse? response) async {
//     print('payload $response');
//     if (response?.payload != null && response!.payload!.isNotEmpty) {
//       onNotificationClick.add(response.payload);
//     }
//   }

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) async {
        // ...
      },
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
  }
}

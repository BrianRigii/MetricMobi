import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService extends ChangeNotifier {
  String _deviceToken;
  String get deviceToken => _deviceToken;
  FirebaseMessaging messaging;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  AndroidNotificationChannel channel1 = AndroidNotificationChannel(
      'regular_notification_channel',
      'High importance notifications',
      'channel for important notifications',
      enableVibration: true,
      playSound: true,
      importance: Importance.high);

  init({bool initMessaging = false}) async {
    await Firebase.initializeApp();

    if (initMessaging) {
      messaging = FirebaseMessaging.instance;
    }
  }

  setup() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(notificationService.channel1);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  Future<String> generateDeviceToken() async {
    messaging = FirebaseMessaging.instance;
    await messaging.getToken().then((value) {
      _deviceToken = value;
    });

    return _deviceToken;
  }

  void showNotification(RemoteMessage message) {
    RemoteNotification notification = message.notification;
    AndroidNotification android = message.notification?.android;
    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
              android: AndroidNotificationDetails(
                  notificationService.channel1.id,
                  notificationService.channel1.name,
                  notificationService.channel1.description,
                  playSound: true,
                  color: Colors.orange,
                  icon: "@mipmap/ic_launcher")));
    }
  }
}

NotificationService notificationService = NotificationService();

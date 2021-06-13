import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService extends ChangeNotifier {
  FirebaseMessaging messaging;

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

  generateDeviceToken() async {
    return await messaging.getToken().then((value) => value);
  }
}

NotificationService notificationService = NotificationService();

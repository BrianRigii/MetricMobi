import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';

class NotificationsService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  init() async {
    await Firebase.initializeApp();
    listen();
  }

  listen() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {});

    FirebaseMessaging.onBackgroundMessage((message) async {
      await Firebase.initializeApp();
    });
  }
}

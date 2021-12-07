import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metric/app_config.dart';
import 'package:metric/routes.dart';
import 'package:metric/services/notifications_service.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await notificationService.init();
  notificationService.showNotification(message);
}

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // navigation bar color

      statusBarBrightness: Brightness.light // status bar color
      ));
  WidgetsFlutterBinding.ensureInitialized();
  await notificationService.init();
  await notificationService.setup();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      notificationService.showNotification(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Metric',
        theme: AppConfig.themedata,
        initialRoute: RouteConfig.splashscreen,
        routes: routes);
  }
}

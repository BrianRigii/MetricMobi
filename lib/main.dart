import 'package:flutter/material.dart';
import 'package:metric/app_config.dart';
import 'package:metric/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Metric',
      theme: AppConfig.themedata,
    initialRoute: RouteConfig.splashscreen,
    routes: routes
  );
}
}

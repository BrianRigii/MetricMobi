import 'package:flutter/material.dart';
import 'package:metric/data/database.dart';
import 'package:metric/routes.dart';
import 'package:metric/services/auth_service.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    navigator();
  }

  void navigator() async {
    await db.init();
    if (authService.isLoggedIn) {
      Navigator.of(context).pushNamed(RouteConfig.homebottomnav);
    } else {
      Navigator.of(context).pushNamed(RouteConfig.clientCodeScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: 300,
        ),
      ),
    );
  }
}

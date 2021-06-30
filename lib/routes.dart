import 'package:flutter/cupertino.dart';
import 'package:metric/screens/load_screen.dart';
import 'package:metric/screens/login_screen.dart';
import 'package:metric/screens/splash_screen.dart';
import 'package:metric/screens/unit_info_screen.dart';
import 'package:metric/widgets/student_home_bottom_nav.dart';

class RouteConfig {
  static const splashscreen = '/splashscreen';
  static const loginscreen = '/loginscreen';
  static const loadscreen = '/loadscreen';
  static const homebottomnav = '/homebottomnav';
  static const studentHomeScreen = '/studentHomeScreen';
  static const unitInfoScreen = '/unitInfoScreen';
}

var routes = {
  RouteConfig.splashscreen: (context) => SplashScreen(),
  RouteConfig.loginscreen: (context) => LoginScreen(),
  RouteConfig.loadscreen: (context) => LoadScreen(),
  RouteConfig.homebottomnav: (context) => HomeBottomNav(),
  RouteConfig.studentHomeScreen: (context) => HomeBottomNav(),
  RouteConfig.unitInfoScreen: (context) => UnitInfoScreen()
};

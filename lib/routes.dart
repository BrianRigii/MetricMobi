import 'package:metric/screens/load_screen.dart';
import 'package:metric/screens/login_screen.dart';
import 'package:metric/screens/splash_screen.dart';

class RouteConfig {
  static const splashscreen = '/splashscreen';
  static const loginscreen = '/loginscreen';
  static const loadscreen = '/loadscreen';
}

var routes = {
  RouteConfig.splashscreen: (context) => SplashScreen(),
  RouteConfig.loginscreen: (context) => LoginScreen(),
  RouteConfig.loadscreen: (context) => LoadScreen()
};

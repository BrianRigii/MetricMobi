import 'package:metric/screens/add_discussion_screen.dart';
import 'package:metric/screens/announcement_list_screen.dart';
import 'package:metric/screens/client_code_screen.dart';
import 'package:metric/screens/discussion_forum_screen.dart';
import 'package:metric/screens/document_viewer_screen.dart';
import 'package:metric/screens/load_screen.dart';
import 'package:metric/screens/login_screen.dart';
import 'package:metric/screens/note_list_screen.dart';
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
  static const notesInfoScreen = '/notesInfoScreen';
  static const documentviewerscreen = '/documentviewerscreen';
  static const announcementlistscreen = '/announcementlistscreen';
  static const discussionforumscreen = '/discussionforumscreen';
  static const addDisscusionScreen = '/addDisscusionScreen';
  static const clientCodeScreen = '/clientCodeScreen';
}

var routes = {
  RouteConfig.splashscreen: (context) => SplashScreen(),
  RouteConfig.loginscreen: (context) => LoginScreen(),
  RouteConfig.loadscreen: (context) => LoadScreen(),
  RouteConfig.homebottomnav: (context) => HomeBottomNav(),
  RouteConfig.studentHomeScreen: (context) => HomeBottomNav(),
  RouteConfig.unitInfoScreen: (context) => UnitInfoScreen(),
  RouteConfig.notesInfoScreen: (context) => NotesInfoScreen(),
  RouteConfig.documentviewerscreen: (context) => DocumentViewerScreen(),
  RouteConfig.announcementlistscreen: (context) => AnnouncementListScreen(),
  RouteConfig.discussionforumscreen: (context) => DiscussionForum(),
  RouteConfig.addDisscusionScreen: (context) => AddDisscusionScreen(),
  RouteConfig.clientCodeScreen: (context) => ClientCodeScreen()
};

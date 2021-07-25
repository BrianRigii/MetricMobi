import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:metric/screens/load_screen.dart';
import 'package:metric/screens/student_home_screen.dart';
import 'package:metric/services/timetable_service.dart';
import 'package:metric/services/unit_service.dart';

class HomeBottomNav extends StatefulWidget {
  const HomeBottomNav({Key key}) : super(key: key);

  @override
  _HomeBottomNavState createState() => _HomeBottomNavState();
}

class _HomeBottomNavState extends State<HomeBottomNav> {
  int currentIndex = 0;

  void tabSwitchFn(idx) {
    setState(() {
      currentIndex = idx;
    });
  }

  List<Widget> _pages = [StudentHomeScreen(), LoadScreen()];

  @override
  void initState() {
    super.initState();
    callApis();
  }

  void callApis() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unitService.loadUnits();
      timeTableService.loadTodaysClasses(DateTime.now(), DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: tabSwitchFn,
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              EvaIcons.homeOutline,
              color: Theme.of(context).primaryColor,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Calendar',
            icon: Icon(
              EvaIcons.calendarOutline,
              color: Theme.of(context).primaryColor,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Todos',
            icon: Icon(
              EvaIcons.bookmarkOutline,
              color: Theme.of(context).primaryColor,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Messages',
            icon: Icon(
              EvaIcons.messageSquareOutline,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
      body: _pages[currentIndex],
    );
  }
}

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:metric/screens/load_screen.dart';

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

  List<Widget> _pages = [LoadScreen()];

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
            label: 'Home',
            icon: Icon(
              EvaIcons.barChart2Outline,
              color: Theme.of(context).primaryColor,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              EvaIcons.bookmarkOutline,
              color: Theme.of(context).primaryColor,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              EvaIcons.messageSquareOutline,
              color: Theme.of(context).primaryColor,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              EvaIcons.personOutline,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
      body: _pages[currentIndex],
    );
  }
}

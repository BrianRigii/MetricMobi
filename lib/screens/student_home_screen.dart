import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:metric/services/auth_service.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({Key key}) : super(key: key);

  @override
  _StudentHomeScreenState createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).viewInsets.top + 25),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        EvaIcons.menu,
                        color: Colors.white,
                        size: 30,
                      ),
                      Row(
                        children: [
                          Icon(
                            EvaIcons.bellOutline,
                            color: Colors.white,
                            size: 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Hi ${authService.authUser.name.split(' ')[0]}',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Welcome To Metric',
                    style: TextStyle(color: Colors.white, letterSpacing: 1.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50)),
                            child: TextField(
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  border: InputBorder.none,
                                  filled: true,
                                  hintText: 'Search Unit'),
                            ),
                          ),
                        ),
                        Icon(
                          EvaIcons.optionsOutline,
                          color: Colors.white,
                          size: 30,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:metric/data/models/unit_model.dart';
import 'package:metric/routes.dart';
import 'package:metric/services/assigned_user_service.dart';

class UnitInfoScreen extends StatefulWidget {
  const UnitInfoScreen({Key key}) : super(key: key);

  @override
  _UnitInfoScreenState createState() => _UnitInfoScreenState();
}

class _UnitInfoScreenState extends State<UnitInfoScreen> {
  UnitModel unit;
  Map<String, UnitModel> arguments;
  void navigateTodiscussionForum() {
    Navigator.of(context).pushNamed(RouteConfig.discussionforumscreen);
  }

  void callApis() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      assignedUserService.loadUnitStudents(unitId: unit.id);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    arguments = ModalRoute.of(context).settings.arguments;
    unit = arguments['unit'];

    callApis();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: '${unit.id}',
                child: Image.asset(
                  'assets/images/pattern1.jpg',
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '${unit.name}',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      )))
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  UnitOptionCards(
                    imgIconPath: 'assets/images/Notes.png',
                    title: 'Summary',
                    subtitle: '',
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                          RouteConfig.notesInfoScreen,
                          arguments: {'unit': unit});
                    },
                    child: UnitOptionCards(
                      imgIconPath: 'assets/images/Notes.png',
                      title: 'Notes',
                      subtitle: '1 attachment',
                    ),
                  ),
                  UnitOptionCards(
                    imgIconPath: 'assets/images/Assignments.png',
                    title: 'Assignments',
                    subtitle: '1 Pending Assignment',
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                          RouteConfig.announcementlistscreen,
                          arguments: {'unit': unit});
                    },
                    child: UnitOptionCards(
                      imgIconPath: 'assets/images/Announcments.png',
                      title: 'Announcements',
                      subtitle: '3  ',
                    ),
                  ),
                  GestureDetector(
                    onTap: navigateTodiscussionForum,
                    child: UnitOptionCards(
                      imgIconPath: 'assets/images/Discussions.png',
                      title: 'Discussion Forums',
                      subtitle: '3 new notifications',
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class UnitOptionCards extends StatelessWidget {
  final String imgIconPath;
  final String title;
  final String subtitle;
  const UnitOptionCards({
    Key key,
    this.imgIconPath,
    this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          imgIconPath,
          height: 50,
        ),
        title: Text('$title'),
        subtitle: Text('$subtitle'),
      ),
    );
  }
}

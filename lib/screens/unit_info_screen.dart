import 'package:flutter/material.dart';

import 'package:metric/data/models/unit_model.dart';
import 'package:metric/routes.dart';

class UnitInfoScreen extends StatelessWidget {
  const UnitInfoScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, UnitModel> arguments =
        ModalRoute.of(context).settings.arguments;
    UnitModel unit = arguments['unit'];
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
        ],
      ),
    );
  }
}

class UnitOptionCards extends StatelessWidget {
  final IconData icon;
  final String title;
  final RouteConfig route;
  const UnitOptionCards({
    Key key,
    this.icon,
    this.title,
    this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text('$title'),
        subtitle: Text('$route'),
      ),
    );
  }
}

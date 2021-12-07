import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key key}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 35.0, left: 16.0, right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              _key.currentState.openDrawer();
                            },
                            child: SvgPicture.asset(
                                'assets/images/menu_icon.svg')),
                        Row(
                          children: [
                            Icon(
                              EvaIcons.bellOutline,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(150)),
                              child: Image.asset(
                                'assets/images/strath_logo.jpg',
                                height: 40,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Calendar',
                      style: Theme.of(context).textTheme.headline1,
                    )
                  ],
                ),
              ))
        ]));
  }
}

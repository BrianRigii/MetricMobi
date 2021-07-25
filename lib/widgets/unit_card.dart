import 'package:flutter/material.dart';

import 'package:metric/data/models/unit_model.dart';
import 'package:metric/routes.dart';

class UnitCard extends StatelessWidget {
  final UnitModel unit;
  const UnitCard({
    Key key,
    this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(RouteConfig.unitInfoScreen, arguments: {'unit': unit});
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Hero(
                  tag: '${unit.id}',
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Image.asset(
                      'assets/images/pattern1.jpg',
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 4,
                  left: 8,
                  child: Text(
                    '${unit.name}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 14),
                  ),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //TODO: ADD NUMBER OF COMPLETE CLASSES;
                    Text(
                      '4/${unit.lessonsCount} lessons',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/male-avatar.png',
                          height: 25,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          '${unit.lecturer}',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.grey),
                        )
                      ],
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: '${unit.id}',
              child: Image.asset(
                'assets/images/pattern1.jpg',
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${unit.name}'),
            ),
          ],
        ),
      ),
    );
  }
}

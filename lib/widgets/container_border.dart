import 'package:flutter/material.dart';

class ContainerBorder extends StatelessWidget {
  final Color color;
  const ContainerBorder({
    Key key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(
          color: color,
          width: 1,
        ),
      )),
    );
  }
}

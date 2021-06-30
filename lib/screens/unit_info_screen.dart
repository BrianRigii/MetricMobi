import 'package:flutter/material.dart';

class UnitInfoScreen extends StatelessWidget {
  const UnitInfoScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/pattern1.jpg',
            height: 250,
          ),
        ],
      ),
    );
  }
}

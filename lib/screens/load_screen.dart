import 'package:flutter/material.dart';
import 'package:metric/services/auth_service.dart';

class LoadScreen extends StatefulWidget {
  const LoadScreen({Key key}) : super(key: key);

  @override
  _LoadScreenState createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {
  @override
  void initState() {
    super.initState();

    // print('${authService.authUser.toMap().toString()}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('${authService.authUser.email}'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:metric/services/auth_service.dart';
// import 'package:metric/services/auth_service.dart';

class LoadScreen extends StatelessWidget {
  const LoadScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('${authService.authUser.email}'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:metric/widgets/custom_box_txt_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png'),
            SizedBox(
              height: 32,
            ),
            CustomBoxTxtField(
              label: "Reference",
            ),
            SizedBox(
              height: 8,
            ),
            CustomBoxTxtField(
              label: 'Password',
            )
          ],
        ),
      ),
    );
  }
}

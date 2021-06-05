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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 150,
              ),
              SizedBox(
                height: 32,
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    CustomBoxTxtField(
                      label: "Reference",
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomBoxTxtField(
                      label: 'Password',
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

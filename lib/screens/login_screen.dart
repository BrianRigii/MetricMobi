import 'package:flutter/material.dart';
import 'package:metric/routes.dart';
import 'package:metric/services/auth_service.dart';
import 'package:metric/services/error_service.dart';
import 'package:metric/widgets/circular_material_spinner.dart';
import 'package:metric/widgets/custom_box_txt_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _referenceController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey();

  void _loginFn(String reference, String password) {
    authService.login(reference, password).then((value) {
      if (value != null) {
        Navigator.of(context)
            .pushReplacementNamed(RouteConfig.studentHomeScreen);
      }
    }).catchError((error) {
      errorService.errorHandler(
          error: error, context: context, message: 'Incorrect Credentials');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 200,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomBoxTxtField(
                        label: "Reference",
                        textEditingController: _referenceController,
                        validatorTxt: 'Reference is required',
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CustomBoxTxtField(
                        label: 'Password',
                        textEditingController: _passwordController,
                        validatorTxt: 'Password is required',
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      ValueListenableBuilder<bool>(
                        valueListenable: authService.isLoggingin,
                        builder: (context, isLoggingin, _) {
                          return MaterialButton(
                            minWidth: 400,
                            height: 50,
                            disabledColor:
                                Theme.of(context).primaryColor.withOpacity(.5),
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                            onPressed: isLoggingin
                                ? null
                                : () {
                                    if (_formKey.currentState.validate()) {
                                      _loginFn(_referenceController.text,
                                          _passwordController.text);
                                    }
                                  },
                            child: CircularMaterialSpinner(
                              loading: isLoggingin,
                              isBtn: true,
                              child: Text('LOGIN'),
                            ),
                          );
                        },
                      ),
                      TextButton(
                          onPressed: () {}, child: Text('Forgot Password ?'))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:metric/routes.dart';
import 'package:metric/widgets/custom_box_txt_field.dart';

class ClientCodeScreen extends StatefulWidget {
  const ClientCodeScreen({Key key}) : super(key: key);

  @override
  _ClientCodeScreenState createState() => _ClientCodeScreenState();
}

class _ClientCodeScreenState extends State<ClientCodeScreen> {
  TextEditingController _codeCtrl = TextEditingController();

  void _proccedBtnFn() {
    Navigator.of(context).pushReplacementNamed(RouteConfig.loginscreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/logo.png',
              width: 200,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'To get started, please enter your school code',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomBoxTxtField(
              label: 'School Code',
              textEditingController: _codeCtrl,
              validatorTxt: 'School Code',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: MaterialButton(
                height: 50,
                minWidth: double.infinity,
                onPressed: _proccedBtnFn,
                child: Text('SUBMIT'),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white),
          ),
        ],
      ),
    );
  }
}

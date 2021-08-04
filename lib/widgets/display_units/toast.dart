import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:metric/utils/app_enums.dart';

void showToast(String message, {bool persist = false}) {
  Fluttertoast.showToast(
    msg: message,
    gravity: ToastGravity.CENTER,
  );
}

void showCustomToast(
    {@required BuildContext context,
    String message,
    Color color = Colors.black,
    Duration duration = const Duration(seconds: 3),
    Scenario scenario}) {
  FToast ftoast = FToast();
  ftoast.init(context);

  Widget toastWidget = _buildToastContainer(
      color: color,
      message: scenario == Scenario.noInternet
          ? 'No Internet Connection'
          : '$message',
      icon: scenario == Scenario.noInternet
          ? Icons.warning_amber_outlined
          : Icons.error_outline);

  ftoast.showToast(
      child: toastWidget,
      toastDuration: duration,
      gravity: ToastGravity.BOTTOM);
}

Widget _buildToastContainer({
  @required Color color,
  String message,
  IconData icon,
}) {
  return Card(
    color: color,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          Expanded(
              flex: 7,
              child: Text(
                message,
                style: TextStyle(fontSize: 12, color: Colors.white),
              ))
        ],
      ),
    ),
  );
}

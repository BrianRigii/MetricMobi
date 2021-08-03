import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

void showToast(String message, {bool persist = false}) {
  Fluttertoast.showToast(
    msg: message,
    gravity: ToastGravity.CENTER,
  );
}

void showCustomToast({
  @required String message,
  Color color = Colors.white,
  Duration duration = const Duration(seconds: 3),
}) {
  FToast ftoast = FToast();
  Widget toastWidget = _buildToastContainer(color: color, message: message);

  ftoast.showToast(
      child: toastWidget,
      toastDuration: duration,
      gravity: ToastGravity.BOTTOM);
}

Widget _buildToastContainer({
  @required Color color,
  String message,
}) {
  return Container();
}

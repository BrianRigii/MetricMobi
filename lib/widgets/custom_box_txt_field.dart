import 'package:flutter/material.dart';

class CustomBoxTxtField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String label;

  const CustomBoxTxtField({
    Key key,
    this.textEditingController,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField();
  }
}

import 'package:flutter/material.dart';

class CustomBoxTxtField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String label;
  final String validatorTxt;

  const CustomBoxTxtField({
    Key key,
    this.textEditingController,
    this.label,
    this.validatorTxt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: '$label',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black12,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
      ),
      validator: (val) {
        if (val.isEmpty) {
          return '$validatorTxt';
        } else {
          return null;
        }
      },
    );
  }
}

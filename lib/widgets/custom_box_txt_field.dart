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
    return TextFormField(
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
      ),
    );
  }
}

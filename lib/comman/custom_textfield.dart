import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Colors.white,
        filled: true,
        border:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black38)),
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black38)),
        focusColor: Colors.deepOrange,
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter $hintText';
        }
        return null;
      },
    );
  }
}

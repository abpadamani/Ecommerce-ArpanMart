import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      minWidth: double.infinity,
      splashColor: Colors.black,
      color: Colors.deepOrange,
    );
  }
}

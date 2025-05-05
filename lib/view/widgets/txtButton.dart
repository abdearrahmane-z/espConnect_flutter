import 'package:flutter/material.dart';

class txtButton extends StatelessWidget {
  const txtButton({super.key, required this.title, required this.onPressed});
  final String title;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.red,
      onTap: () {
        onPressed();
      },
      child: Text(
        title,
        style: TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
          fontSize: 15,
        ),
      ),
    );
  }
}

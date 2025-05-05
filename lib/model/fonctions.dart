import 'package:flutter/material.dart';

class AppFonctions{
    static showMessage(BuildContext context, String message,Color color) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          alignment: Alignment.center,
          height: 80,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
          ),
          child: Row(
            children: [
              Icon(Icons.error, color: Colors.white),
              SizedBox(width: 20),
              Text(
                textAlign: TextAlign.center,
                message,
                style: TextStyle(fontFamily: "Inika", fontSize: 16,),
              ),
            ],
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 10,
      ),
    );
  }
}
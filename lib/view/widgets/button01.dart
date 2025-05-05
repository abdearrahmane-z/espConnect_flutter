import 'package:flutter/material.dart';

class Button01 extends StatelessWidget {
  const Button01({super.key, required this.title, required this.pressed});

  final String title;
  final Function pressed;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: SizedBox(
          width: 600,
          height: 50,
          child: ElevatedButton(
            
            style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 102, 102, 102)),
            foregroundColor: WidgetStatePropertyAll(Colors.white),
            shadowColor:WidgetStatePropertyAll(Colors.grey), shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
            )
          )),
            onPressed: () {
              pressed();
            },
            child: Text(title, style: TextStyle(fontFamily: "Inika", fontSize: 28),),
          ),
        ),
      ),
    );
  }
}

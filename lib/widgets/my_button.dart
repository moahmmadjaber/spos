import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Color color;
  final Text text;
  final VoidCallback onPressed;
  final IconData? icon;
  final Color iconColor;

  const MyButton({Key? key,
  required this.color,
    required this.text,
    required this.onPressed,
    this.icon,
    this.iconColor = Colors.white
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 5,
        color : color,
        borderRadius: BorderRadius.circular(10),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200,
          height: 42,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              text,
              const SizedBox(width: 10,),
              icon != null ? Icon(icon,color: iconColor,) : Container()
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomSecondButton extends StatelessWidget {
  const CustomSecondButton({Key? key, required this.label, this.onPressed})
      : super(key: key);

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: TextButton(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

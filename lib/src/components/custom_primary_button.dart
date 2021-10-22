import 'package:flutter/material.dart';

class CustomPromaryButton extends StatelessWidget {
  const CustomPromaryButton(
      {Key? key, this.onPressed, required this.label, this.icon, this.padding})
      : super(key: key);

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.5, 1],
              colors: [Color(0xFFF32CD32), Color(0xFFF3CB371)]),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: SizedBox.expand(
        child: TextButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              Padding(
                padding: padding ?? const EdgeInsets.symmetric(horizontal: 100),
                child: Text(
                  label,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}

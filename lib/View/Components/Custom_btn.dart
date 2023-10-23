import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double width;
  final double height;
  final double borderRadius;

  CustomButton({
    required this.text,
    required this.onPressed,
    this.backgroundColor = const Color(0xff02348a),
    this.textColor = Colors.white,
    this.width = 120, // Custom width (default is 150.0)
    this.height = 40, // Custom height (default is 50.0)
    this.borderRadius = 10.0, // Custom border radius (default is 10.0)
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          onPrimary: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(text),
      ),
    );
  }
}


import 'package:flutter/material.dart';

class ButtonTile extends StatelessWidget {
  final String text;
  final double? height;

  final double? width;
  final VoidCallback? onTap;
  final double? radius;
  final double? fontSize;
  const ButtonTile(
      {super.key,
      required this.text,
      this.height,
      this.width,
      required this.onTap,
      this.radius,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 50,
        width: width ?? 218,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 30),
          color: const Color(0xFFF29D38),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: fontSize ?? 24,
                color: Colors.black),
          ),
        ),
      ),
    );
  }
}

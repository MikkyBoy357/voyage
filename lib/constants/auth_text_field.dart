import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthTextField extends StatelessWidget {
  final Widget? icon;
  final String hintText;
  final double? width;
  final double? height;
  final Color? color;
  final double? radius;
  final Color? textColor;
  final Color? borderColor;
  final Color? hintTextColor;
  final EdgeInsetsGeometry? padding;
  final double? size;
  final FontWeight? fontWeight;
  final double? borderWidth;
  const AuthTextField(
      {super.key,
      required this.icon,
      required this.hintText,
      this.width,
      this.color,
      this.radius,
      this.hintTextColor,
      this.padding,
      this.size,
      this.height,
      this.textColor,
      this.borderColor,
      this.fontWeight,
      this.borderWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: width ?? double.infinity,
      child: TextField(
        style: TextStyle(
          color: textColor ?? Colors.white,
        ),
        decoration: InputDecoration(
          prefixIcon: icon,
          // prefixIconConstraints: BoxConstraints(maxWidth: constraint ?? 60),
          hintText: hintText,
          hintStyle: GoogleFonts.roboto(
            color: hintTextColor ?? const Color(0xFFE4DDDD),
            fontWeight: fontWeight ?? FontWeight.w400,
            fontSize: size ?? 14.5,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 10),
            borderSide: BorderSide(
              width: borderWidth ?? 0,
              color: borderColor ?? const Color(0xFF383636),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 10),
            borderSide: BorderSide(
              width: borderWidth ?? 0,
              color: borderColor ?? const Color(0xFF383636),
            ),
          ),
          filled: true,
          fillColor: color ?? const Color(0xFF383636),
          contentPadding: padding ?? const EdgeInsets.all(0),
        ),
      ),
    );
  }
}

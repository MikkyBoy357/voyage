import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthTextField extends StatelessWidget {
  final Widget icon;
  final String hintText;
  const AuthTextField({super.key, required this.icon, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: double.infinity,
      child: TextField(
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          prefixIcon: icon,
          hintText: hintText,
          hintStyle: GoogleFonts.roboto(
            color: const Color(0xFFE4DDDD),
            fontWeight: FontWeight.w400,
            fontSize: 14.5,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 0,
              color: Color(0xFF383636),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 0,
              color: Color(0xFF383636),
            ),
          ),
          filled: true,
          fillColor: const Color(0xFF383636),
        ),
      ),
    );
  }
}

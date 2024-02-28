import 'package:flutter/material.dart';
import 'package:voyage/constants/button_tile.dart';
import 'package:voyage/constants/icon_tile.dart';
import 'package:voyage/constants/images.dart';
import 'package:voyage/screens/sign_in_screen.dart';

import '../constants/auth_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.darken),
          image: AssetImage(bg),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 39.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 90,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    const Text(
                      'Crée\nun compte',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                    IconTile(
                      path: locationIcon,
                      height: 50,
                      width: 50,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const AuthTextField(
                  hintText: 'Enter email address',
                  icon: Icon(
                    Icons.person,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                AuthTextField(
                  hintText: 'Enter password',
                  icon: IconTile(path: passwordIcon),
                ),
                const SizedBox(
                  height: 50,
                ),
                AuthTextField(
                  hintText: 'Confirm password',
                  icon: IconTile(path: passwordIcon),
                ),
                const SizedBox(
                  height: 50,
                ),
                infoText(),
                const SizedBox(
                  height: 28,
                ),
                Center(
                  child: ButtonTile(
                    text: 'Register',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SignInScreen(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 27,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'i already have an',
                      style: TextStyle(
                        color: Color(0xFFE4DDDD),
                        fontSize: 15,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SignInScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        ' account!',
                        style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 31,
                ),
                IconTile(
                  path: googleIcon,
                  height: 50,
                  width: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget infoText() {
    return RichText(
      text: const TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: 'By Clicking the ',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          TextSpan(
            text: 'Register',
            style: TextStyle(
              color: Colors.indigo,
              fontSize: 15,
            ),
          ),
          TextSpan(
            text: '  button , you agree to the privacy policy',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

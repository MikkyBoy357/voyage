import 'package:flutter/material.dart';
import 'package:voyage/constants/button_tile.dart';
import 'package:voyage/constants/images.dart';

import '../constants/auth_text_field.dart';
import '../constants/icon_tile.dart';
import '../constants/navigation.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
                      'Se\nconnecter',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        height: 1.2,
                        color: Colors.white,
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
                  height: 50,
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
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot',
                      style: TextStyle(
                        color: Color(0xFFE4DDDD),
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      ' password!',
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonTile(
                  text: 'Login',
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const NavBar(),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Have an account already ? ',
                      style: TextStyle(
                        color: Color(0xFFE4DDDD),
                        fontSize: 15,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        ' Register!',
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
}

import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:voyage/screens/sign_in_screen.dart';

import '../constants/local_database/token_manager.dart';
import '../constants/navigation.dart';

class WrapperScreen extends StatefulWidget {
  const WrapperScreen({super.key});

  @override
  State<WrapperScreen> createState() => _WrapperScreenState();
}

class _WrapperScreenState extends State<WrapperScreen> {
  @override
  void initState() {
    super.initState();
    checkToken();

    // TODO: fetch token from db; check if token is null and nav to login
    // TODO: if not null, check user type and navigate to home page,
  }

  Future<void> checkToken() async {
    final token = await TokenManager.getToken('auth_token');
    print('Retrieved token: $token');

    if (token != null && token.isNotEmpty) {
      if (!JwtDecoder.isExpired(token)) {
        print('Token is valid and not expired');
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => NavBar(token: token)),
          (route) => false,
        );
      } else {
        print('Token is expired');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => SignInScreen()),
        );
      }
    } else {
      TokenManager.removeToken('auth_token');

      print('Token is null or empty');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => SignInScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Loading..."),
      ),
    );
  }
}

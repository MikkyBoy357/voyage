import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:voyage/constants/api_url.dart';
import 'package:voyage/constants/local_database/token_manager.dart';

import '../../constants/info_snackbar.dart';
import '../../constants/navigation.dart';
import '../../models/user_model.dart';

class AuthViewModel extends ChangeNotifier {
  UserModel? currentUser;
  GlobalKey<FormState> signupKey = GlobalKey<FormState>();
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  String id = '';
  String firstName = '';
  String lastName = '';
  String phoneNumber = '';
  String emailAddress = '';
  String address = '';
  String password = '';

  String loginEmail = '';
  String loginPassword = '';

  void setLoginEmail(String value) {
    loginEmail = value;
    notifyListeners();
  }

  void setLoginPassword(String value) {
    loginPassword = value;
    notifyListeners();
  }

  void setFirstName(String value) {
    firstName = value;
    notifyListeners();
  }

  void setAddress(String value) {
    address = value;
    notifyListeners();
  }

  void setLastName(String value) {
    lastName = value;
    notifyListeners();
  }

  void setPhoneNumber(String value) {
    phoneNumber = value;
    notifyListeners();
  }

  void setEmailAddress(String value) {
    emailAddress = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  Future<void> signUp(BuildContext context, String type) async {
    if ((signupKey.currentState?.validate() ?? false) == false) {
      log("Wrong Data");
      return infoSnackBar(context, 'InValid Data');
    }

    try {
      final Map<String, dynamic> data = {
        'email': emailAddress,
        'password': password,
        'type': 'tourist',
        'address': address,
        'lastName': lastName,
        'firstName': firstName,
        'phone': phoneNumber,
        'id': id,
        'status': 'Online',
      };

      final response = await http.post(
        Uri.parse('$authUrl/signup'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );
      if (response.statusCode == 201) {
        final responseBody = response.body;
        log('Response === > ${jsonDecode(responseBody)}');
        infoSnackBar(context, 'SignUp Successful', Colors.green);

        return jsonDecode(response.body);
      } else if (response.statusCode == 409) {
        log('User with this email already exists');
      } else {
        log('Failed to sign up');
      }
    } catch (error) {
      log('Failed to sign up : $error');
    }
  }

  Future<void> logIn(BuildContext context) async {
    if (!loginKey.currentState!.validate()) {
      infoSnackBar(context, 'Invalid Data');
      return;
    }

    try {
      final Map<String, dynamic> loginData = {
        'email': loginEmail,
        'password': loginPassword,
      };

      final response = await http.post(
        Uri.parse('$authUrl/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(loginData),
      );

      if (response.statusCode == 200) {
        // Login successful
        final responseBody = jsonDecode(response.body);
        final token = responseBody['token'];
        final user = responseBody['user'];

        await TokenManager.setToken('auth_token', token);
        print('=====>Login Token $token');
        print('====> user $user');

        final UserModel userModel = UserModel.fromJson(user);
        currentUser = userModel;
        print('userModel : $userModel');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => NavBar(token: token),
          ),
        );
        infoSnackBar(context, 'Login Successful', Colors.green);
      } else {
        log('Failed to Login: ${response.body}');
        infoSnackBar(context, 'Failed to Login');
      }
    } catch (error) {
      log('Failed to Login: $error');
      infoSnackBar(context, 'Failed to Login');
    }
  }
}

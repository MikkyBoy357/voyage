import 'package:flutter/material.dart';
import 'package:voyage/constants/auth_text_field.dart';
import 'package:voyage/constants/button_tile.dart';
import 'package:voyage/constants/images.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5), BlendMode.saturation),
          image: AssetImage(profileBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: const Color(0xffF29D38),
          title: Text(
            "Modifiez votre  profile",
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 26, vertical: 26),
          child: Column(
            children: [
              AuthTextField(
                icon: null,
                hintText: 'Nom',
                hintTextColor: Colors.black54,
                size: 20,
                color: Colors.white,
                borderColor: Colors.black,
                borderWidth: 1.2,
                radius: 30,
                padding: EdgeInsets.symmetric(horizontal: 20),
                fontWeight: FontWeight.w300,
              ),
              SizedBox(
                height: 30,
              ),
              AuthTextField(
                icon: null,
                hintText: 'Email',
                hintTextColor: Colors.black54,
                size: 20,
                color: Colors.white,
                borderColor: Colors.black,
                borderWidth: 1.2,
                radius: 30,
                padding: EdgeInsets.symmetric(horizontal: 20),
                fontWeight: FontWeight.w300,
              ),
              SizedBox(
                height: 58,
              ),
              ButtonTile(
                text: 'Enregistrez',
                fontSize: 20,
                height: 33,
                width: 146,
                radius: 10,
                borderSide: Border.all(color: Colors.black),
                onTap: () {},
              ),
              SizedBox(
                height: 300,
              ),
              ButtonTile(
                text: 'Se deconecter',
                fontSize: 20,
                height: 33,
                width: 176,
                radius: 10,
                borderSide: Border.all(color: Colors.black),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

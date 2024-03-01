import 'package:flutter/material.dart';
import 'package:voyage/constants/button_tile.dart';

import '../constants/icon_tile.dart';
import '../constants/images.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
          toolbarHeight: 60,
          automaticallyImplyLeading: false,
          // leading: IconButton(
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          //   icon: IconTile(
          //     path: backIcon,
          //     height: 30,
          //     width: 30,
          //   ),
          // ),
          title: const Text(
            'Modifiez votre  profile',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFFF29D38),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          child: Column(
            children: [
              // Container(),
              const SizedBox(
                height: 29,
              ),
              textField(
                  hintText: 'Entrez le Nom de votre Agence', isVisible: false),
              const SizedBox(
                height: 31,
              ),
              textField(
                  hintText: 'Decrivez votre agence en 500 mots maximum',
                  maxLine: 9,
                  isVisible: false),
              const SizedBox(
                height: 28,
              ),
              textField(hintText: 'Televerser votre Logo', isVisible: true),
              const SizedBox(
                height: 28,
              ),
              textField(
                hintText: 'Televerser votre photo de couverture',
                maxLine: 2,
                hintTextHeight: 1.2,
                isVisible: true,
              ),
              const SizedBox(
                height: 28,
              ),
              textField(
                hintText: 'Televerser une video de presentation',
                maxLine: 2,
                hintTextHeight: 1.2,
                isVisible: true,
              ),
              const SizedBox(
                height: 28,
              ),
              ButtonTile(
                text: 'Enregistrez',
                height: 33,
                width: 146,
                radius: 10,
                fontSize: 20,
                onTap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textField({
    required String hintText,
    int? maxLine,
    double? hintTextHeight,
    required bool isVisible,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Center(
        child: TextField(
          maxLines: maxLine ?? 1,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(
                horizontal: 20, vertical: maxLine != null ? 10 : 9),
            hintStyle: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.w300,
              height: hintTextHeight ?? 1.5,
              fontSize: 20,
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: isVisible ? 8.0 : 0.0),
              child: Visibility(
                visible: isVisible,
                child: IconButton(
                  onPressed: () {},
                  icon: IconTile(
                    path: sendForwardIcon,
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
            ),
            // suffixIconConstraints: BoxConstraints(
            //   maxHeight: 30,
            //   maxWidth: 100,
            //   minWidth: 3,
            // )
          ),
        ),
      ),
    );
  }
}

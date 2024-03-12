import 'package:flutter/material.dart';
import 'package:voyage/screens/sign_up_screen.dart';

import '../constants/button_tile.dart';
import '../constants/images.dart';

class SelectAccountScreen extends StatelessWidget {
  const SelectAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.8), BlendMode.darken),
            image: AssetImage(bg),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://s3-alpha-sig.figma.com/img/2734/fe07/eb55c3f93c73deb24294707e9208a699?Expires=1711324800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Ut2pLioebNm3jatgKz6~pClE-c~LIgbmgZTptvjNZgrtCXMdwxgm1ADHSPWG9aP9z-ljSfpozsEAPx3oMcxWFo6j8mwvmcktoABCV9juv4GIZ1qc95uT0cTcOyxG71SjRP3XrMqcPJ78jxgxGt2-IiEc7OAxhbxnohmUvn1-srmweLyXGzsD6~p119o4ua16v-b0-IDXoP90bTd1AjE6-mCYGc-9TaA3DNK4aXvjPpPA5FALq-83wUm52fK2Z94Vi~XMPPa8p2R-A3Gef2lBImeIZEan3~mDJlLnXHNIIut5usDO1-Geu31eWx7NN3zRF4rkOXGV4b9VazU0lBz9HA__',
              height: 44,
              width: 122,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 85,
            ),
            ButtonTile(
              text: 'Visiter',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SignUpScreen(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 29,
            ),
            ButtonTile(
              text: 'Guider',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SignUpScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

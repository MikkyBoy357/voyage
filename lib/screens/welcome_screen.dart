import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:voyage/constants/button_tile.dart';
import 'package:voyage/screens/select_account_screen.dart';

import '../constants/images.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter:
                const ColorFilter.mode(Colors.black38, BlendMode.colorBurn),
            image: AssetImage(bg),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 79),
          child: Column(
            children: [
              Image.network(
                'https://s3-alpha-sig.figma.com/img/2734/fe07/eb55c3f93c73deb24294707e9208a699?Expires=1711324800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Ut2pLioebNm3jatgKz6~pClE-c~LIgbmgZTptvjNZgrtCXMdwxgm1ADHSPWG9aP9z-ljSfpozsEAPx3oMcxWFo6j8mwvmcktoABCV9juv4GIZ1qc95uT0cTcOyxG71SjRP3XrMqcPJ78jxgxGt2-IiEc7OAxhbxnohmUvn1-srmweLyXGzsD6~p119o4ua16v-b0-IDXoP90bTd1AjE6-mCYGc-9TaA3DNK4aXvjPpPA5FALq-83wUm52fK2Z94Vi~XMPPa8p2R-A3Gef2lBImeIZEan3~mDJlLnXHNIIut5usDO1-Geu31eWx7NN3zRF4rkOXGV4b9VazU0lBz9HA__',
                height: 44,
                width: 122,
                fit: BoxFit.contain,
              ),
              const Spacer(),
              ButtonTile(
                text: 'Explorer',
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SelectAccountScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget svgTile(String path) {
    return SvgPicture.asset(
      path,
      height: 24,
      width: 24,
      // color: Colors.black,
    );
  }
}

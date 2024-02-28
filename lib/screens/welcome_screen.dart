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
                'https://s3-alpha-sig.figma.com/img/2734/fe07/eb55c3f93c73deb24294707e9208a699?Expires=1710115200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=iLvhyToA99qOgOE-3wxbwvG-qsFRVg3ReV4ZU~yEndlmZ35j1-hJmEHupULITc7e8MmoYuCD77nMOTgQfilCmGZbGGzFGWbOcqlMuVfGQlQedS-AyeWbF8U8XIBatdPGhooR0jYLXV3MDANpOh6qza1LwFiFXS-FNDpmSfoRpz5Qss7mdIA4gG8nB6kH~kZgbzIbb52m~7W7WaTBYTBa3qyFnYaQQflmEt--K-eMb~-tgE1hecfSl0Sh2-nXVafu1GNYughbHAstdq5StSg60JGILkmyWNJyPAssQFqJD~oYV4uBbS2Q5giKVWHHNJ6i9BP-zljPj9T0dmoOCxaqVA__',
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

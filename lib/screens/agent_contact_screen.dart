import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voyage/constants/auth_text_field.dart';
import 'package:voyage/constants/icon_tile.dart';
import 'package:voyage/constants/images.dart';
import 'package:voyage/screens/chat_screen.dart';

class AgentContactScreen extends StatelessWidget {
  const AgentContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.white,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 34.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://s3-alpha-sig.figma.com/img/2734/fe07/eb55c3f93c73deb24294707e9208a699?Expires=1710115200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=iLvhyToA99qOgOE-3wxbwvG-qsFRVg3ReV4ZU~yEndlmZ35j1-hJmEHupULITc7e8MmoYuCD77nMOTgQfilCmGZbGGzFGWbOcqlMuVfGQlQedS-AyeWbF8U8XIBatdPGhooR0jYLXV3MDANpOh6qza1LwFiFXS-FNDpmSfoRpz5Qss7mdIA4gG8nB6kH~kZgbzIbb52m~7W7WaTBYTBa3qyFnYaQQflmEt--K-eMb~-tgE1hecfSl0Sh2-nXVafu1GNYughbHAstdq5StSg60JGILkmyWNJyPAssQFqJD~oYV4uBbS2Q5giKVWHHNJ6i9BP-zljPj9T0dmoOCxaqVA__',
                height: 40,
                width: 122,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                width: 11,
              ),
              IconTile(
                path: chatIcon,
                height: 40,
                width: 40,
              ),
            ],
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              stops: [0.0013, 0.9],
              colors: [
                Color(0xFF0C0B0B),
                Color(0xFFB1ABAB),
              ],
            ),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30.0),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 22,
            ),
            const AuthTextField(
              icon: Padding(
                padding: EdgeInsets.only(left: 20, right: 10),
                child: Icon(
                  CupertinoIcons.search,
                  size: 30,
                ),
              ),
              hintText: 'Search',
              height: 50,
              width: 317,
              radius: 30,
              hintTextColor: Colors.black38,
              size: 20,
              color: Color(0xFFD9D9D9),
              borderColor:  Color(0xFFD9D9D9),
            ),
            const SizedBox(
              height: 9,
            ),
            contactList()
          ],
        ),
      ),
    );
  }

  Widget rowTile({required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 65,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 29),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconTile(
              path: profileIcon,
              height: 40,
              width: 40,
            ),
            const SizedBox(
              width: 24,
            ),
            const Text(
              'Nom de L’agence',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            const CircleAvatar(
              radius: 6,
              backgroundColor: Colors.orangeAccent,
            ),
          ],
        ),
      ),
    );
  }

  Widget contactList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Column(
            children: [
              rowTile(onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChatScreen()));
              }),
              const Divider(
                thickness: 1,
                indent: 70,
                color: Colors.black,
              ),
            ],
          );
        });
  }
}

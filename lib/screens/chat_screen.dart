import 'package:flutter/material.dart';
import 'package:voyage/screens/edit_profile_screen.dart';

import '../constants/icon_tile.dart';
import '../constants/images.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF29D38),
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditProfileScreen(),
              ),
            );
          },
          child: Row(
            children: [
              IconTile(
                path: profileIcon,
                height: 40,
                width: 40,
              ),
              SizedBox(width: 10),
              Text("Agencies name"),
              SizedBox(width: 10),
              const CircleAvatar(
                radius: 6,
                backgroundColor: Colors.lightGreenAccent,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.darken),
            image: AssetImage(chatBg),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              ListView.separated(
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 15);
                },
                itemBuilder: (context, index) {
                  return const SenderBubble();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SenderBubble extends StatelessWidget {
  const SenderBubble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconTile(
          path: profileIcon,
          height: 40,
          width: 40,
        ),
        const SizedBox(width: 15),
        Container(
          width: size.width / 1.5,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            "when an unknown printer took a galley of type and scrambled it to make a type specimen book",
            maxLines: 6,
          ),
        ),
      ],
    );
  }
}

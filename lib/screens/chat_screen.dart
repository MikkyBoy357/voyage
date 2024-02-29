import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(
              CupertinoIcons.profile_circled,
              size: 35,
            ),
            SizedBox(width: 10),
            Text("Agencies name"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
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
        const Icon(
          CupertinoIcons.profile_circled,
          size: 35,
        ),
        const SizedBox(width: 15),
        Container(
          width: size.width / 1.5,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.grey[400],
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voyage/screens/agent_contact_screen.dart';

class AgentDetailScreen extends StatelessWidget {
  final String aName;
  final String aDescription;
  const AgentDetailScreen({super.key, required this.aName, required this.aDescription});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height / 3.75,
              color: Colors.brown[400],
              child: Column(
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    centerTitle: true,
                    title: const Icon(
                      CupertinoIcons.profile_circled,
                      size: 35,
                    ),
                  ),
                   Text(
                   aName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star_border, color: Colors.yellow),
                      Icon(Icons.star_border, color: Colors.yellow),
                      Icon(Icons.star_border, color: Colors.yellow),
                      Icon(Icons.star_border, color: Colors.yellow),
                      Icon(Icons.star_border, color: Colors.yellow),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    aDescription,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const AgentContactScreen();
                            },
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF29D38),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text(
                          "Contact",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Feedbacks",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ListView.separated(
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 15);
                    },
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            width: size.width / 1.3,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.star_outlined,
                                        color: Colors.yellow),
                                    Icon(Icons.star_outlined,
                                        color: Colors.yellow),
                                    Icon(Icons.star_half_outlined,
                                        color: Colors.yellow),
                                    Icon(Icons.star_border,
                                        color: Colors.yellow),
                                    Icon(Icons.star_border,
                                        color: Colors.yellow),
                                  ],
                                ),
                                Text(
                                  "King",
                                  maxLines: 1,
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "i had a very good trip , i recommend this agency",
                                  maxLines: 4,
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            CircleAvatar(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.message),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                // width: size.width / 1.5,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: const Row(
                  children: [
                    Expanded(
                      child: Text(
                        "share your experience with this agency",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

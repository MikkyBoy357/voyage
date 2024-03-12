import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voyage/screens/agent_detail_screen.dart';

import '../constants/icon_tile.dart';
import '../constants/images.dart';
import '../models/destination_model.dart';

class DetailsScreen extends StatelessWidget {
  final String title;
  final String description;
  final List<DestinationAgencyModel> destination;

  const DetailsScreen(
      {super.key,
      required this.title,
      required this.description,
      required this.destination});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: size.width,
                  height: size.height / 2.2,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://s3-alpha-sig.figma.com/img/f497/3dc1/6588a82aebd25636266225e437d08c38?Expires=1711324800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=XoVlvz6EKQbVZUWU8VODjgPqEg7nV~ppwyNjj1ZUZOsC6nR85N-LwbWqnHEgKQGmrRu~j0v7fd1TgW2IDB-4sBU53LOFqC~oVQbML5MYx~qalnbOqWrTGYlBlY9NpOdnoccykE4QDOUF2019U-CHrN2EYpLcMZ3~NEpiVndUdT2oVZkuiHjbD0U7G4a6L9oZ0S95qzYxUAXMHKUVkNAvdfnhcHsyTY9UNJWOubCT8EagLXLK6SePiS1p9dHYAiE2eBQJ-dZ2LlaGSZf3vBo3o-vSO-qi9JoYqP1PmH~fT7a~auIicxeOpJIntuaslHLhwxSoXGwl6x3aPRjmrYTPuA__"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconTile(path: locationIcon),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        "Tanougou",
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Visiter avec:",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ListView.separated(
                    itemCount: destination.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 5);
                    },
                    itemBuilder: (context, index) {
                      final data = destination[index];
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return AgentDetailScreen(
                                  aName: data.name,
                                  aDescription: data.description,
                                );
                              },
                            ),
                          );
                        },
                        leading: const Icon(
                          CupertinoIcons.profile_circled,
                          size: 30,
                        ),
                        title: Text(
                          data.name,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:voyage/constants/icon_tile.dart';
import 'package:voyage/constants/images.dart';
import 'package:voyage/screens/details_screen.dart';
import 'package:voyage/view-model/providers/destination_provider.dart';

class HomeScreen extends StatefulWidget {
  final String token;
  const HomeScreen({super.key, required this.token});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String name;
  late String firstName;
  late String email;
  @override
  void initState() {
    super.initState();
    Map<String, dynamic> decodeJwtToken = JwtDecoder.decode(widget.token);

    firstName = decodeJwtToken['firstName'];
    print('First Name ==> $firstName');

    email = decodeJwtToken['email'];
    name = email.split('@')[0];
    name = name[0].toUpperCase() + name.substring(1);
    print('Name ===> $name');
    print('Name ===> $email');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    print('=>> ${widget.token}');

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconTile(path: locationIcon),
            const SizedBox(
              width: 9,
            ),
            const Text("Bénin"),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.location_on,
                color: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Consumer<DestinationProvider>(
            builder: (context, destinationProvider, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Container(
                width: size.width,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.search,
                        color: Colors.black,
                      ),
                    ),
                    const Text("Search"),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                  children: <TextSpan>[
                    const TextSpan(text: 'Bonjour '),
                    TextSpan(
                      text: '$firstName',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(text: ' , Explore le Bénin'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              FutureBuilder(
                future: destinationProvider.fetchDestinations(widget.token),
                builder: (context, snapshot) {
                  if (destinationProvider.destinations.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return ListView.separated(
                      itemCount: destinationProvider.destinations.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 20);
                      },
                      itemBuilder: (context, index) {
                        final data = destinationProvider.destinations[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return DetailsScreen(
                                    title: data.title,
                                    description: data.description,
                                    destination: data.agencies,
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            width: size.width,
                            height: size.height / 2.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(
                                color: Colors.black,
                              ),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "https://s3-alpha-sig.figma.com/img/f497/3dc1/6588a82aebd25636266225e437d08c38?Expires=1711324800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=XoVlvz6EKQbVZUWU8VODjgPqEg7nV~ppwyNjj1ZUZOsC6nR85N-LwbWqnHEgKQGmrRu~j0v7fd1TgW2IDB-4sBU53LOFqC~oVQbML5MYx~qalnbOqWrTGYlBlY9NpOdnoccykE4QDOUF2019U-CHrN2EYpLcMZ3~NEpiVndUdT2oVZkuiHjbD0U7G4a6L9oZ0S95qzYxUAXMHKUVkNAvdfnhcHsyTY9UNJWOubCT8EagLXLK6SePiS1p9dHYAiE2eBQJ-dZ2LlaGSZf3vBo3o-vSO-qi9JoYqP1PmH~fT7a~auIicxeOpJIntuaslHLhwxSoXGwl6x3aPRjmrYTPuA__"),
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: size.width,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(30),
                                        bottomRight: Radius.circular(30),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.title,
                                          maxLines: 1,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            IconTile(path: locationIcon),
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
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
            ],
          );
        }),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voyage/constants/icon_tile.dart';
import 'package:voyage/constants/images.dart';
import 'package:voyage/screens/details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
        child: Column(
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
              text: const TextSpan(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
                children: <TextSpan>[
                  TextSpan(text: 'Bonjour '),
                  TextSpan(
                    text: 'King',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: ' , Explore le Bénin'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ListView.separated(
              itemCount: 5,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return const SizedBox(height: 20);
              },
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const DetailsScreen();
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
                                    "https://s3-alpha-sig.figma.com/img/f497/3dc1/6588a82aebd25636266225e437d08c38?Expires=1709510400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=nd9yzOMYGiF-MVbyvn~lxvEVikltyQtAbbo~W8EIcF6eHh0x4RqgDzKLN3mawaay24Tqsqe-UAaBlMFnY4MpU41jDVAl4FEC-7YG-Aergb~eYgbPDSzUn~BMikMKiv~RO6AZnurXsMo7wHo93Qj1kb6voBT9J8ZaMXlwV80EYmGYJJaNUlT~qXjvJX6nx55Oh8Z7rFBjHEXNOnwpzkFc~to1mPAoGxLKoBwAZod-GMkDKZz94j20vdfcjLvPMd0pPtQKUMvcvnvPXuyZI6tifNbTYc49Qq0Zg7XOi-6ENQPrjyhijoFH0I1Fud7ZCDoTHgAMn6N57nHovxuR1A2rdA__"),
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Les Chutes de Tanougou",
                                  maxLines: 1,
                                  style: TextStyle(
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
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

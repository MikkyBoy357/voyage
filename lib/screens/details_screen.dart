import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voyage/screens/agent_detail_screen.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

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
                          "https://s3-alpha-sig.figma.com/img/f497/3dc1/6588a82aebd25636266225e437d08c38?Expires=1709510400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=nd9yzOMYGiF-MVbyvn~lxvEVikltyQtAbbo~W8EIcF6eHh0x4RqgDzKLN3mawaay24Tqsqe-UAaBlMFnY4MpU41jDVAl4FEC-7YG-Aergb~eYgbPDSzUn~BMikMKiv~RO6AZnurXsMo7wHo93Qj1kb6voBT9J8ZaMXlwV80EYmGYJJaNUlT~qXjvJX6nx55Oh8Z7rFBjHEXNOnwpzkFc~to1mPAoGxLKoBwAZod-GMkDKZz94j20vdfcjLvPMd0pPtQKUMvcvnvPXuyZI6tifNbTYc49Qq0Zg7XOi-6ENQPrjyhijoFH0I1Fud7ZCDoTHgAMn6N57nHovxuR1A2rdA__"),
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
                  const Text(
                    "Title",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
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
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 5);
                    },
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const AgentDetailScreen();
                              },
                            ),
                          );
                        },
                        leading: const Icon(
                          CupertinoIcons.profile_circled,
                          size: 30,
                        ),
                        title: const Text(
                          "Agencies name",
                          style: TextStyle(
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

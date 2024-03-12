import 'package:flutter/material.dart';
import 'package:voyage/constants/icon_tile.dart';
import 'package:voyage/constants/images.dart';
import 'package:voyage/screens/home_screen.dart';

import '../screens/profile_screen.dart';

class NavBar extends StatefulWidget {
  final String token;
  const NavBar({super.key, required this.token});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;
  late List<Widget> screens;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    screens = [
      HomeScreen(token: widget.token),
      const Center(
        child: Text(
          'Not yet implemented',
          style: TextStyle(color: Colors.red),
        ),
      ),
      const ProfileScreen(),
    ];

    print('Token ====> ${widget.token}');
  }

  // final List<Widget> screens = [
  //   HomeScreen(
  //     token: widget.token,
  //   ),
  //   const Center(
  //     child: Text(
  //       'Not yet implemented',
  //       style: TextStyle(color: Colors.red),
  //     ),
  //   ),
  //   const ProfileScreen(),
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: screens[_currentIndex],
          ),
        ],
      ),
      bottomNavigationBar: ClipPath(
        // clipper: const ShapeBorderClipper(
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.all(
        //       Radius.circular(0),
        //     ),
        //   ),
        // ),
        child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: MediaQuery.of(context).size.width / 0.04,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            border: const Border(
              top: BorderSide(
                color: Colors.black,
                width: 1.2,
              ),
            ),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              navButton(
                onTap: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
                iconPath: homeIcon,
                currentIndex: 0,
              ),
              navButton(
                onTap: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                },
                iconPath: chatIcon,
                currentIndex: 1,
              ),
              navButton(
                onTap: () {
                  setState(() {
                    _currentIndex = 2;
                  });
                },
                iconPath: profileIcon,
                currentIndex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  navButton({
    required VoidCallback onTap,
    required String iconPath,
    required int currentIndex,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconTile(
            path: iconPath,
            height: 35,
            width: 50,
          ),
          const SizedBox(
            height: 5,
          ),
          Visibility(
            visible: _currentIndex == currentIndex,
            child: Container(
              height: 1,
              width: 30,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/page/explore.dart';
import 'package:movie_app/page/home.dart';
import 'package:movie_app/page/profile.dart';
import 'package:movie_app/page/saved.dart';

class Navbar extends StatefulWidget {
  Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int currIndex = 0;
  List<Widget> pages = [
    HomePage(),
    ExplorePage(),
    SavedPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          index: currIndex,
          items: [
            Icon(Icons.home_outlined, size: 30), //index 0
            Icon(Icons.search, size: 30), //index 1
            Icon(Icons.bookmark_outline, size: 30), //index 2
            Icon(Icons.person_outline, size: 30), //index 3
          ],
          onTap: (value) {
            setState(() {
              currIndex = value;
            });
          },
        ),
        body: pages[currIndex],
      ),
    );
  }
}

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tracker/constants.dart';
import 'package:tracker/pages/chat_page.dart';
import 'package:tracker/pages/home_page.dart';
import 'package:tracker/pages/profile_page.dart';
import 'package:tracker/pages/projects_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void navigateTo(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const HomePage(),
    const ProjectsPage(),
    const ChatPage(),
    const ProfilePage(),
  ];

  final iconList = <IconData>[
    Icons.home_rounded,
    Icons.folder_rounded,
    Icons.message_rounded,
    Icons.person_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        height: 80,
        itemCount: _pages.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? primaryColor : grey4;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconList[index],
                size: 24,
                color: color,
              ),
            ],
          );
        },
        activeIndex: _selectedIndex,
        gapLocation: GapLocation.none,
        elevation: 60,
        onTap: (index) => {
          setState(() => _selectedIndex = index),
        },
        scaleFactor: .2,
      ),
    );
  }
}

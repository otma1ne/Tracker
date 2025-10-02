import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracker/constants.dart';
import 'package:tracker/pages/chat_page.dart';
import 'package:tracker/pages/home_page.dart';
import 'package:tracker/pages/profile_page.dart';
import 'package:tracker/pages/projects_page.dart';
import 'package:tracker/routes/routes.dart';

class BottomSheetOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const BottomSheetOption({
    required this.icon,
    required this.title,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.black87),
              const SizedBox(width: 16),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

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

  void navigateTo(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildModalContent(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 5,
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: 40,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.fromLTRB(24.0, 16.0, 24.0, mediaQuery.padding.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BottomSheetOption(
                icon: Icons.edit_rounded,
                title: 'Create Task',
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(AppRoutes.addProject);
                },
              ),
              BottomSheetOption(
                icon: Icons.add_circle_outline_rounded,
                title: 'Create Project',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              BottomSheetOption(
                icon: Icons.group_rounded,
                title: 'Create Team',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              BottomSheetOption(
                icon: Icons.access_time_rounded,
                title: 'Create Event',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 32),
              FloatingActionButton(
                backgroundColor: primaryColor,
                onPressed: () => Navigator.pop(context),
                child: const Icon(Icons.close, size: 30),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: false,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
            ),
            builder: (context) => _buildModalContent(context),
          );
        },
        child: const Icon(Icons.add, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        backgroundColor: Colors.white,
        height: 80,
        itemCount: iconList.length,
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
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        elevation: 60,
        onTap: (index) => navigateTo(index),
        scaleFactor: .2,
      ),
    );
  }
}

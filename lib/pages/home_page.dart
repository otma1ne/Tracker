import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracker/constants.dart';
import 'package:intl/intl.dart';
import 'package:tracker/widgets/task_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(
    viewportFraction: .8,
  );
  int _currentPage = 0;

  String getCurrentDay() {
    final now = DateTime.now();
    return DateFormat('EEEE, d').format(now);
  }

  final List<Map<String, dynamic>> cards = [
    {'title': 'Application Design', 'category': 'Ui Design', 'progress': 20},
    {'title': 'Build a Flutter App', 'category': 'Flutter', 'progress': 40},
    {'title': 'Create a Logo', 'category': 'Logo Design', 'progress': 65},
    {'title': 'User Research', 'category': 'Research', 'progress': 10},
    {'title': 'Prototyping', 'category': 'UX Design', 'progress': 50},
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: Center(
          child: Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: grey5,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(99),
            ),
            child: IconButton(
              icon: Icon(
                Icons.space_dashboard_outlined,
                size: 20,
                color: secondaryColor,
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ),
        title: Text(getCurrentDay()),
        centerTitle: true,
        actions: [
          Center(
            child: Container(
              height: 40,
              width: 40,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: grey5,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(99),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.notifications_outlined,
                  size: 20,
                  color: secondaryColor,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Let’s make a \nhabits together  🙌',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: secondaryColor,
                  ),
                ),
                const SizedBox(height: defaultPadding * 1.5),
                SizedBox(
                  height: 160,
                  child: PageView.builder(
                    padEnds: false,
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() => _currentPage = index);
                    },
                    itemCount: cards.length,
                    itemBuilder: (context, index) {
                      final card = cards[index];
                      return TaskCard(
                        title: card['title']!,
                        category: card['category']!,
                        progress: card['progress']!,
                        isActive: index == _currentPage,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/images/ellipse.png',
              width: size.width,
              height: 120,
            ),
          ),
        ],
      ),
    );
  }
}

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
                const SizedBox(height: defaultPadding * 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'In Progress',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: secondaryColor,
                      ),
                    ),
                    const SizedBox(width: defaultPadding),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 28,
                      color: secondaryColor,
                      weight: 0.1,
                    ),
                  ],
                ),
                const SizedBox(height: defaultPadding),
                SizedBox(
                  width: double.infinity,
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (__, index) {
                      final card = cards[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1.0,
                          ),
                          borderRadius:
                              BorderRadius.circular(defaultBorderRadius),
                          color: Colors.white,
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(defaultPadding),
                          onTap: () => {},
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    card['category']!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: grey2,
                                    ),
                                  ),
                                  Text(
                                    card['title']!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: secondaryColor,
                                    ),
                                  ),
                                  const SizedBox(height: defaultPadding / 4),
                                  const Text(
                                    '2min ago',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: grey2,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: defaultPadding),
                              SizedBox(
                                width: 40,
                                height: 40,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Text(
                                      '${card['progress']}%',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: secondaryColor,
                                      ),
                                    ),
                                    CircularProgressIndicator(
                                      value: card['progress']! / 100,
                                      color: primaryColor,
                                      backgroundColor: grey5,
                                      strokeWidth: 4,
                                      strokeCap: StrokeCap.round,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: defaultPadding / 2,
                    ),
                    itemCount: cards.length,
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

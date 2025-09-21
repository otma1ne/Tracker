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
  String getCurrentDay() {
    final now = DateTime.now();
    return DateFormat('EEEE, d').format(now);
  }

  final List<Map<String, String>> cards = [
    {'title': 'Card 1', 'subtitle': 'Subtitle 1'},
    {'title': 'Card 2', 'subtitle': 'Subtitle 2'},
    {'title': 'Card 3', 'subtitle': 'Subtitle 3'},
    {'title': 'Card 4', 'subtitle': 'Subtitle 4'},
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
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cards.length,
                    itemBuilder: (context, index) {
                      final card = cards[index];
                      return TaskCard(
                        title: card['title']!,
                        subTitle: card['subtitle']!,
                      );
                    },
                  ),
                )
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

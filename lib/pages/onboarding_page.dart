import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tracker/constants.dart';
import 'package:tracker/routes/routes.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final box = GetStorage();

  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/images/onboarding1.png',
      'title': 'Task Management',
      'text': "Let's create a space for your workflows."
    },
    {
      'image': 'assets/images/onboarding2.png',
      'title': 'Task Management',
      'text': "Work more Structured and Organized 👌"
    },
    {
      'image': 'assets/images/onboarding3.png',
      'title': 'Task Management',
      'text': "Manage your Tasks quickly for Results✌"
    },
  ];

  void _completeOnboarding() {
    box.write('seenOnboarding', true);
    Get.offAllNamed(AppRoutes.main);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                final data = onboardingData[index];

                // Define words to highlight per slide
                List<String> highlightWords = [];
                if (index == 0) highlightWords = ['space'];
                if (index == 1) highlightWords = ['Structured'];
                if (index == 2) highlightWords = ['Tasks'];

                // Build TextSpan with highlighted words
                List<TextSpan> textSpans = [];
                data['text']!.split(' ').forEach((word) {
                  if (highlightWords
                      .contains(word.replaceAll(RegExp(r'[^\w]'), ''))) {
                    textSpans.add(
                      TextSpan(
                        text: '$word ',
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  } else {
                    textSpans.add(TextSpan(text: '$word '));
                  }
                });

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Image.asset(
                        data['image']!,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: defaultPadding),
                    Padding(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['title']!,
                            style: TextStyle(
                              fontSize: 18,
                              color: primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: defaultPadding),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(end: 40),
                            child: RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 36,
                                  fontFamily: poppins,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  height: 1.4,
                                ),
                                children: textSpans,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          // Dots indicator
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                onboardingData.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? primaryColor : grey3,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          // Bottom Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: _completeOnboarding,
                child: const Text('Skip'),
              ),
              Container(
                width: 80,
                height: 120,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/button_shape.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    if (_currentPage < onboardingData.length - 1) {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    } else {
                      _completeOnboarding();
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

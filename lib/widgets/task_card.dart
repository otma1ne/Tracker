import 'package:flutter/material.dart';
import 'package:tracker/constants.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String subTitle;
  const TaskCard({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      margin: const EdgeInsets.only(right: defaultPadding),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(defaultBorderRadius),
      ),
      padding: const EdgeInsets.all(defaultPadding * 1.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subTitle,
            style: const TextStyle(
              fontSize: 14,
              color: grey2,
            ),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: primaryColor,
          ),
        ],
      ),
    );
  }
}

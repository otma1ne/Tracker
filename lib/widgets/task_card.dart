import 'package:flutter/material.dart';
import 'package:tracker/constants.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String category;
  final int progress;
  final bool isActive;
  const TaskCard({
    super.key,
    required this.title,
    required this.category,
    required this.progress,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: defaultPadding),
      decoration: BoxDecoration(
        color: isActive ? primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        border: Border.all(
          color: isActive ? primaryColor : grey4,
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(defaultPadding * 1.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w600,
              color: isActive ? Colors.white : secondaryColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            category,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: isActive ? Colors.white : grey2,
            ),
          ),
          const Spacer(),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Progress',
                    style: TextStyle(
                      fontSize: 16,
                      color: isActive ? Colors.white : grey2,
                    ),
                  ),
                  const SizedBox(width: defaultPadding),
                  Text(
                    '$progress%',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: isActive ? Colors.white : grey2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding / 2),
              ClipRRect(
                borderRadius: BorderRadius.circular(defaultBorderRadius),
                child: LinearProgressIndicator(
                  value: progress / 100,
                  minHeight: 6,
                  borderRadius: BorderRadius.circular(defaultBorderRadius),
                  backgroundColor:
                      isActive ? secondaryColor.withOpacity(.4) : grey5,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    isActive ? Colors.white : primaryColor,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:learnhub/core/utils/my_colors.dart';

class LearnerBanner extends StatelessWidget {
  const LearnerBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
      decoration: BoxDecoration(
        color: MyColors.textWhite.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: MyColors.textWhite.withValues(alpha: 0.07)),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.auto_awesome, size: 16, color: MyColors.yellow),
          SizedBox(width: 7),
          Text(
            '25K+ active learners',
            style: TextStyle(
              color: MyColors.yellow,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

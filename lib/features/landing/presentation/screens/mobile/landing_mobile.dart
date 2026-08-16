import 'package:flutter/material.dart';

import 'package:learnhub/core/extensions/text_theme_extension.dart';
import 'package:learnhub/core/utils/my_colors.dart';
import 'package:learnhub/features/landing/presentation/widgets/landing_hero_mobile.dart';
import 'package:learnhub/features/landing/presentation/widgets/mobile_landing_nav_bar.dart';

class LandingMobile extends StatelessWidget {
  const LandingMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      left: false,
      right: false,
      child: SingleChildScrollView(
        child: Column(
          children: [const MobileLandingNavBar(), const LandingHeroMobile()],
        ),
      ),
    );
  }
}

class Stat extends StatelessWidget {
  final IconData icon;
  final String number;
  final String title;

  const Stat({required this.icon, required this.number, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: MyColors.surface(context),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: MyColors.border(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 22, color: MyColors.blue),

          const SizedBox(height: 10),

          Text(number, style: context.titleLarge),

          const SizedBox(height: 2),

          Text(title, style: context.bodySmall),
        ],
      ),
    );
  }
}

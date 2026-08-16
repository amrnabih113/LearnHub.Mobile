import 'package:flutter/material.dart';
import 'package:learnhub/features/landing/presentation/widgets/landing_hero_web.dart';
import 'package:learnhub/features/landing/presentation/widgets/web_landing_nav_bar.dart';

class LandingWeb extends StatelessWidget {
  const LandingWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      left: false,
      right: false,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // NAV BAR
            const WebLandingNavBar(),
            // HERO
            const LandingHeroWeb(),
          ],
        ),
      ),
    );
  }
}

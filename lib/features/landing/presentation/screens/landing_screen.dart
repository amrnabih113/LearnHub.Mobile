import 'package:flutter/material.dart';
import 'package:learnhub/core/adaptive/adaptive_layout.dart';
import 'package:learnhub/features/landing/presentation/screens/mobile/landing_mobile.dart';
import 'package:learnhub/features/landing/presentation/screens/web/landing_web.dart';
import 'package:learnhub/features/landing/presentation/widgets/mobile_landing_drawer.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const MobileLandingDrawer(),
      body: SafeArea(
        bottom: false,
        right: false,
        child: AdaptiveLayout(
          compact: LandingMobile(),
          medium: LandingMobile(),
          expanded: LandingWeb(),
        ),
      ),
    );
  }
}

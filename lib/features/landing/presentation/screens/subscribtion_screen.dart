import 'package:flutter/material.dart';
import 'package:learnhub/core/adaptive/adaptive_layout.dart';
import 'package:learnhub/core/utils/my_colors.dart';
import 'package:learnhub/features/landing/presentation/widgets/mobile_landing_nav_bar.dart';
import 'package:learnhub/features/landing/presentation/widgets/subscribtion_section.dart';
import 'package:learnhub/features/landing/presentation/widgets/web_landing_nav_bar.dart';
import 'package:learnhub/features/landing/presentation/widgets/landing_footer.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({
    super.key,
    this.onFreePressed,
    this.onProPressed,
    this.onPremiumPressed,
  });

  final VoidCallback? onFreePressed;
  final VoidCallback? onProPressed;
  final VoidCallback? onPremiumPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background(context),
      body: SafeArea(
        child: Column(
          children: [
            AdaptiveLayout(
              compact: const MobileLandingNavBar(),
              expanded: const WebLandingNavBar(),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SubscriptionSection(
                      onFreePressed: onFreePressed,
                      onProPressed: onProPressed,
                      onPremiumPressed: onPremiumPressed,
                    ),

                    const LandingFooter(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

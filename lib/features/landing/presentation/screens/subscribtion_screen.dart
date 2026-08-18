import 'package:flutter/material.dart';
import '../../../../core/adaptive/adaptive_layout.dart';
import '../../../../core/utils/my_colors.dart';
import '../widgets/mobile_landing_nav_bar.dart';
import '../widgets/subscribtion_section.dart';
import '../widgets/web_landing_nav_bar.dart';
import '../widgets/landing_footer.dart';

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

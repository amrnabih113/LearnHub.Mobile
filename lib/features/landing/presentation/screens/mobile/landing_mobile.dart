import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../widgets/cta_section.dart';
import '../../widgets/featured_courses_section.dart';
import '../../widgets/how_it_works_section.dart';
import '../../widgets/landing_footer.dart';

import '../../widgets/landing_hero_mobile.dart';
import '../../widgets/mobile_landing_nav_bar.dart';
import '../../widgets/stats_section.dart';
import '../../widgets/testmoinals_section.dart';
import '../../widgets/topics_section.dart';

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
          children: [
            const MobileLandingNavBar(),
            const LandingHeroMobile(),
            const StatsSection(),
            const TopicsSection(),
            const FeaturedCoursesSection(),
            const HowItWorksSection(),
            LandingCtaSection(
              onExploreCourses: () => context.push(AppRoutes.explore),
            ),
            const LandingTestimonials(),
            const LandingFooter(),
          ],
        ),
      ),
    );
  }
}

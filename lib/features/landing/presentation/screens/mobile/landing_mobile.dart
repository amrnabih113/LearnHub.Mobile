import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learnhub/core/utils/app_routes.dart';
import 'package:learnhub/features/landing/presentation/widgets/cta_section.dart';
import 'package:learnhub/features/landing/presentation/widgets/featured_courses_section.dart';
import 'package:learnhub/features/landing/presentation/widgets/how_it_works_section.dart';
import 'package:learnhub/features/landing/presentation/widgets/landing_footer.dart';

import 'package:learnhub/features/landing/presentation/widgets/landing_hero_mobile.dart';
import 'package:learnhub/features/landing/presentation/widgets/mobile_landing_nav_bar.dart';
import 'package:learnhub/features/landing/presentation/widgets/stats_section.dart';
import 'package:learnhub/features/landing/presentation/widgets/testmoinals_section.dart';
import 'package:learnhub/features/landing/presentation/widgets/topics_section.dart';

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

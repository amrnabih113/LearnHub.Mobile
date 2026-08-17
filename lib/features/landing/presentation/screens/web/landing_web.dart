import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learnhub/core/utils/app_routes.dart';
import 'package:learnhub/features/landing/presentation/widgets/cta_section.dart';
import 'package:learnhub/features/landing/presentation/widgets/featured_courses_section.dart';
import 'package:learnhub/features/landing/presentation/widgets/how_it_works_section.dart';
import 'package:learnhub/features/landing/presentation/widgets/landing_footer.dart';
import 'package:learnhub/features/landing/presentation/widgets/landing_hero_web.dart';
import 'package:learnhub/features/landing/presentation/widgets/stats_section.dart';
import 'package:learnhub/features/landing/presentation/widgets/testmoinals_section.dart';
import 'package:learnhub/features/landing/presentation/widgets/topics_section.dart';
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
            const WebLandingNavBar(),
            const LandingHeroWeb(),
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

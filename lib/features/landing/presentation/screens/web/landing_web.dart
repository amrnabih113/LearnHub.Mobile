import 'package:flutter/material.dart';
import 'package:learnhub/features/landing/presentation/widgets/landing_hero.dart';
import 'package:learnhub/features/landing/presentation/widgets/stat.dart';
import 'package:learnhub/features/landing/presentation/widgets/web_landing_nav_bar.dart';

class LandingWeb extends StatelessWidget {
  const LandingWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // NAV BAR
          WebLandingNavBar(),
          // HERO
          LandingHero(),
          _buildStats(),
        ],
      ),
    );
  }
  // ----------------------------------------------------------
  // STATS
  // ----------------------------------------------------------

  Widget _buildStats() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 45),
      child: const Row(
        children: [
          Expanded(
            child: Stat(
              icon: Icons.people_outline,
              number: '25K+',
              title: 'Active Learners',
              subtitle: 'Growing community',
            ),
          ),
          Expanded(
            child: Stat(
              icon: Icons.menu_book_outlined,
              number: '500+',
              title: 'Expert Courses',
              subtitle: 'High quality content',
            ),
          ),
          Expanded(
            child: Stat(
              icon: Icons.school_outlined,
              number: '120+',
              title: 'Top Instructors',
              subtitle: 'Industry professionals',
            ),
          ),
          Expanded(
            child: Stat(
              icon: Icons.star_outline,
              number: '4.8/5',
              title: 'Learner Rating',
              subtitle: 'From 10K+ reviews',
            ),
          ),
        ],
      ),
    );
  }
}

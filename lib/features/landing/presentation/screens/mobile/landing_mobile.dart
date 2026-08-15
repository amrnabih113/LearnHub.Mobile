import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learnhub/core/adaptive/adaptive_content.dart';
import 'package:learnhub/core/adaptive/adaptive_visiability.dart';

import 'package:learnhub/core/extensions/my_sizes_extensions.dart';
import 'package:learnhub/core/extensions/text_theme_extension.dart';
import 'package:learnhub/core/ui/app_logo.dart';
import 'package:learnhub/core/ui/my_buttons.dart';
import 'package:learnhub/core/utils/app_routes.dart';
import 'package:learnhub/core/utils/my_colors.dart';
import 'package:learnhub/core/utils/my_images.dart';
import 'package:learnhub/features/auth/presentation/widgets/decorative_circle.dart';
import 'package:learnhub/features/auth/presentation/widgets/dot_grid.dart';
import 'package:learnhub/features/landing/presentation/widgets/landing_hero.dart';
import 'package:learnhub/features/landing/presentation/widgets/learner_banner.dart';
import 'package:learnhub/features/landing/presentation/widgets/mobile_landing_nav_bar.dart';

class LandingMobile extends StatelessWidget {
  const LandingMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const _MobileLandingDrawer(),
      body: SafeArea(
        bottom: false,
        left: false,
        right: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MobileLandingNavBar(),

              const LandingHeroMobile(),

              const SizedBox(height: 32),

              _buildStats(context),

              const SizedBox(height: 40),

              // Future sections:
              //
              // Categories
              // Featured Courses
              // Learning Journey
              // Instructors
              // CTA
            ],
          ),
        ),
      ),
    );
  }

  // STATS
  Widget _buildStats(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.45,
        children: const [
          _MobileStat(
            icon: Icons.people_outline,
            number: '25K+',
            title: 'Active Learners',
          ),
          _MobileStat(
            icon: Icons.menu_book_outlined,
            number: '500+',
            title: 'Expert Courses',
          ),
          _MobileStat(
            icon: Icons.school_outlined,
            number: '120+',
            title: 'Top Instructors',
          ),
          _MobileStat(
            icon: Icons.star_outline,
            number: '4.8/5',
            title: 'Learner Rating',
          ),
        ],
      ),
    );
  }
}

// MOBILE NAVBAR// MOBILE HERO
class LandingHeroMobile extends StatelessWidget {
  const LandingHeroMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = MyColors.isDark(context);

    return Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? [MyColors.navy, MyColors.backgroundDark]
              : [MyColors.textPrimaryLight, MyColors.textPrimaryLight],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -90,
            right: -100,
            child: DecorativeCircle(
              size: 240,
              color: MyColors.blue,
              opacity: 0.28,
            ),
          ),

          Positioned(
            top: 170,
            right: 5,
            child: DotGrid(
              rows: 4,
              columns: 4,
              spacing: 12,
              color: MyColors.blue,
              opacity: 0.4,
            ),
          ),

          Positioned(
            bottom: -100,
            left: -100,
            child: DecorativeCircle(
              size: 250,
              color: MyColors.textWhite,
              opacity: 0.04,
            ),
          ),

          Padding(
            padding: context.paddingLg,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LearnerBanner(),

                          const SizedBox(height: 16),

                          Wrap(
                            children: [
                              Text(
                                'Learn.',
                                style: context.displayLarge.copyWith(
                                  color: MyColors.textPrimaryDark,
                                  fontWeight: FontWeight.w800,
                                  height: 1.0,
                                ),
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Build.',
                                style: context.displayLarge.copyWith(
                                  color: MyColors.textPrimaryDark,
                                  fontWeight: FontWeight.w800,
                                  height: 1.0,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Grow.',
                            style: context.displayLarge.copyWith(
                              color: MyColors.yellow,
                              fontWeight: FontWeight.w800,
                              height: 1.0,
                            ),
                          ),
                          SizedBox(height: context.gap(16)),
                          Text(
                            'Discover practical courses, build real skills, '
                            'and move closer to your goals — at your own pace.',
                            style: context.bodyLarge.copyWith(
                              color: MyColors.textSecondaryDark,
                              height: 1.5,
                            ),
                          ),
                          SizedBox(height: context.gap(30)),

                          AdaptiveVisibility(
                            compact: false,
                            child: AdaptiveContent(
                              maxWidth: 500,
                              padding: EdgeInsets.zero,
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 6,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText:
                                            'Search courses, topics, instructors...',
                                        prefixIcon: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Icon(Icons.search, size: 21),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: context.gap(5)),
                                  Expanded(
                                    flex: 3,
                                    child: SizedBox(
                                      width: context.gap(10),
                                      height: context.buttonHeight,
                                      child: MyButtons.accent(
                                        onPressed: () {},
                                        context: context,
                                        child: const Text('Search'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 4),

                    Expanded(
                      flex: 6,
                      child: Image.asset(
                        MyImages.landingImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 28),

                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    SizedBox(
                      width: 150,
                      child: Benefit(
                        icon: Icons.play_circle_outline,
                        text: 'Free courses\navailable',
                      ),
                    ),

                    SizedBox(
                      width: 150,
                      child: Benefit(
                        icon: Icons.bookmark_border,
                        text: 'Progress\nalways saved',
                      ),
                    ),

                    SizedBox(
                      width: 150,
                      child: Benefit(
                        icon: Icons.verified_outlined,
                        text: 'Certificates\nincluded',
                      ),
                    ),

                    SizedBox(
                      width: 150,
                      child: Benefit(
                        icon: Icons.phone_android,
                        text: 'Learn on any\ndevice',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileStat extends StatelessWidget {
  final IconData icon;
  final String number;
  final String title;

  const _MobileStat({
    required this.icon,
    required this.number,
    required this.title,
  });

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

// MOBILE SIDE DRAWER
class _MobileLandingDrawer extends StatelessWidget {
  const _MobileLandingDrawer();

  @override
  Widget build(BuildContext context) {
    final isDark = MyColors.isDark(context);

    return Drawer(
      width: context.screenWidth * 0.6,
      backgroundColor: isDark ? MyColors.surfaceDark : MyColors.surfaceLight,

      child: SafeArea(
        child: ListView(
          shrinkWrap: false,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 18, 12, 18),
              child: Row(
                children: [
                  AppLogo(
                    logoColor: isDark
                        ? MyColors.textPrimaryDark
                        : MyColors.textPrimaryLight,
                  ),

                  const Spacer(),
                  IconButton(
                    tooltip: 'Close',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),

            Divider(height: 1, color: MyColors.border(context)),

            const SizedBox(height: 12),

            // ==================================================
            // MAIN NAVIGATION
            // ==================================================
            _DrawerItem(
              icon: Icons.explore_outlined,
              title: 'Explore',
              onTap: () {
                Navigator.pop(context);
              },
            ),

            _DrawerItem(
              icon: Icons.workspace_premium_outlined,
              title: 'Subscribe',
              onTap: () {
                Navigator.pop(context);
              },
            ),

            _DrawerItem(
              icon: Icons.school_outlined,
              title: 'Teach With Us',
              onTap: () {
                Navigator.pop(context);
              },
            ),

            SizedBox(height: context.gap(50)),

            // ==================================================
            // ACCOUNT ACTIONS
            // ==================================================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: context.buttonHeight,
                    child: MyButtons.primary(
                      onPressed: () {
                        Navigator.pop(context);
                        context.go(AppRoutes.login);
                      },
                      child: const Text('Log in'),
                    ),
                  ),

                  const SizedBox(height: 10),

                  SizedBox(
                    width: double.infinity,
                    height: context.buttonHeight,
                    child: MyButtons.accent(
                      onPressed: () {
                        Navigator.pop(context);
                        context.go(AppRoutes.register);
                      },
                      child: const Text('Create account'),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// DRAWER ITEM
class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        leading: Icon(icon, size: 22),
        title: Text(title),
      ),
    );
  }
}

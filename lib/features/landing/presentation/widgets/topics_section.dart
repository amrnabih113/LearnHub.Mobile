import 'package:flutter/material.dart';
import '../../../../core/adaptive/adaptive_context.dart';
import '../../../../core/extensions/text_theme_extension.dart';
import '../../../../core/utils/my_colors.dart';
import 'topic_card.dart';

class TopicsSection extends StatelessWidget {
  const TopicsSection({super.key});

  static const topics = [
    Topic(icon: Icons.code, title: 'Programming', courses: 120),
    Topic(icon: Icons.design_services_outlined, title: 'Design', courses: 80),
    Topic(icon: Icons.business_center_outlined, title: 'Business', courses: 60),
    Topic(icon: Icons.language_outlined, title: 'Languages', courses: 40),
    Topic(icon: Icons.science_outlined, title: 'Science', courses: 30),
    Topic(icon: Icons.brush_outlined, title: 'Arts', courses: 20),
    Topic(icon: Icons.sports_esports_outlined, title: 'Gaming', courses: 10),
  ];

  @override
  Widget build(BuildContext context) {
    final adaptive = AdaptiveContext.of(context);

    return Container(
      width: double.infinity,
      color: MyColors.background(context),
      padding: EdgeInsets.symmetric(
        horizontal: adaptive.isCompact ? 20 : 32,
        vertical: adaptive.isCompact ? 48 : 72,
      ),
      child: Column(
        children: [
          Text(
            'TOPICS',
            style: context.bodyLarge.copyWith(
              color: MyColors.blue,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            'Explore what you want to learn',
            textAlign: TextAlign.center,
            style: context.displaySmall.copyWith(
              color: MyColors.textPrimary(context),
              fontWeight: FontWeight.w700,
            ),
          ),

          SizedBox(height: adaptive.isCompact ? 32 : 56),

          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1400),
            child: Column(
              children: [
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: topics
                      .map((topic) => TopicCard(topic: topic))
                      .toList(),
                ),

                const SizedBox(height: 32),

                SeeAllButton(onPressed: () {}, title: 'See all topics'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

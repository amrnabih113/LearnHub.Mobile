import 'package:flutter/material.dart';
import 'package:learnhub/core/adaptive/adaptive_layout.dart';
import 'package:learnhub/core/utils/my_colors.dart';
import 'package:learnhub/features/landing/presentation/widgets/stat.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      compact: const _StatsCompact(),
      medium: const _StatsMedium(),
      expanded: const _StatsExpanded(),
    );
  }
}

class _StatsExpanded extends StatelessWidget {
  const _StatsExpanded();

  static const stats = [
    ('25K+', 'Active Learners'),
    ('500+', 'Courses'),
    ('120+', 'Instructors'),
    ('4.8/5', 'Avg. Rating'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: MyColors.surface(context),
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: SizedBox(
            height: 112,
            child: Row(
              children: [
                for (int i = 0; i < stats.length; i++) ...[
                  Expanded(
                    child: Stat(
                      number: stats[i].$1,
                      title: stats[i].$2,
                      showDivider: false,
                    ),
                  ),

                  if (i < stats.length - 1)
                    Container(
                      width: 1,
                      height: 112,
                      color: MyColors.border(context),
                    ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatsCompact extends StatelessWidget {
  const _StatsCompact();

  static const stats = [
    ('25K+', 'Active Learners'),
    ('500+', 'Courses'),
    ('120+', 'Instructors'),
    ('4.8/5', 'Avg. Rating'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: MyColors.surface(context),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Stat(
                  number: stats[0].$1,
                  title: stats[0].$2,
                  showDivider: false,
                ),
              ),
              Expanded(
                child: Stat(
                  number: stats[1].$1,
                  title: stats[1].$2,
                  showDivider: false,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: Stat(
                  number: stats[2].$1,
                  title: stats[2].$2,
                  showDivider: false,
                ),
              ),
              Expanded(
                child: Stat(
                  number: stats[3].$1,
                  title: stats[3].$2,
                  showDivider: false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatsMedium extends StatelessWidget {
  const _StatsMedium();

  @override
  Widget build(BuildContext context) {
    return const _StatsCompact();
  }
}

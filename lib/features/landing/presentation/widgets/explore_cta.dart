import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/adaptive/adaptive_builder.dart';
import '../../../../core/adaptive/adaptive_value.dart';
import '../../../../core/adaptive/window_size.dart';
import '../../../../core/extensions/my_sizes_extensions.dart';
import '../../../../core/extensions/text_theme_extension.dart';
import '../../../../core/ui/my_buttons.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/my_colors.dart';

class ExploreCta extends StatelessWidget {
  const ExploreCta({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        AdaptiveValue<double>(
          compact: 24,
          medium: 36,
          expanded: 48,
        ).resolve(context),
      ),
      decoration: BoxDecoration(
        color: MyColors.navy,
        borderRadius: BorderRadius.circular(context.cardRadiusLg),
      ),
      child: AdaptiveBuilder(
        builder: (context, windowSize) {
          final compact = windowSize == WindowSize.compact;

          return Flex(
            direction: compact ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: compact
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: compact ? 0 : 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ready to start learning?',
                      style: context.headlineSmall.copyWith(
                        color: MyColors.textWhite,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: context.spaceXs),
                    Text(
                      'Create your free account and start building skills that move you forward.',
                      style: context.bodyLarge.copyWith(
                        color: MyColors.textWhite.withValues(alpha: .72),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              if (!compact)
                SizedBox(width: context.spaceXl)
              else
                SizedBox(height: context.spaceLg),
              MyButtons.accent(
                onPressed: () {
                  context.go(AppRoutes.register);
                },
                child: const Text('Start Learning'),
              ),
            ],
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../core/adaptive/adaptive_context.dart';
import '../../../../core/extensions/my_sizes_extensions.dart';
import '../../../../core/extensions/text_theme_extension.dart';
import '../../../../core/utils/my_colors.dart';

class SubscriptionPlanCard extends StatelessWidget {
  const SubscriptionPlanCard({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.period,
    required this.features,
    required this.buttonText,
    required this.onPressed,
    this.originalPrice,
    this.badge,
    this.isPopular = false,
    this.isPremium = false,
  });

  final String name;
  final String description;
  final String price;
  final String period;
  final List<String> features;
  final String buttonText;
  final VoidCallback? onPressed;

  final String? originalPrice;
  final String? badge;

  final bool isPopular;
  final bool isPremium;

  @override
  Widget build(BuildContext context) {
    final adaptive = context.adaptive;
    final compact = adaptive.isCompact;

    final primaryColor = MyColors.primary(context);
    final surfaceColor = MyColors.surface(context);
    final textPrimary = MyColors.textPrimary(context);
    final textSecondary = MyColors.textSecondary(context);
    final borderColor = MyColors.border(context);

    final highlighted = isPopular || isPremium;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: highlighted ? MyColors.navy : surfaceColor,
        borderRadius: BorderRadius.circular(
          compact ? context.radiusLg : context.radiusXl,
        ),
        border: Border.all(
          color: isPopular
              ? MyColors.yellow
              : isPremium
              ? primaryColor
              : borderColor,
          width: isPopular || isPremium ? 1.5 : 1,
        ),
        boxShadow: highlighted
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 24,
                  offset: const Offset(0, 10),
                ),
              ]
            : null,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (badge != null)
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: context.spaceMd,
                vertical: context.spaceXs,
              ),
              color: isPopular
                  ? MyColors.yellow
                  : primaryColor,
              child: Text(
                badge!,
                textAlign: TextAlign.center,
                style: context.labelMedium.copyWith(
                  color: isPopular ? MyColors.navy : Colors.white,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.6,
                ),
              ),
            ),

          Padding(
            padding: EdgeInsets.all(
              compact ? context.spaceMd : context.spaceLg,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: context.titleLarge.copyWith(
                    color: highlighted ? Colors.white : textPrimary,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                SizedBox(height: context.spaceXs),

                Text(
                  description,
                  style: context.bodyMedium.copyWith(
                    color: highlighted
                        ? Colors.white.withValues(alpha: 0.72)
                        : textSecondary,
                    height: 1.45,
                  ),
                ),

                SizedBox(height: context.spaceLg),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      price,
                      style: context.displaySmall.copyWith(
                        color: highlighted ? Colors.white : textPrimary,
                        fontWeight: FontWeight.w800,
                        height: 1,
                      ),
                    ),

                    SizedBox(width: context.spaceXs),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Text(
                        period,
                        style: context.bodyMedium.copyWith(
                          color: highlighted
                              ? Colors.white.withValues(alpha: 0.65)
                              : textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),

                if (originalPrice != null) ...[
                  SizedBox(height: context.spaceXs),
                  Text(
                    originalPrice!,
                    style: context.bodySmall.copyWith(
                      color: highlighted
                          ? Colors.white.withValues(alpha: 0.45)
                          : textSecondary,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],

                SizedBox(height: context.spaceLg),

                Divider(
                  color: highlighted
                      ? Colors.white.withValues(alpha: 0.12)
                      : borderColor,
                ),

                SizedBox(height: context.spaceMd),

                ...features.map(
                  (feature) => Padding(
                    padding: EdgeInsets.only(
                      bottom: context.spaceSm,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: highlighted
                                ? Colors.white.withValues(alpha: 0.10)
                                : primaryColor.withValues(alpha: 0.10),
                          ),
                          child: Icon(
                            Icons.check_rounded,
                            size: 14,
                            color: highlighted
                                ? Colors.white
                                : primaryColor,
                          ),
                        ),

                        SizedBox(width: context.spaceSm),

                        Expanded(
                          child: Text(
                            feature,
                            style: context.bodyMedium.copyWith(
                              color: highlighted
                                  ? Colors.white.withValues(alpha: 0.82)
                                  : textPrimary,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: context.spaceMd),

                SizedBox(
                  width: double.infinity,
                  child: _PlanButton(
                    text: buttonText,
                    highlighted: highlighted,
                    isPopular: isPopular,
                    onPressed: onPressed,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PlanButton extends StatelessWidget {
  const _PlanButton({
    required this.text,
    required this.highlighted,
    required this.isPopular,
    required this.onPressed,
  });

  final String text;
  final bool highlighted;
  final bool isPopular;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    if (highlighted) {
      return FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: isPopular
              ? MyColors.yellow
              : Colors.white,
          foregroundColor: isPopular
              ? MyColors.navy
              : MyColors.navy,
          padding: EdgeInsets.symmetric(
            vertical: context.spaceSm,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              context.radiusMd,
            ),
          ),
        ),
        child: Text(
          text,
          style: context.bodyMedium.copyWith(
            fontWeight: FontWeight.w800,
            color: MyColors.navy,
          ),
        ),
      );
    }

    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: MyColors.primary(context),
        padding: EdgeInsets.symmetric(
          vertical: context.spaceSm,
        ),
        side: BorderSide(
          color: MyColors.primary(context),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            context.radiusMd,
          ),
        ),
      ),
      child: Text(
        text,
        style: context.bodyMedium.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
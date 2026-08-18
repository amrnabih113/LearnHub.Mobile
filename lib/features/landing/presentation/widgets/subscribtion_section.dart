import 'package:flutter/material.dart';
import '../../../../core/adaptive/adaptive_context.dart';
import '../../../../core/extensions/my_sizes_extensions.dart';
import '../../../../core/extensions/text_theme_extension.dart';
import '../../../../core/utils/my_colors.dart';
import 'subscribtion_plan_card.dart';

import 'section_heading.dart';

class SubscriptionSection extends StatefulWidget {
  const SubscriptionSection({
    super.key,
    this.onFreePressed,
    this.onProPressed,
    this.onPremiumPressed,
  });

  final VoidCallback? onFreePressed;
  final VoidCallback? onProPressed;
  final VoidCallback? onPremiumPressed;

  @override
  State<SubscriptionSection> createState() => _SubscriptionSectionState();
}

class _SubscriptionSectionState extends State<SubscriptionSection> {
  bool _yearly = true;

  @override
  Widget build(BuildContext context) {
    final adaptive = context.adaptive;

    final compact = adaptive.isCompact;
    final medium = adaptive.isMedium;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: compact
            ? context.responsive(16)
            : medium
            ? context.responsive(32)
            : context.responsive(48),
        vertical: compact ? context.responsive(40) : context.responsive(64),
      ),
      child: Column(
        children: [
          SectionHeading(
            eyebrow: 'LEARN YOUR WAY',
            title: 'Choose the plan that fits your goals.',
            subtitle:
                'Start for free, unlock more with Pro, or get the complete '
                'LearnHub experience with Premium.',
          ),

          SizedBox(height: context.spaceLg),

          _BillingToggle(
            yearly: _yearly,
            onChanged: (yearly) {
              setState(() {
                _yearly = yearly;
              });
            },
          ),

          SizedBox(height: context.spaceXl),

          _PlansLayout(
            yearly: _yearly,
            compact: compact,
            medium: medium,
            onFreePressed: widget.onFreePressed,
            onProPressed: widget.onProPressed,
            onPremiumPressed: widget.onPremiumPressed,
          ),

          SizedBox(height: context.spaceLg),

          Text(
            'All plans can be changed or cancelled according to the '
            'subscription terms.',
            textAlign: TextAlign.center,
            style: context.bodySmall.copyWith(
              color: MyColors.textSecondary(context),
            ),
          ),
        ],
      ),
    );
  }
}

class _BillingToggle extends StatelessWidget {
  const _BillingToggle({required this.yearly, required this.onChanged});

  final bool yearly;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: MyColors.surfaceAlt(context),
        borderRadius: BorderRadius.circular(context.radiusCircle),
        border: Border.all(color: MyColors.border(context)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _BillingOption(
            title: 'Monthly',
            selected: !yearly,
            onTap: () => onChanged(false),
          ),
          _BillingOption(
            title: 'Yearly',
            selected: yearly,
            trailing: 'Save more',
            onTap: () => onChanged(true),
          ),
        ],
      ),
    );
  }
}

class _BillingOption extends StatelessWidget {
  const _BillingOption({
    required this.title,
    required this.selected,
    required this.onTap,
    this.trailing,
  });

  final String title;
  final bool selected;
  final String? trailing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: EdgeInsets.symmetric(
          horizontal: context.spaceMd,
          vertical: context.spaceSm,
        ),
        decoration: BoxDecoration(
          color: selected ? MyColors.surface(context) : Colors.transparent,
          borderRadius: BorderRadius.circular(context.radiusCircle),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: context.bodyMedium.copyWith(
                color: selected
                    ? MyColors.textPrimary(context)
                    : MyColors.textSecondary(context),
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
            if (trailing != null) ...[
              SizedBox(width: context.spaceXs),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: context.spaceXs,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: MyColors.yellow.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(context.radiusCircle),
                ),
                child: Text(
                  trailing!,
                  style: context.labelSmall.copyWith(
                    color: MyColors.navy,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _PlansLayout extends StatelessWidget {
  const _PlansLayout({
    required this.yearly,
    required this.compact,
    required this.medium,
    required this.onFreePressed,
    required this.onProPressed,
    required this.onPremiumPressed,
  });

  final bool yearly;
  final bool compact;
  final bool medium;

  final VoidCallback? onFreePressed;
  final VoidCallback? onProPressed;
  final VoidCallback? onPremiumPressed;

  @override
  Widget build(BuildContext context) {
    final plans = [
      SubscriptionPlanCard(
        name: 'Free',
        description: 'A simple way to start learning and explore LearnHub.',
        price: '\$0',
        period: '/ forever',
        features: const [
          'Access free courses',
          'Basic course discovery',
          'Track your learning progress',
          'Join the LearnHub community',
        ],
        buttonText: 'Get Started',
        onPressed: onFreePressed,
      ),
      SubscriptionPlanCard(
        name: 'Pro',
        description: 'For learners who want more courses and more flexibility.',
        price: yearly ? '\$9' : '\$12',
        period: '/ month',
        originalPrice: yearly ? '\$12 / month' : null,
        badge: 'MOST POPULAR',
        features: const [
          'Everything in Free',
          'Access Pro courses',
          'Unlimited learning',
          'Certificates for eligible courses',
          'Enhanced learning experience',
        ],
        buttonText: 'Choose Pro',
        isPopular: true,
        onPressed: onProPressed,
      ),
      SubscriptionPlanCard(
        name: 'Premium',
        description: 'The complete LearnHub experience for dedicated learners.',
        price: yearly ? '\$15' : '\$19',
        period: '/ month',
        originalPrice: yearly ? '\$19 / month' : null,
        badge: 'COMPLETE EXPERIENCE',
        features: const [
          'Everything in Pro',
          'Access Premium courses',
          'Premium learning resources',
          'Advanced learning features',
          'Priority access to new experiences',
        ],
        buttonText: 'Choose Premium',
        isPremium: true,
        onPressed: onPremiumPressed,
      ),
    ];

    if (compact) {
      return Column(
        children: [
          for (var i = 0; i < plans.length; i++) ...[
            plans[i],
            if (i != plans.length - 1) SizedBox(height: context.spaceMd),
          ],
        ],
      );
    }

    if (medium) {
      return SizedBox(
        height: 650,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(
            horizontal: context.spaceXs,
            vertical: context.spaceXs,
          ),
          itemCount: plans.length,
          separatorBuilder: (_, _) => SizedBox(width: context.spaceMd),
          itemBuilder: (context, index) {
            return SizedBox(width: 340, child: plans[index]);
          },
        ),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: plans[0]),
        SizedBox(width: context.spaceMd),
        Expanded(child: plans[1]),
        SizedBox(width: context.spaceMd),
        Expanded(child: plans[2]),
      ],
    );
  }
}

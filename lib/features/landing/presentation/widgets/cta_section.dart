import 'package:flutter/material.dart';
import 'package:learnhub/core/adaptive/adaptive_context.dart';
import 'package:learnhub/core/extensions/my_sizes_extensions.dart';
import 'package:learnhub/core/extensions/text_theme_extension.dart';
import 'package:learnhub/core/utils/my_colors.dart';

class LandingCtaSection extends StatelessWidget {
  const LandingCtaSection({
    super.key,
    this.onStartLearning,
    this.onExploreCourses,
  });

  final VoidCallback? onStartLearning;
  final VoidCallback? onExploreCourses;

  @override
  Widget build(BuildContext context) {
    final adaptive = context.adaptive;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final bool compact = adaptive.isCompact;
    final bool medium = adaptive.isMedium;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: compact
            ? context.responsive(16)
            : medium
            ? context.responsive(32)
            : context.responsive(48),
        vertical: compact ? context.responsive(32) : context.responsive(48),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          // CTA BACKGROUND
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDark
                ? [MyColors.navy, MyColors.backgroundDark]
                : [MyColors.textPrimaryLight, MyColors.navy],
          ),
          borderRadius: BorderRadius.circular(compact ? 24 : 32),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            // BACKGROUND DECORATION
            Positioned(
              top: -100,
              right: -80,
              child: _DecorationCircle(
                size: compact ? 220 : 320,
                opacity: isDark ? 0.08 : 0.10,
              ),
            ),

            Positioned(
              bottom: -140,
              left: -100,
              child: _DecorationCircle(
                size: compact ? 260 : 380,
                opacity: isDark ? 0.06 : 0.08,
              ),
            ),

            Positioned(
              top: 40,
              right: compact ? 30 : 100,
              child: Icon(
                Icons.auto_awesome_rounded,
                size: compact ? 28 : 42,
                color: Colors.white.withValues(alpha: isDark ? 0.12 : 0.16),
              ),
            ),

            Positioned(
              bottom: 30,
              right: compact ? 20 : 70,
              child: Icon(
                Icons.school_rounded,
                size: compact ? 32 : 48,
                color: Colors.white.withValues(alpha: isDark ? 0.07 : 0.10),
              ),
            ),

            // CONTENT
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: compact
                    ? 24
                    : medium
                    ? 48
                    : 80,
                vertical: compact
                    ? 40
                    : medium
                    ? 56
                    : 72,
              ),
              child: compact
                  ? _CompactContent(
                      onStartLearning: onStartLearning,
                      onExploreCourses: onExploreCourses,
                    )
                  : _ExpandedContent(
                      onStartLearning: onStartLearning,
                      onExploreCourses: onExploreCourses,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

// DESKTOP / TABLET

class _ExpandedContent extends StatelessWidget {
  const _ExpandedContent({
    required this.onStartLearning,
    required this.onExploreCourses,
  });

  final VoidCallback? onStartLearning;
  final VoidCallback? onExploreCourses;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _Eyebrow(),
              SizedBox(height: context.spaceSm),

              Text(
                'Ready to build skills\nthat move you forward?',
                style: context.displaySmall.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  height: 1.1,
                ),
              ),

              SizedBox(height: context.spaceMd),

              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 650),
                child: Text(
                  'Join LearnHub and discover practical courses designed '
                  'to help you learn, grow, and take your next step with confidence.',
                  style: context.bodyLarge.copyWith(
                    color: Colors.white.withValues(alpha: 0.82),
                    height: 1.6,
                  ),
                ),
              ),

              SizedBox(height: context.spaceLg),

              Wrap(
                spacing: context.spaceSm,
                runSpacing: context.spaceSm,
                children: [
                  _PrimaryButton(
                    title: 'Start Learning',
                    icon: Icons.arrow_forward_rounded,
                    onPressed: onStartLearning,
                  ),
                  _SecondaryButton(
                    title: 'Explore Courses',
                    onPressed: onExploreCourses,
                  ),
                ],
              ),
            ],
          ),
        ),

        SizedBox(width: context.spaceXl),

        Expanded(flex: 3, child: _CtaVisual()),
      ],
    );
  }
}

// MOBILE

class _CompactContent extends StatelessWidget {
  const _CompactContent({
    required this.onStartLearning,
    required this.onExploreCourses,
  });

  final VoidCallback? onStartLearning;
  final VoidCallback? onExploreCourses;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Eyebrow(),

        SizedBox(height: context.spaceSm),

        Text(
          'Ready to build skills that move you forward?',
          style: context.headlineMedium.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            height: 1.15,
          ),
        ),

        SizedBox(height: context.spaceMd),

        Text(
          'Join LearnHub and discover practical courses designed '
          'to help you learn, grow, and take your next step with confidence.',
          style: context.bodyMedium.copyWith(
            color: Colors.white.withValues(alpha: 0.82),
            height: 1.6,
          ),
        ),

        SizedBox(height: context.spaceLg),

        SizedBox(
          width: double.infinity,
          child: _PrimaryButton(
            title: 'Start Learning',
            icon: Icons.arrow_forward_rounded,
            onPressed: onStartLearning,
          ),
        ),

        SizedBox(height: context.spaceSm),

        SizedBox(
          width: double.infinity,
          child: _SecondaryButton(
            title: 'Explore Courses',
            onPressed: onExploreCourses,
          ),
        ),
      ],
    );
  }
}

// EYEBROW

class _Eyebrow extends StatelessWidget {
  const _Eyebrow();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 28,
          height: 2,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.65),
            borderRadius: BorderRadius.circular(10),
          ),
        ),

        SizedBox(width: context.spaceXs),

        Text(
          'START LEARNING TODAY',
          style: context.labelLarge.copyWith(
            color: Colors.white.withValues(alpha: 0.82),
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}

// CTA VISUAL

class _CtaVisual extends StatelessWidget {
  const _CtaVisual();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 230,
        height: 230,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withValues(alpha: 0.06),
        ),
        child: Center(
          child: Container(
            width: 170,
            height: 170,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: 0.06),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.12),
                width: 1.5,
              ),
            ),
            child: const Icon(
              Icons.school_rounded,
              size: 76,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

// PRIMARY BUTTON

class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  final String title;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,

      icon: Icon(icon, size: context.iconSm, color: MyColors.navy),

      label: Text(
        title,
        style: context.bodyMedium.copyWith(
          fontWeight: FontWeight.w700,
          color: MyColors.navy,
        ),
      ),

      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
        backgroundColor: WidgetStatePropertyAll(Colors.white),
        foregroundColor: WidgetStatePropertyAll(MyColors.navy),

        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.radiusMd),
          ),
        ),
      ),
    );
  }
}

// SECONDARY BUTTON

class _SecondaryButton extends StatelessWidget {
  const _SecondaryButton({required this.title, required this.onPressed});

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,

      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,

        side: BorderSide(color: Colors.white.withValues(alpha: 0.55)),

        padding: EdgeInsets.symmetric(
          horizontal: context.spaceMd,
          vertical: context.spaceSm,
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.radiusMd),
        ),
      ),

      child: Text(
        title,
        style: context.bodyMedium.copyWith(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}

// DECORATION CIRCLE

class _DecorationCircle extends StatelessWidget {
  const _DecorationCircle({required this.size, required this.opacity});

  final double size;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withValues(alpha: opacity),
      ),
    );
  }
}

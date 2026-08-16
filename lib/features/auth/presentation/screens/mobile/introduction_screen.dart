import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:learnhub/core/adaptive/adaptive_builder.dart';
import 'package:learnhub/core/adaptive/adaptive_content.dart';
import 'package:learnhub/core/adaptive/window_size.dart';
import 'package:learnhub/core/extensions/my_sizes_extensions.dart';
import 'package:learnhub/core/extensions/text_theme_extension.dart';
import 'package:learnhub/core/ui/my_buttons.dart';
import 'package:learnhub/core/utils/app_routes.dart';
import 'package:learnhub/core/utils/my_colors.dart';
import 'package:learnhub/core/utils/my_images.dart';
import 'package:learnhub/features/auth/presentation/widgets/decorative_circle.dart';
import 'package:learnhub/features/auth/presentation/widgets/dot_grid.dart';
import 'package:learnhub/features/auth/presentation/widgets/flow_lines_painter.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = MyColors.isDark(context);

    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            // ==========================================================
            // BACKGROUND
            // ==========================================================
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isDark
                        ? [MyColors.navy, MyColors.backgroundDark]
                        : [MyColors.navy, MyColors.navy],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),

            // ==========================================================
            // DECORATION
            // ==========================================================
            Positioned(
              top: -context.responsive(180),
              right: -context.responsive(150),
              child: DecorativeCircle(
                size: context.responsive(420),
                color: MyColors.blue,
                opacity: 0.28,
              ),
            ),

            Positioned(
              bottom: -context.responsive(220),
              left: -context.responsive(190),
              child: DecorativeCircle(
                size: context.responsive(430),
                color: MyColors.blue,
                opacity: 0.20,
              ),
            ),

            Positioned(
              top: context.responsive(100),
              right: context.responsive(45),
              child: DotGrid(
                rows: 5,
                columns: 6,
                spacing: context.gap(18),
                color: MyColors.blue,
                opacity: 0.45,
              ),
            ),

            Positioned(
              bottom: context.responsive(115),
              left: context.responsive(45),
              child: DotGrid(
                rows: 5,
                columns: 6,
                spacing: context.gap(18),
                color: MyColors.blue,
                opacity: 0.35,
              ),
            ),

            Positioned.fill(
              child: IgnorePointer(
                child: CustomPaint(painter: FlowLinesPainter()),
              ),
            ),

            // ==========================================================
            // CONTENT
            // ==========================================================
            SafeArea(
              child: AdaptiveBuilder(
                builder: (context, windowSize) {
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: Center(
                            child: AdaptiveContent(
                              maxWidth: windowSize == WindowSize.expanded
                                  ? context.responsive(1100)
                                  : context.responsive(650),

                              padding: context.screenPadding.copyWith(
                                top: context.spaceLg,
                                bottom: context.spaceLg,
                              ),

                              child: _IntroductionContent(
                                windowSize: windowSize,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// INTRODUCTION CONTENT
// ============================================================================

class _IntroductionContent extends StatelessWidget {
  const _IntroductionContent({required this.windowSize});

  final WindowSize windowSize;

  @override
  Widget build(BuildContext context) {
    if (windowSize.isExpanded) {
      return const _DesktopIntroductionLayout();
    }

    return const _CompactIntroductionLayout();
  }
}

// ============================================================================
// COMPACT + MEDIUM
// ============================================================================

class _CompactIntroductionLayout extends StatelessWidget {
  const _CompactIntroductionLayout();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const _Header(),

        SizedBox(height: context.spaceXl),

        const _Illustration(),

        SizedBox(height: context.spaceSm),

        const _Headline(),

        SizedBox(height: context.spaceLg),

        const _Actions(),

        SizedBox(height: context.spaceSm),

        const _TeachButton(),
      ],
    );
  }
}

// ============================================================================
// DESKTOP
// ============================================================================

class _DesktopIntroductionLayout extends StatelessWidget {
  const _DesktopIntroductionLayout();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const _Header(),

        SizedBox(height: context.spaceSection),

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _Headline(alignment: TextAlign.left),

                  SizedBox(height: context.spaceXl),

                  const _Actions(alignment: CrossAxisAlignment.start),

                  SizedBox(height: context.spaceSm),

                  const _TeachButton(),
                ],
              ),
            ),

            SizedBox(width: context.spaceSection),

            const Expanded(flex: 6, child: _Illustration()),
          ],
        ),
      ],
    );
  }
}

// ============================================================================
// HEADER
// ============================================================================

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // ==============================================================
        // LOGO
        // ==============================================================
        Container(
          width: context.responsive(68),
          height: context.responsive(68),
          decoration: BoxDecoration(
            color: MyColors.blue.withValues(alpha: 0.25),
            borderRadius: BorderRadius.circular(context.radiusXl),
          ),
          padding: EdgeInsets.all(context.gap(15)),
          child: SvgPicture.asset(MyImages.appLogoDark),
        ),

        SizedBox(height: context.spaceMd),

        // ==============================================================
        // LEARNHUB
        // ==============================================================
        RichText(
          text: TextSpan(
            style: context.headlineMedium.copyWith(
              color: MyColors.textWhite,
              fontWeight: FontWeight.w800,
              fontSize: context.headlineMd,
            ),
            children: const [
              TextSpan(text: 'Learn'),
              TextSpan(
                text: 'Hub',
                style: TextStyle(color: MyColors.yellow),
              ),
            ],
          ),
        ),

        SizedBox(height: context.spaceXs),

        // ==============================================================
        // TAGLINE
        // ==============================================================
        Text.rich(
          TextSpan(
            children: const [
              TextSpan(
                text: 'Learn. ',
                style: TextStyle(color: MyColors.textWhite),
              ),
              TextSpan(
                text: 'Build. ',
                style: TextStyle(color: MyColors.yellow),
              ),
              TextSpan(
                text: 'Grow.',
                style: TextStyle(color: MyColors.textWhite),
              ),
            ],
          ),
          style: context.bodyMedium.copyWith(
            fontSize: context.bodyMd,
            fontWeight: FontWeight.w600,
            letterSpacing: context.responsive(0.8),
          ),
        ),
      ],
    );
  }
}

// ============================================================================
// HEADLINE
// ============================================================================

class _Headline extends StatelessWidget {
  const _Headline({this.alignment = TextAlign.center});

  final TextAlign alignment;

  @override
  Widget build(BuildContext context) {
    final isCompact = context.isPhone;
    final isMedium = context.isTablet;

    return Column(
      mainAxisSize: MainAxisSize.min,

      // FIX:
      // center -> center
      // left   -> start
      crossAxisAlignment: alignment == TextAlign.center
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,

      children: [
        // ==============================================================
        // DESKTOP HEADLINE ONLY
        // ==============================================================
        if (!isCompact && !isMedium) ...[
          Text.rich(
            TextSpan(
              children: const [
                TextSpan(
                  text: 'Learn. ',
                  style: TextStyle(color: MyColors.textWhite),
                ),
                TextSpan(
                  text: 'Build. ',
                  style: TextStyle(color: MyColors.textWhite),
                ),
                TextSpan(
                  text: 'Grow.',
                  style: TextStyle(color: MyColors.yellow),
                ),
              ],
            ),
            textAlign: alignment,
            style: context.headlineLarge.copyWith(
              fontSize: context.headlineLg,
              fontWeight: FontWeight.w800,
              height: 1.05,
            ),
          ),

          SizedBox(height: context.spaceMd),
        ],

        // ==============================================================
        // DESCRIPTION
        // ==============================================================
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: context.responsive(isCompact ? 280 : 400),
          ),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text:
                      'Discover practical courses,\n'
                      'build real skills, and move closer '
                      'to your goals — ',
                  style: context.bodyLarge.copyWith(
                    fontSize: context.bodyLg,
                    color: MyColors.textSecondaryDark,
                    height: 1.5,
                  ),
                ),
                TextSpan(
                  text: 'at your own pace.',
                  style: context.bodyMedium.copyWith(
                    fontSize: context.bodyMd,
                    color: MyColors.yellow,
                    height: 1.5,
                  ),
                ),
              ],
            ),
            textAlign: alignment,
          ),
        ),
      ],
    );
  }
}

// ============================================================================
// ILLUSTRATION
// ============================================================================

class _Illustration extends StatelessWidget {
  const _Illustration();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: context.responsive(
          context.isDesktop
              ? 600
              : context.isTablet
              ? 420
              : 320,
        ),
      ),
      child: AspectRatio(
        aspectRatio: 1.35,
        child: Image.asset(MyImages.landingImage, fit: BoxFit.contain),
      ),
    );
  }
}

// ============================================================================
// ACTIONS
// ============================================================================

class _Actions extends StatelessWidget {
  const _Actions({this.alignment = CrossAxisAlignment.center});

  final CrossAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: context.responsive(440)),
      child: Column(
        crossAxisAlignment: alignment,
        children: [
          // ==============================================================
          // GET STARTED
          // ==============================================================
          SizedBox(
            width: double.infinity,
            height: context.responsive(52),
            child: MyButtons.accent(
              context: context,
              onPressed: () {
                context.push(AppRoutes.register);
              },
              child: Text(
                "Get Started — It's Free",
                style: TextStyle(fontSize: context.buttonTextMd),
              ),
            ),
          ),

          SizedBox(height: context.spaceSm),

          // ==============================================================
          // LOGIN
          // ==============================================================
          SizedBox(
            width: double.infinity,
            height: context.responsive(52),
            child: OutlinedButton(
              onPressed: () {
                context.push(AppRoutes.login);
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: MyColors.textWhite,
                side: BorderSide(
                  color: MyColors.textWhite.withValues(alpha: 0.25),
                  width: context.borderWidth,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(context.radiusMd),
                ),
              ),
              child: Text(
                'Log In',
                style: TextStyle(
                  fontSize: context.buttonTextMd,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// TEACH BUTTON
// ============================================================================

class _TeachButton extends StatelessWidget {
  const _TeachButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // TODO: Add teacher route.
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: context.spaceSm,
          vertical: context.spaceXs,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Teach with LearnHub',
            style: context.bodyMedium.copyWith(
              fontSize: context.bodyMd,
              color: MyColors.textWhite.withValues(alpha: 0.60),
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(width: context.spaceXs),

          Icon(
            Icons.arrow_forward_rounded,
            size: context.iconSm,
            color: MyColors.textWhite.withValues(alpha: 0.60),
          ),
        ],
      ),
    );
  }
}

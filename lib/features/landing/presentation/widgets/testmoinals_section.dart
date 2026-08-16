import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:learnhub/core/adaptive/adaptive_context.dart';
import 'package:learnhub/core/adaptive/adaptive_value.dart';
import 'package:learnhub/core/extensions/text_theme_extension.dart';
import 'package:learnhub/core/utils/my_colors.dart';

class LandingTestimonials extends StatefulWidget {
  const LandingTestimonials({super.key});

  @override
  State<LandingTestimonials> createState() => _LandingTestimonialsState();
}

class _LandingTestimonialsState extends State<LandingTestimonials> {
  // ==========================================================================
  // CONTROLLER
  // ==========================================================================

  final CarouselSliderController _carouselController =
      CarouselSliderController();

  // ==========================================================================
  // STATE
  // ==========================================================================

  int _currentPage = 0;

  // ==========================================================================
  // TESTIMONIALS
  // ==========================================================================

  final List<Testimonial> _testimonials = const [
    Testimonial(
      name: 'Ahmed Khaled',
      role: 'Frontend Developer',
      quote:
          'LearnHub gave me a clear path instead of jumping between random tutorials. I finally feel like I know what I should learn next.',
      rating: 5,
      course: 'Full-Stack Web Development',
    ),
    Testimonial(
      name: 'Mariam Adel',
      role: 'Computer Science Student',
      quote:
          'The courses are practical and easy to follow. I was able to turn what I learned into projects that I can actually show.',
      rating: 5,
      course: 'Data Structures & Algorithms',
    ),
    Testimonial(
      name: 'Omar Hassan',
      role: 'Software Engineer',
      quote:
          'What I like most about LearnHub is the structure. I can learn at my own pace without losing track of my progress.',
      rating: 4.8,
      course: 'Backend Engineering',
    ),
    Testimonial(
      name: 'Sara Ali',
      role: 'UI/UX Designer',
      quote:
          'I wanted something more practical than watching endless videos. LearnHub helped me focus on building real skills.',
      rating: 4.9,
      course: 'UI/UX Design Fundamentals',
    ),
  ];

  // ==========================================================================
  // RESPONSIVE VIEWPORT
  // ==========================================================================

  double _viewportFraction(BuildContext context) {
    final adaptive = AdaptiveContext.of(context);

    if (adaptive.isCompact) {
      // Mobile:
      // Show one complete testimonial card.
      return 1.0;
    }

    if (adaptive.isMedium) {
      // Tablet:
      // Show the active card with a visible portion of neighbors.
      return 0.68;
    }

    // Desktop:
    // Show the active card with larger portions of neighboring cards.
    return 0.58;
  }

  // ==========================================================================
  // BUILD
  // ==========================================================================

  @override
  Widget build(BuildContext context) {
    final adaptive = AdaptiveContext.of(context);

    return Container(
      width: double.infinity,
      color: MyColors.background(context),
      child: Padding(
        padding: EdgeInsets.only(
          top: context.adaptiveValue<double>(
            compact: 56,
            medium: 72,
            expanded: 88,
          ),
          bottom: context.adaptiveValue<double>(
            compact: 56,
            medium: 72,
            expanded: 88,
          ),
        ),
        child: Column(
          children: [
            // ==================================================================
            // HEADER
            // ==================================================================

            const _Header(),

            SizedBox(
              height: context.adaptiveValue<double>(
                compact: 24,
                medium: 32,
                expanded: 36,
              ),
            ),

            // ==================================================================
            // TESTIMONIAL CAROUSEL
            // ==================================================================

            CarouselSlider.builder(
              carouselController: _carouselController,
              itemCount: _testimonials.length,
              itemBuilder: (
                BuildContext context,
                int itemIndex,
                int pageViewIndex,
              ) {
                return _TestimonialCard(
                  testimonial: _testimonials[itemIndex],
                  isActive: itemIndex == _currentPage,
                );
              },
              options: CarouselOptions(
                // --------------------------------------------------------------
                // SIZE
                // --------------------------------------------------------------

                height: context.adaptiveValue<double>(
                  compact: 375,
                  medium: 380,
                  expanded: 365,
                ),

                // --------------------------------------------------------------
                // RESPONSIVE WIDTH
                // --------------------------------------------------------------

                viewportFraction: _viewportFraction(context),

                // --------------------------------------------------------------
                // INITIAL STATE
                // --------------------------------------------------------------

                initialPage: 0,

                // --------------------------------------------------------------
                // INFINITE SCROLL
                // --------------------------------------------------------------

                enableInfiniteScroll: true,

                // --------------------------------------------------------------
                // AUTOPLAY
                // --------------------------------------------------------------

                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(
                  milliseconds: 600,
                ),
                autoPlayCurve: Curves.easeOutCubic,

                // --------------------------------------------------------------
                // VISUAL BEHAVIOR
                // --------------------------------------------------------------

                // We don't use enlargeCenterPage because the testimonial card
                // already has its own active/inactive animation.
                enlargeCenterPage: false,

                // --------------------------------------------------------------
                // DIRECTION
                // --------------------------------------------------------------

                scrollDirection: Axis.horizontal,

                // --------------------------------------------------------------
                // PAGE CHANGE
                // --------------------------------------------------------------

                onPageChanged: (index, reason) {
                  setState(() {
                    _currentPage = index % _testimonials.length;
                  });
                },
              ),
            ),

            // ==================================================================
            // INDICATOR
            // ==================================================================

            const SizedBox(height: 20),

            _PageIndicator(
              count: _testimonials.length,
              currentIndex: _currentPage,
            ),

            // ==================================================================
            // SWIPE HINT
            // ==================================================================

            if (!adaptive.isCompact) ...[
              const SizedBox(height: 16),
              const _SwipeHint(),
            ],
          ],
        ),
      ),
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
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.adaptiveValue<double>(
          compact: 20,
          medium: 40,
          expanded: 80,
        ),
      ),
      child: Column(
        children: [
          // --------------------------------------------------------------------
          // LABEL
          // --------------------------------------------------------------------

          Text(
            'WHAT LEARNERS SAY',
            style: context.labelLarge.copyWith(
              color: MyColors.primary(context),
              fontWeight: FontWeight.w700,
              letterSpacing: 1.4,
            ),
          ),

          const SizedBox(height: 10),

          // --------------------------------------------------------------------
          // TITLE
          // --------------------------------------------------------------------

          Text(
            'Learn from people like you.',
            textAlign: TextAlign.center,
            style: context.headlineLarge.copyWith(
              color: MyColors.textPrimary(context),
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),

          const SizedBox(height: 10),

          // --------------------------------------------------------------------
          // DESCRIPTION
          // --------------------------------------------------------------------

          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 540,
            ),
            child: Text(
              'Real learners sharing how LearnHub helped them move forward.',
              textAlign: TextAlign.center,
              style: context.bodyLarge.copyWith(
                color: MyColors.textSecondary(context),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// TESTIMONIAL CARD
// ============================================================================

class _TestimonialCard extends StatelessWidget {
  final Testimonial testimonial;
  final bool isActive;

  const _TestimonialCard({
    required this.testimonial,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    final adaptive = AdaptiveContext.of(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOut,

      // ------------------------------------------------------------------------
      // MARGIN
      // ------------------------------------------------------------------------

      margin: EdgeInsets.symmetric(
        horizontal: adaptive.isCompact ? 16 : 10,
        vertical: isActive ? 0 : 8,
      ),

      // ------------------------------------------------------------------------
      // PADDING
      // ------------------------------------------------------------------------

      padding: EdgeInsets.all(
        context.adaptiveValue<double>(
          compact: 20,
          medium: 26,
          expanded: 28,
        ),
      ),

      // ------------------------------------------------------------------------
      // DECORATION
      // ------------------------------------------------------------------------

      decoration: BoxDecoration(
        color: MyColors.surface(context),

        borderRadius: BorderRadius.circular(
          adaptive.isCompact ? 20 : 24,
        ),

        border: Border.all(
          color: isActive
              ? MyColors.primary(context).withValues(alpha: 0.16)
              : MyColors.border(context),
        ),

        boxShadow: isActive
            ? [
                BoxShadow(
                  color: MyColors.primary(context).withValues(alpha: 0.07),
                  blurRadius: 28,
                  offset: const Offset(0, 12),
                ),
              ]
            : const [],
      ),

      // ------------------------------------------------------------------------
      // CONTENT
      // ------------------------------------------------------------------------

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ====================================================================
          // RATING
          // ====================================================================

          Row(
            children: [
              ...List.generate(
                5,
                (index) {
                  final isFull = index < testimonial.rating.floor();
                  final isHalf = !isFull && index < testimonial.rating;

                  return Icon(
                    isFull
                        ? Icons.star_rounded
                        : isHalf
                            ? Icons.star_half_rounded
                            : Icons.star_outline_rounded,
                    size: 17,
                    color: MyColors.yellow,
                  );
                },
              ),

              const SizedBox(width: 8),

              Text(
                testimonial.rating.toStringAsFixed(1),
                style: context.labelMedium.copyWith(
                  color: MyColors.textSecondary(context),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          // ====================================================================
          // QUOTE
          // ====================================================================

          Expanded(
            child: Text(
              '“${testimonial.quote}”',
              style: context.headlineSmall.copyWith(
                color: MyColors.textPrimary(context),
                fontWeight: FontWeight.w600,
                height: 1.4,
              ),
              maxLines: adaptive.isCompact ? 7 : 6,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          const SizedBox(height: 14),

          // ====================================================================
          // COURSE
          // ====================================================================

          Container(
            constraints: const BoxConstraints(
              maxWidth: 320,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 7,
            ),
            decoration: BoxDecoration(
              color: MyColors.surfaceAlt(context),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.menu_book_outlined,
                  size: 14,
                  color: MyColors.primary(context),
                ),

                const SizedBox(width: 6),

                Flexible(
                  child: Text(
                    testimonial.course,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.labelMedium.copyWith(
                      color: MyColors.textSecondary(context),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          // ====================================================================
          // DIVIDER
          // ====================================================================

          Divider(
            height: 1,
            color: MyColors.border(context),
          ),

          const SizedBox(height: 14),

          // ====================================================================
          // LEARNER
          // ====================================================================

          Row(
            children: [
              _Avatar(
                name: testimonial.name,
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ----------------------------------------------------------------
                    // NAME + VERIFIED
                    // ----------------------------------------------------------------

                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            testimonial.name,
                            overflow: TextOverflow.ellipsis,
                            style: context.titleSmall.copyWith(
                              color: MyColors.textPrimary(context),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),

                        const SizedBox(width: 6),

                        Icon(
                          Icons.verified_rounded,
                          size: 14,
                          color: MyColors.primary(context),
                        ),
                      ],
                    ),

                    const SizedBox(height: 2),

                    // ----------------------------------------------------------------
                    // ROLE
                    // ----------------------------------------------------------------

                    Text(
                      testimonial.role,
                      style: context.bodySmall.copyWith(
                        color: MyColors.textSecondary(context),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// AVATAR
// ============================================================================

class _Avatar extends StatelessWidget {
  final String name;

  const _Avatar({
    required this.name,
  });

  String get initials {
    final parts = name.trim().split(RegExp(r'\s+'));

    if (parts.isEmpty || parts.first.isEmpty) {
      return '?';
    }

    if (parts.length == 1) {
      return parts.first.substring(0, 1).toUpperCase();
    }

    return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: MyColors.primary(context).withValues(alpha: 0.20),
          width: 2,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: MyColors.primary(context),
        ),
        alignment: Alignment.center,
        child: Text(
          initials,
          style: context.labelMedium.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// PAGE INDICATOR
// ============================================================================

class _PageIndicator extends StatelessWidget {
  final int count;
  final int currentIndex;

  const _PageIndicator({
    required this.count,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) {
          final isActive = index == currentIndex;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            margin: const EdgeInsets.symmetric(
              horizontal: 3,
            ),
            width: isActive ? 24 : 6,
            height: 6,
            decoration: BoxDecoration(
              color: isActive
                  ? MyColors.primary(context)
                  : MyColors.border(context),
              borderRadius: BorderRadius.circular(20),
            ),
          );
        },
      ),
    );
  }
}

// ============================================================================
// SWIPE HINT
// ============================================================================

class _SwipeHint extends StatelessWidget {
  const _SwipeHint();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.swipe_outlined,
          size: 15,
          color: MyColors.textSecondary(context),
        ),

        const SizedBox(width: 6),

        Text(
          'Swipe to explore',
          style: context.labelMedium.copyWith(
            color: MyColors.textSecondary(context),
          ),
        ),
      ],
    );
  }
}

// ============================================================================
// MODEL
// ============================================================================

class Testimonial {
  final String name;
  final String role;
  final String quote;
  final double rating;
  final String course;

  const Testimonial({
    required this.name,
    required this.role,
    required this.quote,
    required this.rating,
    required this.course,
  });
}
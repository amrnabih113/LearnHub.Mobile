import 'package:flutter/material.dart';
import 'package:learnhub/core/extensions/my_sizes_extensions.dart';
import 'package:learnhub/core/extensions/text_theme_extension.dart';
import 'package:learnhub/core/ui/level_bars.dart';
import 'package:learnhub/core/ui/my_avatar.dart';
import 'package:learnhub/core/ui/star_rating.dart';
import 'package:learnhub/core/utils/my_colors.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
    this.imageUrl =
        'https://images.unsplash.com/photo-1488190211105-8b0e65b80b4e?q=80&w=1170&auto=format&fit=crop',
    this.category = 'Development',
    this.title = 'Full-Stack Web Development with React & Node.js',
    this.instructor = 'Ahmed Hassan',
    this.rating = 4.8,
    this.reviews = '3,241',
    this.duration = '42h',
    this.level = 'Beginner',
    this.price = 49,
    this.discountPrice,
    this.progress,
    this.isPurchased = false,
    this.isCompleted = false,
  });

  // DATA

  final String imageUrl;
  final String category;
  final String title;
  final String instructor;

  final double rating;
  final String reviews;

  final String duration;
  final String level;

  /// Original course price.
  final double price;

  /// Discounted price.
  ///
  /// Example:
  ///
  /// price = 59
  /// discountPrice = 39
  ///
  /// Will display:
  /// $39  $59
  final double? discountPrice;

  /// Progress percentage.
  ///
  /// Only used when [isPurchased] is true.
  final int? progress;

  /// Whether the current user owns the course.
  final bool isPurchased;

  /// Whether the course has been completed.
  final bool isCompleted;

  // BUILD

  @override
  Widget build(BuildContext context) {
    final bool showProgress = isPurchased;

    return Container(
      decoration: BoxDecoration(
        color: MyColors.surface(context),
        borderRadius: BorderRadius.circular(context.cardRadiusLg),
        border: Border.all(
          color: MyColors.border(context),
          width: context.borderWidth,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IMAGE
          _CourseImage(imageUrl: imageUrl),

          // CONTENT
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.spaceMd,
                vertical: context.spaceXs,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // CATEGORY
                  Text(
                    category.toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.bodySmall,
                  ),

                  SizedBox(height: context.spaceXxs),

                  // TITLE
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.titleMedium.copyWith(
                      color: MyColors.textPrimary(context),
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: context.spaceSm),

                  // INSTRUCTOR
                  Row(
                    children: [
                      MyAvatar(
                        size: context.avatarXs,
                        fallback: Text(
                          _initials(instructor),
                          style: context.bodySmall.copyWith(
                            color: MyColors.textWhite,
                            fontWeight: FontWeight.w700,
                            fontSize: context.responsive(10),
                          ),
                        ),
                        imageUrl:
                            'https://images.unsplash.com/photo-1682685794700-1e7f3c8d9b5e?q=80&w=400&auto=format&fit=crop',
                      ),

                      SizedBox(width: context.spaceXs),

                      Expanded(
                        child: Text(
                          'by $instructor',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.bodySmall.copyWith(
                            color: MyColors.textSecondary(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (!showProgress) ...[
                    Column(
                      children: [
                        SizedBox(height: context.spaceSm),

                        // RATING
                        Row(
                          children: [
                            RatingStars(rating: rating, size: context.iconXs),

                            SizedBox(width: context.spaceXs),

                            Text(
                              rating.toStringAsFixed(1),
                              style: context.bodySmall.copyWith(
                                color: MyColors.textPrimary(context),
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            SizedBox(width: context.spaceXxs),

                            Text(
                              '($reviews)',
                              style: context.bodySmall.copyWith(
                                color: MyColors.textSecondary(context),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: context.spaceSm),
                      ],
                    ),

                    // DURATION + LEVEL
                    Row(
                      children: [
                        Row(
                          children: [
                            LevelBars(
                              level: _courseLevel,
                              spacing: 3.5,
                              height: context.responsive(12),
                            ),
                            SizedBox(width: context.spaceXs),

                            Text(
                              level,
                              style: context.bodySmall.copyWith(
                                color: MyColors.textSecondary(context),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time_rounded,
                              size: context.iconXs,
                              color: MyColors.textSecondary(context),
                            ),

                            SizedBox(width: context.spaceXxs),
                            Text(
                              duration,
                              style: context.bodySmall.copyWith(
                                color: MyColors.textSecondary(context),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: context.spaceMd),
                  ],

                  SizedBox(
                    height: context.responsive(48),
                    child: showProgress
                        ? _ProgressSection(
                            context: context,
                            progress: progress ?? 0,
                            isCompleted: isCompleted,
                          )
                        : _PriceSection(
                            context: context,
                            price: price,
                            discountPrice: discountPrice,
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // LEVEL

  CourseLevel get _courseLevel {
    switch (level.toLowerCase()) {
      case 'advanced':
        return CourseLevel.advanced;

      case 'intermediate':
        return CourseLevel.intermediate;

      default:
        return CourseLevel.beginner;
    }
  }

  // INITIALS

  String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));

    if (parts.isEmpty) {
      return '';
    }

    if (parts.length == 1) {
      return parts.first
          .substring(0, parts.first.length >= 2 ? 2 : 1)
          .toUpperCase();
    }

    return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
  }
}

// COURSE IMAGE

class _CourseImage extends StatelessWidget {
  const _CourseImage({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.responsive(160),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) {
              return Container(
                color: MyColors.surfaceAlt(context),
                alignment: Alignment.center,
                child: Icon(
                  Icons.image_outlined,
                  size: context.iconLg,
                  color: MyColors.textSecondary(context),
                ),
              );
            },
            loadingBuilder: (context, child, progress) {
              if (progress == null) {
                return child;
              }

              return Container(
                color: MyColors.surfaceAlt(context),
                alignment: Alignment.center,
                child: SizedBox(
                  width: context.iconMd,
                  height: context.iconMd,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: MyColors.primary(context),
                  ),
                ),
              );
            },
          ),

          // Subtle image overlay
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    MyColors.black.withValues(alpha: 0.12),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// PROGRESS

class _ProgressSection extends StatelessWidget {
  const _ProgressSection({
    required this.context,
    required this.progress,
    required this.isCompleted,
  });

  final BuildContext context;
  final int progress;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    final value = progress.clamp(0, 100) / 100;

    return Row(
      children: [
        // Progress bar
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isCompleted ? 'Course completed' : 'Progress · $progress%',
                style: context.bodyMedium.copyWith(
                  fontSize: context.captionMd,
                  color: isCompleted
                      ? MyColors.successColor(context)
                      : MyColors.textSecondary(context),
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: context.spaceXxs),

              ClipRRect(
                borderRadius: BorderRadius.circular(context.radiusCircle),
                child: LinearProgressIndicator(
                  value: value,

                  valueColor: AlwaysStoppedAnimation<Color>(
                    isCompleted
                        ? MyColors.successColor(context)
                        : MyColors.yellow,
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(width: context.spaceSm),

        SizedBox(
          width: context.buttonHeight,
          height: context.buttonHeight,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: isCompleted
                    ? MyColors.successColor(context)
                    : MyColors.primary(context),
                width: context.borderWidth,
              ),
              borderRadius: BorderRadius.circular(context.radiusCircle),
            ),
            child: Icon(
              isCompleted ? Icons.verified_outlined : Icons.play_arrow_rounded,
              size: context.iconSm,
            ),
          ),
        ),
      ],
    );
  }
}

// PRICE

class _PriceSection extends StatelessWidget {
  const _PriceSection({
    required this.context,
    required this.price,
    required this.discountPrice,
  });

  final BuildContext context;
  final double price;
  final double? discountPrice;

  @override
  Widget build(BuildContext context) {
    final hasDiscount = discountPrice != null && discountPrice! < price;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Current price
        Text(
          '\$${(hasDiscount ? discountPrice! : price).toStringAsFixed(0)}',
          style: context.titleMedium.copyWith(
            color: MyColors.textPrimary(context),
            fontWeight: FontWeight.w800,
          ),
        ),

        // Original price
        if (hasDiscount) ...[
          SizedBox(width: context.spaceXs),

          Text(
            '\$${price.toStringAsFixed(0)}',
            style: context.bodyMedium.copyWith(
              color: MyColors.textSecondary(context),
              decoration: TextDecoration.lineThrough,
              decorationColor: MyColors.textSecondary(context),
            ),
          ),

          SizedBox(width: context.spaceXs),

          Container(
            padding: EdgeInsets.symmetric(
              horizontal: context.spaceXs,
              vertical: context.spaceXxs,
            ),
            decoration: BoxDecoration(
              color: MyColors.warningBackground,
              borderRadius: BorderRadius.circular(context.radiusSm),
            ),
            child: Text(
              '${_discountPercentage(price, discountPrice!)}% OFF',
              style: context.labelLarge.copyWith(
                color: MyColors.warningColor(context),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],

        Spacer(),
        SizedBox(
          width: context.buttonHeight,
          height: context.buttonHeight,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: MyColors.primary(context),
                width: context.borderWidth,
              ),
              borderRadius: BorderRadius.circular(context.radiusCircle),
            ),
            child: Icon(Icons.shopping_cart_outlined, size: context.iconSm),
          ),
        ),
      ],
    );
  }

  int _discountPercentage(double original, double discounted) {
    return ((1 - discounted / original) * 100).round();
  }
}

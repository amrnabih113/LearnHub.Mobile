import 'package:flutter/material.dart';
import '../../../core/adaptive/adaptive_value.dart';
import '../../../core/extensions/my_sizes_extensions.dart';
import '../../../core/extensions/text_theme_extension.dart';
import '../../../core/ui/level_bars.dart';
import '../../../core/ui/my_avatar.dart';
import '../../../core/ui/star_rating.dart';
import '../../../core/utils/my_colors.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
    this.imageUrl =
        'https://images.unsplash.com/photo-1488190211105-8b0e65b80b4e?q=80&w=1170&auto=format&fit=crop',
    this.category = 'Development',
    this.title = 'Full-Stack Web Development with React & Node.js',
    this.instructor = 'Ahmed Hassan',
    this.instructorImageUrl =
        'https://images.unsplash.com/photo-1682685794700-1e7f3c8d9b5e?q=80&w=400&auto=format&fit=crop',
    this.rating = 4.8,
    this.reviews = '3,241',
    this.duration = '42h',
    this.level = 'Beginner',
    this.price = 49,
    this.discountPrice,
    this.isSaved = false,
    this.onTap,
    this.onSave,
    this.onAddToCart,
  }) : _horizontal = false;

  /// Horizontal marketplace card.
  const CourseCard.horizontal({
    super.key,
    this.imageUrl =
        'https://images.unsplash.com/photo-1488190211105-8b0e65b80b4e?q=80&w=1170&auto=format&fit=crop',
    this.category = 'Development',
    this.title = 'Full-Stack Web Development with React & Node.js',
    this.instructor = 'Ahmed Hassan',
    this.instructorImageUrl =
        'https://images.unsplash.com/photo-1682685794700-1e7f3c8d9b5e?q=80&w=400&auto=format&fit=crop',
    this.rating = 4.8,
    this.reviews = '3,241',
    this.duration = '42h',
    this.level = 'Beginner',
    this.price = 49,
    this.discountPrice,
    this.isSaved = false,
    this.onTap,
    this.onSave,
    this.onAddToCart,
  }) : _horizontal = true;

  final String imageUrl;
  final String category;
  final String title;
  final String instructor;
  final String instructorImageUrl;

  final double rating;
  final String reviews;

  final String duration;
  final String level;

  final double price;
  final double? discountPrice;

  final bool isSaved;

  final VoidCallback? onTap;
  final VoidCallback? onSave;
  final VoidCallback? onAddToCart;

  final bool _horizontal;

  @override
  Widget build(BuildContext context) {
    if (_horizontal) {
      return _HorizontalPriceCard(
        imageUrl: imageUrl,
        category: category,
        title: title,
        instructor: instructor,
        instructorImageUrl: instructorImageUrl,
        rating: rating,
        reviews: reviews,
        duration: duration,
        level: level,
        price: price,
        discountPrice: discountPrice,
        isSaved: isSaved,
        onTap: onTap,
        onSave: onSave,
        onAddToCart: onAddToCart,
      );
    }

    return _VerticalPriceCard(
      imageUrl: imageUrl,
      category: category,
      title: title,
      instructor: instructor,
      instructorImageUrl: instructorImageUrl,
      rating: rating,
      reviews: reviews,
      duration: duration,
      level: level,
      price: price,
      discountPrice: discountPrice,
      isSaved: isSaved,
      onTap: onTap,
      onSave: onSave,
      onAddToCart: onAddToCart,
    );
  }
}

/// ============================================================================
/// COURSE PROGRESS CARD
/// ============================================================================
///
/// Used for courses the current user already owns.
///
/// Variants:
///
/// ```dart
/// CourseProgressCard(
///   progress: 72,
/// )
///
/// CourseProgressCard.horizontal(
///   progress: 72,
/// )
/// ```
///
class CourseProgressCard extends StatelessWidget {
  const CourseProgressCard({
    super.key,
    this.imageUrl =
        'https://images.unsplash.com/photo-1488190211105-8b0e65b80b4e?q=80&w=1170&auto=format&fit=crop',
    this.category = 'Development',
    this.title = 'Full-Stack Web Development with React & Node.js',
    this.instructor = 'Ahmed Hassan',
    this.instructorImageUrl =
        'https://images.unsplash.com/photo-1682685794700-1e7f3c8d9b5e?q=80&w=400&auto=format&fit=crop',
    this.rating = 4.8,
    this.reviews = '3,241',
    this.duration = '42h',
    this.level = 'Beginner',
    this.progress = 0,
    this.isCompleted = false,
    this.onTap,
  }) : _horizontal = false;

  /// Horizontal progress card.
  const CourseProgressCard.horizontal({
    super.key,
    this.imageUrl =
        'https://images.unsplash.com/photo-1488190211105-8b0e65b80b4e?q=80&w=1170&auto=format&fit=crop',
    this.category = 'Development',
    this.title = 'Full-Stack Web Development with React & Node.js',
    this.instructor = 'Ahmed Hassan',
    this.instructorImageUrl =
        'https://images.unsplash.com/photo-1682685794700-1e7f3c8d9b5e?q=80&w=400&auto=format&fit=crop',
    this.rating = 4.8,
    this.reviews = '3,241',
    this.duration = '42h',
    this.level = 'Beginner',
    this.progress = 0,
    this.isCompleted = false,
    this.onTap,
  }) : _horizontal = true;

  final String imageUrl;
  final String category;
  final String title;
  final String instructor;
  final String instructorImageUrl;

  final double rating;
  final String reviews;

  final String duration;
  final String level;

  final int progress;
  final bool isCompleted;

  final VoidCallback? onTap;

  final bool _horizontal;

  @override
  Widget build(BuildContext context) {
    if (_horizontal) {
      return _HorizontalProgressCard(
        imageUrl: imageUrl,
        category: category,
        title: title,
        instructor: instructor,
        instructorImageUrl: instructorImageUrl,
        rating: rating,
        reviews: reviews,
        duration: duration,
        level: level,
        progress: progress,
        isCompleted: isCompleted,
        onTap: onTap,
      );
    }

    return _VerticalProgressCard(
      imageUrl: imageUrl,
      category: category,
      title: title,
      instructor: instructor,
      instructorImageUrl: instructorImageUrl,
      rating: rating,
      reviews: reviews,
      duration: duration,
      level: level,
      progress: progress,
      isCompleted: isCompleted,
      onTap: onTap,
    );
  }
}

/// ============================================================================
/// VERTICAL PRICE CARD
/// ============================================================================

class _VerticalPriceCard extends StatelessWidget {
  const _VerticalPriceCard({
    required this.imageUrl,
    required this.category,
    required this.title,
    required this.instructor,
    required this.instructorImageUrl,
    required this.rating,
    required this.reviews,
    required this.duration,
    required this.level,
    required this.price,
    required this.discountPrice,
    required this.isSaved,
    required this.onTap,
    required this.onSave,
    required this.onAddToCart,
  });

  final String imageUrl;
  final String category;
  final String title;
  final String instructor;
  final String instructorImageUrl;

  final double rating;
  final String reviews;
  final String duration;
  final String level;

  final double price;
  final double? discountPrice;

  final bool isSaved;

  final VoidCallback? onTap;
  final VoidCallback? onSave;
  final VoidCallback? onAddToCart;

  @override
  Widget build(BuildContext context) {
    return _CourseCardContainer(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CourseImage(imageUrl: imageUrl, onSave: onSave, isSaved: isSaved),

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
                  _CourseBasicInfo(
                    category: category,
                    title: title,
                    instructor: instructor,
                    instructorImageUrl: instructorImageUrl,
                  ),

                  SizedBox(height: context.spaceSm),

                  _CourseMeta(
                    rating: rating,
                    reviews: reviews,
                    duration: duration,
                    level: level,
                  ),

                  SizedBox(height: context.spaceMd),

                  SizedBox(
                    height: context.responsive(48),
                    child: _PriceSection(
                      price: price,
                      discountPrice: discountPrice,
                      onAddToCart: onAddToCart,
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
}

/// ============================================================================
/// HORIZONTAL PRICE CARD
/// ============================================================================

class _HorizontalPriceCard extends StatelessWidget {
  const _HorizontalPriceCard({
    required this.imageUrl,
    required this.category,
    required this.title,
    required this.instructor,
    required this.instructorImageUrl,
    required this.rating,
    required this.reviews,
    required this.duration,
    required this.level,
    required this.price,
    required this.discountPrice,
    required this.isSaved,
    required this.onTap,
    required this.onSave,
    required this.onAddToCart,
  });

  final String imageUrl;
  final String category;
  final String title;
  final String instructor;
  final String instructorImageUrl;

  final double rating;
  final String reviews;
  final String duration;
  final String level;

  final double price;
  final double? discountPrice;

  final bool isSaved;

  final VoidCallback? onTap;
  final VoidCallback? onSave;
  final VoidCallback? onAddToCart;

  @override
  Widget build(BuildContext context) {
    return _CourseCardContainer(
      onTap: onTap,
      child: SizedBox(
        height: context.responsive(190),
        child: Row(
          children: [
            SizedBox(
              width: AdaptiveValue(
                compact: context.responsive(100),
                medium: context.responsive(120),
                expanded: context.responsive(220),
              ).resolve(context),
              child: _CourseImage(
                height: context.responsive(220),
                imageUrl: imageUrl,
                onSave: onSave,
                isSaved: isSaved,
              ),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.all(context.spaceMd),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _CourseBasicInfo(
                      category: category,
                      title: title,
                      instructor: instructor,
                      instructorImageUrl: instructorImageUrl,
                    ),

                    SizedBox(height: context.spaceSm),

                    _CourseMeta(
                      rating: rating,
                      reviews: reviews,
                      duration: duration,
                      level: level,
                    ),

                    const Spacer(),

                    _PriceSection(
                      price: price,
                      discountPrice: discountPrice,
                      onAddToCart: onAddToCart,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ============================================================================
/// VERTICAL PROGRESS CARD
/// ============================================================================

class _VerticalProgressCard extends StatelessWidget {
  const _VerticalProgressCard({
    required this.imageUrl,
    required this.category,
    required this.title,
    required this.instructor,
    required this.instructorImageUrl,
    required this.rating,
    required this.reviews,
    required this.duration,
    required this.level,
    required this.progress,
    required this.isCompleted,
    required this.onTap,
  });

  final String imageUrl;
  final String category;
  final String title;
  final String instructor;
  final String instructorImageUrl;

  final double rating;
  final String reviews;
  final String duration;
  final String level;

  final int progress;
  final bool isCompleted;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return _CourseCardContainer(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CourseImage(imageUrl: imageUrl),

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
                  _CourseBasicInfo(
                    category: category,
                    title: title,
                    instructor: instructor,
                    instructorImageUrl: instructorImageUrl,
                  ),

                  SizedBox(height: context.spaceSm),

                  _CourseMeta(
                    rating: rating,
                    reviews: reviews,
                    duration: duration,
                    level: level,
                  ),

                  SizedBox(height: context.spaceMd),

                  SizedBox(
                    height: context.responsive(48),
                    child: _ProgressSection(
                      progress: progress,
                      isCompleted: isCompleted,
                      onTap: onTap,
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
}

/// ============================================================================
/// HORIZONTAL PROGRESS CARD
/// ============================================================================

class _HorizontalProgressCard extends StatelessWidget {
  const _HorizontalProgressCard({
    required this.imageUrl,
    required this.category,
    required this.title,
    required this.instructor,
    required this.instructorImageUrl,
    required this.rating,
    required this.reviews,
    required this.duration,
    required this.level,
    required this.progress,
    required this.isCompleted,
    required this.onTap,
  });

  final String imageUrl;
  final String category;
  final String title;
  final String instructor;
  final String instructorImageUrl;

  final double rating;
  final String reviews;
  final String duration;
  final String level;

  final int progress;
  final bool isCompleted;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return _CourseCardContainer(
      onTap: onTap,
      child: SizedBox(
        height: context.responsive(180),
        child: Row(
          children: [
            SizedBox(
              width: context.responsive(210),
              child: _CourseImage(imageUrl: imageUrl),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.all(context.spaceMd),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _CourseBasicInfo(
                      category: category,
                      title: title,
                      instructor: instructor,
                      instructorImageUrl: instructorImageUrl,
                    ),

                    SizedBox(height: context.spaceSm),

                    _CourseMeta(
                      rating: rating,
                      reviews: reviews,
                      duration: duration,
                      level: level,
                    ),

                    const Spacer(),

                    _ProgressSection(
                      progress: progress,
                      isCompleted: isCompleted,
                      onTap: onTap,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ============================================================================
/// SHARED CARD CONTAINER
/// ============================================================================

class _CourseCardContainer extends StatelessWidget {
  const _CourseCardContainer({required this.child, this.onTap});

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final card = Container(
      decoration: BoxDecoration(
        color: MyColors.surface(context),
        borderRadius: BorderRadius.circular(context.cardRadiusLg),
        border: Border.all(
          color: MyColors.border(context),
          width: context.borderWidth,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    );

    if (onTap == null) {
      return card;
    }

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(context.cardRadiusLg),
      child: card,
    );
  }
}

/// ============================================================================
/// COURSE BASIC INFORMATION
/// ============================================================================

class _CourseBasicInfo extends StatelessWidget {
  const _CourseBasicInfo({
    required this.category,
    required this.title,
    required this.instructor,
    required this.instructorImageUrl,
  });

  final String category;
  final String title;
  final String instructor;
  final String instructorImageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category.toUpperCase(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.bodySmall.copyWith(
            color: MyColors.textSecondary(context),
            fontWeight: FontWeight.w600,
          ),
        ),

        SizedBox(height: context.spaceXxs),

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
              imageUrl: instructorImageUrl,
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
      ],
    );
  }

  String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));

    if (parts.isEmpty || parts.first.isEmpty) {
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

/// ============================================================================
/// COURSE META
/// ============================================================================

class _CourseMeta extends StatelessWidget {
  const _CourseMeta({
    required this.rating,
    required this.reviews,
    required this.duration,
    required this.level,
  });

  final double rating;
  final String reviews;
  final String duration;
  final String level;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: context.spaceSm,
      runSpacing: context.spaceXxs,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
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

        Row(
          mainAxisSize: MainAxisSize.min,
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

        Row(
          mainAxisSize: MainAxisSize.min,
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
    );
  }

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
}

/// ============================================================================
/// COURSE IMAGE
/// ============================================================================

class _CourseImage extends StatelessWidget {
  const _CourseImage({
    required this.imageUrl,
    this.isSaved = false,
    this.onSave,
    this.height,
  });
  final double? height;
  final String imageUrl;
  final bool isSaved;
  final VoidCallback? onSave;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? context.responsive(150),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) {
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

          if (onSave != null)
            Positioned(
              top: context.spaceSm,
              right: context.spaceSm,
              child: Material(
                color: MyColors.black.withValues(alpha: 0.35),
                shape: const CircleBorder(),
                child: InkWell(
                  onTap: onSave,
                  customBorder: const CircleBorder(),
                  child: Padding(
                    padding: EdgeInsets.all(context.spaceXs),
                    child: Icon(
                      isSaved
                          ? Icons.bookmark_rounded
                          : Icons.bookmark_border_rounded,
                      color: Colors.white,
                      size: context.iconSm,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// ============================================================================
/// PRICE SECTION
/// ============================================================================

class _PriceSection extends StatelessWidget {
  const _PriceSection({
    required this.price,
    required this.discountPrice,
    this.onAddToCart,
  });

  final double price;
  final double? discountPrice;
  final VoidCallback? onAddToCart;

  @override
  Widget build(BuildContext context) {
    final hasDiscount = discountPrice != null && discountPrice! < price;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '\$${(hasDiscount ? discountPrice! : price).toStringAsFixed(0)}',
          style: context.titleMedium.copyWith(
            color: MyColors.textPrimary(context),
            fontWeight: FontWeight.w800,
          ),
        ),

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

        const Spacer(),

        if (onAddToCart != null)
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
              child: IconButton(
                onPressed: onAddToCart,
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  size: context.iconSm,
                  color: MyColors.primary(context),
                ),
              ),
            ),
          ),
      ],
    );
  }

  int _discountPercentage(double original, double discounted) {
    return ((1 - discounted / original) * 100).round();
  }
}

/// ============================================================================
/// PROGRESS SECTION
/// ============================================================================

class _ProgressSection extends StatelessWidget {
  const _ProgressSection({
    required this.progress,
    required this.isCompleted,
    this.onTap,
  });

  final int progress;
  final bool isCompleted;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final value = progress.clamp(0, 100) / 100;

    return Row(
      children: [
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
            child: IconButton(
              onPressed: onTap,
              padding: EdgeInsets.zero,
              icon: Icon(
                isCompleted
                    ? Icons.verified_outlined
                    : Icons.play_arrow_rounded,
                size: context.iconSm,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

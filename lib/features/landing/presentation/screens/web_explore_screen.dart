import 'dart:ui';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:learnhub/core/adaptive/adaptive_builder.dart';
import 'package:learnhub/core/adaptive/adaptive_content.dart';
import 'package:learnhub/core/adaptive/adaptive_grid.dart';
import 'package:learnhub/core/adaptive/adaptive_layout.dart';
import 'package:learnhub/core/adaptive/adaptive_value.dart';
import 'package:learnhub/core/adaptive/window_size.dart';
import 'package:learnhub/core/extensions/my_sizes_extensions.dart';
import 'package:learnhub/core/extensions/text_theme_extension.dart';
import 'package:learnhub/core/ui/app_logo.dart';
import 'package:learnhub/core/ui/my_buttons.dart';
import 'package:learnhub/core/utils/app_routes.dart';
import 'package:learnhub/core/utils/my_colors.dart';
import 'package:learnhub/features/common/widgets/course_card.dart';
import 'package:learnhub/features/landing/presentation/widgets/landing_footer.dart';
import 'package:learnhub/features/landing/presentation/widgets/mobile_landing_nav_bar.dart';
import 'package:learnhub/features/landing/presentation/widgets/web_landing_nav_bar.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final List<String> _categories = const [
    'Development',
    'Design',
    'Business',
    'Marketing',
    'Data Science',
    'Photography',
    'Personal Development',
  ];

  ExploreFilters _filters = const ExploreFilters();

  bool _desktopFiltersVisible = true;

  final List<_ExploreCourse> _courses = const [
    _ExploreCourse(
      category: 'Development',
      title: 'Full-Stack Web Development with React & Node.js',
      instructor: 'Ahmed Hassan',
      rating: 4.8,
      reviews: '3,241',
      duration: '42h',
      level: 'Beginner',
      price: 49,
      discountPrice: 29,
      imageUrl:
          'https://images.unsplash.com/photo-1498050108023-c5249f4df085?q=80&w=1200&auto=format&fit=crop',
    ),
    _ExploreCourse(
      category: 'Design',
      title: 'UI/UX Design Masterclass',
      instructor: 'Sarah Ahmed',
      rating: 4.9,
      reviews: '1,842',
      duration: '28h',
      level: 'Intermediate',
      price: 59,
      discountPrice: 39,
      imageUrl:
          'https://images.unsplash.com/photo-1561070791-2526d30994b5?q=80&w=1200&auto=format&fit=crop',
    ),
    _ExploreCourse(
      category: 'Business',
      title: 'Business Strategy & Entrepreneurship',
      instructor: 'Omar Khaled',
      rating: 4.7,
      reviews: '1,204',
      duration: '19h',
      level: 'Beginner',
      price: 39,
      imageUrl:
          'https://images.unsplash.com/photo-1556761175-b413da4baf72?q=80&w=1200&auto=format&fit=crop',
    ),
    _ExploreCourse(
      category: 'Marketing',
      title: 'Digital Marketing from Zero to Expert',
      instructor: 'Maya Ibrahim',
      rating: 4.6,
      reviews: '982',
      duration: '24h',
      level: 'Intermediate',
      price: 44,
      discountPrice: 24,
      imageUrl:
          'https://images.unsplash.com/photo-1460925895917-afdab827c52f?q=80&w=1200&auto=format&fit=crop',
    ),
    _ExploreCourse(
      category: 'Data Science',
      title: 'Python for Data Science',
      instructor: 'Youssef Ali',
      rating: 4.9,
      reviews: '4,120',
      duration: '36h',
      level: 'Intermediate',
      price: 69,
      discountPrice: 49,
      imageUrl:
          'https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=1200&auto=format&fit=crop',
    ),
    _ExploreCourse(
      category: 'Development',
      title: 'Flutter App Development',
      instructor: 'Mohamed Samir',
      rating: 4.8,
      reviews: '2,432',
      duration: '31h',
      level: 'Intermediate',
      price: 55,
      imageUrl:
          'https://images.unsplash.com/photo-1551650975-87deedd944c3?q=80&w=1200&auto=format&fit=crop',
    ),
    _ExploreCourse(
      category: 'Design',
      title: 'Motion Design with After Effects',
      instructor: 'Lina Hassan',
      rating: 4.8,
      reviews: '1,124',
      duration: '22h',
      level: 'Advanced',
      price: 49,
      discountPrice: 34,
      imageUrl:
          'https://images.unsplash.com/photo-1558655146-d09347e92766?q=80&w=1200&auto=format&fit=crop',
    ),
    _ExploreCourse(
      category: 'Development',
      title: 'Backend Engineering with Node.js',
      instructor: 'Karim Mostafa',
      rating: 4.7,
      reviews: '1,531',
      duration: '27h',
      level: 'Intermediate',
      price: 54,
      imageUrl:
          'https://images.unsplash.com/photo-1518770660439-4636190af475?q=80&w=1200&auto=format&fit=crop',
    ),
  ];

  final List<_LearningPath> _paths = const [
    _LearningPath(
      title: 'Become a Full-Stack Developer',
      description:
          'Go from the fundamentals to building and deploying complete web applications.',
      courses: '8 courses',
      duration: '120+ hours',
      colorType: _PathColor.blue,
      icon: Icons.code_rounded,
    ),
    _LearningPath(
      title: 'Master UI/UX Design',
      description:
          'Build strong design foundations and create polished digital experiences.',
      courses: '6 courses',
      duration: '78 hours',
      colorType: _PathColor.yellow,
      icon: Icons.design_services_rounded,
    ),
    _LearningPath(
      title: 'Data Science Career Path',
      description:
          'Learn Python, data analysis, visualization and machine learning.',
      courses: '7 courses',
      duration: '96 hours',
      colorType: _PathColor.purple,
      icon: Icons.insights_rounded,
    ),
  ];

  List<_ExploreCourse> get _filteredCourses {
    return _courses.where((course) {
      if (_filters.category != null && course.category != _filters.category) {
        return false;
      }

      if (_filters.levels.isNotEmpty &&
          !_filters.levels.contains(course.level)) {
        return false;
      }

      if (course.rating < _filters.minRating) {
        return false;
      }

      switch (_filters.price) {
        case CoursePriceFilter.all:
          break;

        case CoursePriceFilter.free:
          if (course.price != 0) {
            return false;
          }

        case CoursePriceFilter.paid:
          if (course.price == 0) {
            return false;
          }
      }

      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background(context),
      body: SafeArea(
        bottom: false,
        child: AdaptiveBuilder(
          builder: (context, windowSize) {
            return Column(
              children: [
                AdaptiveLayout(
                  compact: const MobileLandingNavBar(),
                  medium: const MobileLandingNavBar(),
                  expanded: const WebLandingNavBar(),
                ),
                Expanded(
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverToBoxAdapter(
                        child: _ExploreHero(
                          categories: _categories,
                          selectedCategory: _filters.category,
                          onCategorySelected: (category) {
                            setState(() {
                              _filters = _filters.copyWith(category: category);
                            });
                          },
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: AdaptiveContent(
                          maxWidth: 1440,
                          padding: EdgeInsets.symmetric(
                            horizontal: AdaptiveValue<double>(
                              compact: 16,
                              medium: 28,
                              expanded: 50,
                            ).resolve(context),
                            vertical: context.spaceXl,
                          ),
                          child: _ExploreContent(
                            windowSize: windowSize,
                            categories: _categories,
                            courses: _filteredCourses,
                            paths: _paths,
                            filters: _filters,
                            filtersVisible: _desktopFiltersVisible,
                            onFilterChanged: (filters) {
                              setState(() {
                                _filters = filters;
                              });
                            },
                            onClearFilters: _clearFilters,
                            onToggleFilters: () {
                              setState(() {
                                _desktopFiltersVisible =
                                    !_desktopFiltersVisible;
                              });
                            },
                            onOpenMobileFilters: _openFilterSheet,
                          ),
                        ),
                      ),
                      const SliverToBoxAdapter(child: SizedBox(height: 40)),
                      const SliverToBoxAdapter(child: LandingFooter()),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _clearFilters() {
    setState(() {
      _filters = const ExploreFilters();
    });
  }

  void _openFilterSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return _FilterBottomSheet(
          filters: _filters,
          categories: _categories,
          onApply: (filters) {
            setState(() {
              _filters = filters;
            });

            Navigator.of(sheetContext).pop();
          },
        );
      },
    );
  }
}

class _ExploreContent extends StatelessWidget {
  const _ExploreContent({
    required this.windowSize,
    required this.categories,
    required this.courses,
    required this.paths,
    required this.filters,
    required this.filtersVisible,
    required this.onFilterChanged,
    required this.onClearFilters,
    required this.onToggleFilters,
    required this.onOpenMobileFilters,
  });

  final WindowSize windowSize;
  final List<String> categories;
  final List<_ExploreCourse> courses;
  final List<_LearningPath> paths;
  final ExploreFilters filters;
  final bool filtersVisible;

  final ValueChanged<ExploreFilters> onFilterChanged;
  final VoidCallback onClearFilters;
  final VoidCallback onToggleFilters;
  final VoidCallback onOpenMobileFilters;

  @override
  Widget build(BuildContext context) {
    if (windowSize == WindowSize.expanded) {
      return _ExpandedExploreContent(
        categories: categories,
        courses: courses,
        paths: paths,
        filters: filters,
        filtersVisible: filtersVisible,
        onFilterChanged: onFilterChanged,
        onClearFilters: onClearFilters,
        onToggleFilters: onToggleFilters,
      );
    }

    if (windowSize == WindowSize.medium) {
      return _MediumExploreContent(
        categories: categories,
        courses: courses,
        paths: paths,
        filters: filters,
        onOpenFilters: onOpenMobileFilters,
      );
    }

    return _CompactExploreContent(
      categories: categories,
      courses: courses,
      paths: paths,
      filters: filters,
      onOpenFilters: onOpenMobileFilters,
    );
  }
}

class _ExpandedExploreContent extends StatelessWidget {
  const _ExpandedExploreContent({
    required this.categories,
    required this.courses,
    required this.paths,
    required this.filters,
    required this.filtersVisible,
    required this.onFilterChanged,
    required this.onClearFilters,
    required this.onToggleFilters,
  });

  final List<String> categories;
  final List<_ExploreCourse> courses;
  final List<_LearningPath> paths;
  final ExploreFilters filters;
  final bool filtersVisible;

  final ValueChanged<ExploreFilters> onFilterChanged;
  final VoidCallback onClearFilters;
  final VoidCallback onToggleFilters;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeading(
          eyebrow: 'DISCOVER',
          title: 'Find your next skill',
          subtitle:
              'Explore courses, guided learning paths and expert-led content built to help you make real progress.',
        ),
        SizedBox(height: context.spaceXl),
        _CategorySection(
          categories: categories,
          selectedCategory: filters.category,
          onSelected: (category) {
            onFilterChanged(filters.copyWith(category: category));
          },
        ),
        SizedBox(height: context.spaceXxl),
        _LearningPathsSection(paths: paths),
        SizedBox(height: context.spaceXxl),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOut,
              width: filtersVisible ? 270 : 0,
              child: ClipRect(
                child: filtersVisible
                    ? Padding(
                        padding: EdgeInsets.only(right: context.spaceXl),
                        child: ExploreFilterSidebar(
                          filters: filters,
                          categories: categories,
                          onChanged: onFilterChanged,
                          onClear: onClearFilters,
                          onClose: onToggleFilters,
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ),
            Expanded(
              child: _CourseCollection(
                title: 'Popular courses',
                subtitle:
                    'Start with the courses learners are loving right now.',
                courses: courses,
                filtersVisible: filtersVisible,
                onToggleFilters: onToggleFilters,
              ),
            ),
          ],
        ),
        SizedBox(height: context.spaceXxl),
        _TrendingSection(courses: courses),
        SizedBox(height: context.spaceXxl),
        const _LearningFormatsSection(),
        SizedBox(height: context.spaceXxl),
        const _ExploreCta(),
      ],
    );
  }
}

class _MediumExploreContent extends StatelessWidget {
  const _MediumExploreContent({
    required this.categories,
    required this.courses,
    required this.paths,
    required this.filters,
    required this.onOpenFilters,
  });

  final List<String> categories;
  final List<_ExploreCourse> courses;
  final List<_LearningPath> paths;
  final ExploreFilters filters;
  final VoidCallback onOpenFilters;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeading(
          eyebrow: 'DISCOVER',
          title: 'Find your next skill',
          subtitle:
              'Explore courses and guided paths designed around practical skills.',
        ),
        SizedBox(height: context.spaceLg),
        _CategorySection(
          categories: categories,
          selectedCategory: filters.category,
          onSelected: (_) {},
        ),
        SizedBox(height: context.spaceXxl),
        _LearningPathsSection(paths: paths),
        SizedBox(height: context.spaceXxl),
        _ExploreToolbar(
          count: courses.length,
          hasFilters: filters.hasFilters,
          onFilterPressed: onOpenFilters,
        ),
        SizedBox(height: context.spaceLg),
        _CourseGrid(courses: courses),
        SizedBox(height: context.spaceXxl),
        _TrendingSection(courses: courses),
        SizedBox(height: context.spaceXxl),
        const _LearningFormatsSection(),
        SizedBox(height: context.spaceXxl),
        const _ExploreCta(),
      ],
    );
  }
}

class _CompactExploreContent extends StatelessWidget {
  const _CompactExploreContent({
    required this.categories,
    required this.courses,
    required this.paths,
    required this.filters,
    required this.onOpenFilters,
  });

  final List<String> categories;
  final List<_ExploreCourse> courses;
  final List<_LearningPath> paths;
  final ExploreFilters filters;
  final VoidCallback onOpenFilters;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeading(
          eyebrow: 'DISCOVER',
          title: 'Find your next skill',
          subtitle:
              'Courses, learning paths and practical skills in one place.',
        ),
        SizedBox(height: context.spaceLg),
        _CategorySection(
          categories: categories,
          selectedCategory: filters.category,
          onSelected: (_) {},
        ),
        SizedBox(height: context.spaceXl),
        _LearningPathsSection(paths: paths),
        SizedBox(height: context.spaceXl),
        _ExploreToolbar(
          count: courses.length,
          hasFilters: filters.hasFilters,
          onFilterPressed: onOpenFilters,
        ),
        SizedBox(height: context.spaceLg),
        _CourseGrid(courses: courses),
        SizedBox(height: context.spaceXl),
        _TrendingSection(courses: courses),
        SizedBox(height: context.spaceXl),
        const _LearningFormatsSection(),
        SizedBox(height: context.spaceXl),
        const _ExploreCta(),
      ],
    );
  }
}

class _ExploreHero extends StatelessWidget {
  const _ExploreHero({
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  final List<String> categories;
  final String? selectedCategory;
  final ValueChanged<String?> onCategorySelected;

  static const String _heroImage =
      'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?q=80&w=1800&auto=format&fit=crop';

  @override
  Widget build(BuildContext context) {
    final heroHeight = context.responsive(400);

    final horizontalPadding = AdaptiveValue<double>(
      compact: 20,
      medium: 36,
      expanded: 50,
    ).resolve(context);

    final verticalPadding = AdaptiveValue<double>(
      compact: 30,
      medium: 40,
      expanded: 50,
    ).resolve(context);

    return SizedBox(
      height: heroHeight,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Blurred background image
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Image.network(
              _heroImage,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) {
                return Container(color: MyColors.surfaceAlt(context));
              },
            ),
          ),

          // Soft overlay to keep the content readable
          DecoratedBox(
            decoration: BoxDecoration(
              color: MyColors.navy.withValues(alpha: 0.72),
            ),
          ),

          SafeArea(
            bottom: false,
            child: Center(
              child: AdaptiveContent(
                maxWidth: 950,
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Find your next skill',
                      textAlign: TextAlign.center,
                      style: context.bodyLarge.copyWith(
                        color: MyColors.yellow,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: context.spaceSm),

                    Text(
                      'What do you want to learn?',
                      textAlign: TextAlign.center,
                      style: context.displayMedium.copyWith(
                        color: MyColors.textWhite,
                        fontWeight: FontWeight.w800,
                        height: 1.05,
                      ),
                    ),

                    SizedBox(height: context.spaceSm),

                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 620),
                      child: Text(
                        'Explore courses, learning paths, and practical skills to help you reach your goals.',
                        textAlign: TextAlign.center,
                        style: context.bodyLarge.copyWith(
                          color: MyColors.textWhite.withValues(alpha: 0.78),
                          height: 1.5,
                        ),
                      ),
                    ),

                    SizedBox(height: context.spaceXl),

                    // Search
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 720),
                      child: TextField(
                        style: context.bodyLarge.copyWith(
                          color: MyColors.textPrimary(context),
                        ),
                        decoration: InputDecoration(
                          hintText: 'Search courses, topics, instructors...',
                          hintStyle: context.bodyLarge.copyWith(
                            color: MyColors.textSecondary(context),
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: context.spaceMd),
                            child: Icon(
                              Icons.search_rounded,
                              color: MyColors.textSecondary(context),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: context.spaceLg),
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

class _SectionHeading extends StatelessWidget {
  const _SectionHeading({
    required this.eyebrow,
    required this.title,
    required this.subtitle,
  });

  final String eyebrow;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          eyebrow,
          style: context.labelLarge.copyWith(
            color: MyColors.primary(context),
            fontWeight: FontWeight.w800,
            letterSpacing: 1.4,
          ),
        ),
        SizedBox(height: context.spaceXs),
        Text(
          title,
          style: context.headlineMedium.copyWith(fontWeight: FontWeight.w800),
        ),
        SizedBox(height: context.spaceXs),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Text(
            subtitle,
            style: context.bodyLarge.copyWith(
              color: MyColors.textSecondary(context),
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}

class _CategorySection extends StatelessWidget {
  const _CategorySection({
    required this.categories,
    required this.selectedCategory,
    required this.onSelected,
  });

  final List<String> categories;
  final String? selectedCategory;
  final ValueChanged<String?> onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: context.spaceSm,
      runSpacing: context.spaceSm,
      children: [
        _CategoryTile(
          title: 'All',
          icon: Icons.apps_rounded,
          selected: selectedCategory == null,
          onTap: () => onSelected(null),
        ),
        ...categories.map(
          (category) => _CategoryTile(
            title: category,
            icon: _categoryIcon(category),
            selected: selectedCategory == category,
            onTap: () => onSelected(category),
          ),
        ),
      ],
    );
  }

  IconData _categoryIcon(String category) {
    switch (category) {
      case 'Development':
        return Icons.code_rounded;
      case 'Design':
        return Icons.palette_outlined;
      case 'Business':
        return Icons.business_center_outlined;
      case 'Marketing':
        return Icons.campaign_outlined;
      case 'Data Science':
        return Icons.analytics_outlined;
      case 'Photography':
        return Icons.camera_alt_outlined;
      case 'Personal Development':
        return Icons.self_improvement_outlined;
      default:
        return Icons.school_outlined;
    }
  }
}

class _CategoryTile extends StatelessWidget {
  const _CategoryTile({
    required this.title,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(context.radiusMd),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: EdgeInsets.symmetric(
          horizontal: context.spaceMd,
          vertical: context.spaceSm,
        ),
        decoration: BoxDecoration(
          color: selected
              ? MyColors.primary(context).withValues(alpha: .10)
              : MyColors.surface(context),
          borderRadius: BorderRadius.circular(context.radiusMd),
          border: Border.all(
            color: selected
                ? MyColors.primary(context)
                : MyColors.border(context),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: context.iconSm,
              color: selected
                  ? MyColors.primary(context)
                  : MyColors.textSecondary(context),
            ),
            SizedBox(width: context.spaceXs),
            Text(
              title,
              style: context.bodyMedium.copyWith(
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LearningPathsSection extends StatelessWidget {
  const _LearningPathsSection({required this.paths});

  final List<_LearningPath> paths;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionHeading(
          eyebrow: 'LEARNING PATHS',
          title: 'Learn with a clear direction',
          subtitle:
              'Follow a curated sequence of courses instead of figuring out what to learn next.',
        ),
        SizedBox(height: context.spaceLg),
        AdaptiveGrid(
          minItemWidth: 280,
          maxItemWidth: 460,
          spacing: context.spaceMd,
          runSpacing: context.spaceMd,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemHeight: context.responsive(250),
          children: paths.map((path) => _LearningPathCard(path: path)).toList(),
        ),
      ],
    );
  }
}

class _LearningPathCard extends StatelessWidget {
  const _LearningPathCard({required this.path});

  final _LearningPath path;

  @override
  Widget build(BuildContext context) {
    final accent = switch (path.colorType) {
      _PathColor.blue => MyColors.blue,
      _PathColor.yellow => MyColors.yellow,
      _PathColor.purple => MyColors.primary(context),
    };

    return Container(
      padding: EdgeInsets.all(context.spaceLg),
      decoration: BoxDecoration(
        color: MyColors.surface(context),
        borderRadius: BorderRadius.circular(context.cardRadiusLg),
        border: Border.all(color: MyColors.border(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: .12),
                  borderRadius: BorderRadius.circular(context.radiusMd),
                ),
                child: Icon(path.icon, color: accent),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_rounded),
            ],
          ),
          SizedBox(height: context.spaceMd),
          Text(
            path.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: context.titleMedium.copyWith(fontWeight: FontWeight.w800),
          ),
          SizedBox(height: context.spaceXs),
          Expanded(
            child: Text(
              path.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.bodySmall.copyWith(
                color: MyColors.textSecondary(context),
                height: 1.4,
              ),
            ),
          ),
          SizedBox(height: context.spaceSm),
          Row(
            children: [
              Icon(
                Icons.menu_book_outlined,
                size: context.iconXs,
                color: MyColors.textSecondary(context),
              ),
              SizedBox(width: context.spaceXxs),
              Text(
                path.courses,
                style: context.bodySmall.copyWith(
                  color: MyColors.textSecondary(context),
                ),
              ),
              SizedBox(width: context.spaceMd),
              Icon(
                Icons.access_time_rounded,
                size: context.iconXs,
                color: MyColors.textSecondary(context),
              ),
              SizedBox(width: context.spaceXxs),
              Text(
                path.duration,
                style: context.bodySmall.copyWith(
                  color: MyColors.textSecondary(context),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CourseCollection extends StatelessWidget {
  const _CourseCollection({
    required this.title,
    required this.subtitle,
    required this.courses,
    required this.filtersVisible,
    required this.onToggleFilters,
  });

  final String title;
  final String subtitle;
  final List<_ExploreCourse> courses;
  final bool filtersVisible;
  final VoidCallback onToggleFilters;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: _SectionHeading(
                eyebrow: 'COURSES',
                title: title,
                subtitle: subtitle,
              ),
            ),
            OutlinedButton.icon(
              onPressed: onToggleFilters,
              icon: Icon(
                filtersVisible
                    ? Icons.filter_alt_off_outlined
                    : Icons.filter_alt_outlined,
              ),
              label: Text(filtersVisible ? 'Hide filters' : 'Filters'),
            ),
          ],
        ),
        SizedBox(height: context.spaceLg),
        _CourseGrid(courses: courses),
      ],
    );
  }
}

class _CourseGrid extends StatelessWidget {
  const _CourseGrid({required this.courses});

  final List<_ExploreCourse> courses;

  @override
  Widget build(BuildContext context) {
    if (courses.isEmpty) {
      return const _EmptyCourses();
    }

    return AdaptiveGrid(
      minItemWidth: 270,
      maxItemWidth: context.screenWidth * .25,
      spacing: context.spaceLg,
      runSpacing: context.spaceLg,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemHeight: AdaptiveValue(
        compact: context.responsive(410),
        medium: context.responsive(400),
        expanded: context.responsive(410),
      ).resolve(context),
      children: courses
          .map(
            (course) => SizedBox(
              width: 270,
              child: CourseCard(
                imageUrl: course.imageUrl,
                category: course.category,
                title: course.title,
                instructor: course.instructor,
                rating: course.rating,
                reviews: course.reviews,
                duration: course.duration,
                level: course.level,
                price: course.price,
                discountPrice: course.discountPrice,
              ),
            ),
          )
          .toList(),
    );
  }
}

class _ExploreToolbar extends StatelessWidget {
  const _ExploreToolbar({
    required this.count,
    required this.hasFilters,
    required this.onFilterPressed,
  });

  final int count;
  final bool hasFilters;
  final VoidCallback onFilterPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Popular courses',
              style: context.titleLarge.copyWith(fontWeight: FontWeight.w800),
            ),
            SizedBox(height: context.spaceXxs),
            Text(
              '$count courses',
              style: context.bodySmall.copyWith(
                color: MyColors.textSecondary(context),
              ),
            ),
          ],
        ),
        const Spacer(),
        OutlinedButton.icon(
          onPressed: onFilterPressed,
          icon: Icon(
            hasFilters ? Icons.filter_alt_rounded : Icons.tune_rounded,
          ),
          label: const Text('Filters'),
        ),
      ],
    );
  }
}

// class _TrendingSection extends StatelessWidget {
//   const _TrendingSection({required this.courses});

//   final List<_ExploreCourse> courses;

//   @override
//   Widget build(BuildContext context) {
//     final trending = courses.take(4).toList();

//     final cardWidth = AdaptiveValue<double>(
//       compact: 420,
//       medium: 500,
//       expanded: 560,
//     ).resolve(context);

//     final cardHeight = AdaptiveValue<double>(
//       compact: 190,
//       medium: 200,
//       expanded: 210,
//     ).resolve(context);

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const _SectionHeading(
//           eyebrow: 'TRENDING NOW',
//           title: 'What learners are watching',
//           subtitle: 'Popular courses that are getting attention right now.',
//         ),

//         SizedBox(height: context.spaceLg),

//         SizedBox(
//           height: cardHeight,
//           child: ListView.separated(
//             scrollDirection: Axis.horizontal,
//             itemCount: trending.length,
//             separatorBuilder: (_, __) {
//               return SizedBox(width: context.spaceMd);
//             },
//             itemBuilder: (context, index) {
//               final course = trending[index];

//               return SizedBox(
//                 width: cardWidth,
//                 height: cardHeight,
//                 child: CourseCard.horizontal(
//                   imageUrl: course.imageUrl,
//                   category: course.category,
//                   title: course.title,
//                   instructor: course.instructor,
//                   rating: course.rating,
//                   reviews: course.reviews,
//                   duration: course.duration,
//                   level: course.level,
//                   price: course.price,
//                   discountPrice: course.discountPrice,
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

class _TrendingSection extends StatelessWidget {
  const _TrendingSection({required this.courses});

  final List<_ExploreCourse> courses;

  @override
  Widget build(BuildContext context) {
    final trending = courses.take(4).toList();

    final carouselHeight = AdaptiveValue<double>(
      compact: 230,
      medium: 230,
      expanded: 210,
    ).resolve(context);

    final viewportFraction = AdaptiveValue<double>(
      compact: 0.92,
      medium: 0.72,
      expanded: 0.58,
    ).resolve(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionHeading(
          eyebrow: 'TRENDING NOW',
          title: 'What learners are watching',
          subtitle: 'Popular courses that are getting attention right now.',
        ),

        SizedBox(height: context.spaceLg),

        SizedBox(
          height: carouselHeight,

          child: CarouselSlider.builder(
            itemCount: trending.length,
            itemBuilder: (context, index, realIndex) {
              final course = trending[index];

              return Padding(
                padding: EdgeInsets.only(right: context.spaceMd),
                child: CourseCard.horizontal(
                  imageUrl: course.imageUrl,
                  category: course.category,
                  title: course.title,
                  instructor: course.instructor,
                  rating: course.rating,
                  reviews: course.reviews,
                  duration: course.duration,
                  level: course.level,
                  price: course.price,
                  discountPrice: course.discountPrice,
                ),
              );
            },
            options: CarouselOptions(
              height: carouselHeight,
              viewportFraction: viewportFraction,

              enlargeCenterPage: false,
              enableInfiniteScroll: trending.length > 1,
              autoPlay: trending.length > 1,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 700),
              autoPlayCurve: Curves.easeInOut,
              padEnds: false,
            ),
          ),
        ),
      ],
    );
  }
}

class _LearningFormatsSection extends StatelessWidget {
  const _LearningFormatsSection();

  @override
  Widget build(BuildContext context) {
    const formats = [
      (
        Icons.play_circle_outline_rounded,
        'Video courses',
        'Learn at your own pace with structured lessons.',
      ),
      (
        Icons.route_outlined,
        'Learning paths',
        'Follow a curated path from beginner to confident.',
      ),
      (
        Icons.code_rounded,
        'Hands-on projects',
        'Build real things instead of only watching tutorials.',
      ),
      (
        Icons.verified_outlined,
        'Certificates',
        'Showcase the skills you have worked to develop.',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionHeading(
          eyebrow: 'LEARN YOUR WAY',
          title: 'More than just courses',
          subtitle:
              'Choose the learning experience that fits the way you learn best.',
        ),
        SizedBox(height: context.spaceLg),
        AdaptiveGrid(
          minItemWidth: 230,
          maxItemWidth: 340,
          spacing: context.spaceMd,
          runSpacing: context.spaceMd,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemHeight: 180,
          children: formats
              .map(
                (format) => _FormatCard(
                  icon: format.$1,
                  title: format.$2,
                  description: format.$3,
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _FormatCard extends StatelessWidget {
  const _FormatCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.spaceLg),
      decoration: BoxDecoration(
        color: MyColors.surface(context),
        borderRadius: BorderRadius.circular(context.cardRadiusLg),
        border: Border.all(color: MyColors.border(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: MyColors.primary(context), size: context.iconLg),
          SizedBox(height: context.spaceMd),
          Text(
            title,
            style: context.titleMedium.copyWith(fontWeight: FontWeight.w800),
          ),
          SizedBox(height: context.spaceXs),
          Expanded(
            child: Text(
              description,
              style: context.bodySmall.copyWith(
                color: MyColors.textSecondary(context),
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExploreCta extends StatelessWidget {
  const _ExploreCta();

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

class ExploreFilterSidebar extends StatelessWidget {
  const ExploreFilterSidebar({
    super.key,
    required this.filters,
    required this.categories,
    required this.onChanged,
    required this.onClear,
    required this.onClose,
  });

  final ExploreFilters filters;
  final List<String> categories;
  final ValueChanged<ExploreFilters> onChanged;
  final VoidCallback onClear;
  final VoidCallback onClose;

  static const levels = ['Beginner', 'Intermediate', 'Advanced'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.spaceLg),
      decoration: BoxDecoration(
        color: MyColors.surface(context),
        borderRadius: BorderRadius.circular(context.cardRadiusLg),
        border: Border.all(
          color: MyColors.border(context),
          width: context.borderWidth,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Filters',
                style: context.titleMedium.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Spacer(),
              if (filters.hasFilters)
                TextButton(onPressed: onClear, child: const Text('Clear')),
              IconButton(
                tooltip: 'Close filters',
                onPressed: onClose,
                icon: const Icon(Icons.close_rounded),
              ),
            ],
          ),
          SizedBox(height: context.spaceMd),
          const _FilterTitle(title: 'Category'),
          SizedBox(height: context.spaceSm),
          ...categories.map((category) {
            final selected = filters.category == category;

            return _FilterRadioItem(
              label: category,
              selected: selected,
              onTap: () {
                onChanged(
                  filters.copyWith(category: selected ? null : category),
                );
              },
            );
          }),
          SizedBox(height: context.spaceMd),
          Divider(color: MyColors.border(context)),
          SizedBox(height: context.spaceMd),
          const _FilterTitle(title: 'Level'),
          SizedBox(height: context.spaceSm),
          ...levels.map((level) {
            final selected = filters.levels.contains(level);

            return _FilterCheckboxItem(
              label: level,
              selected: selected,
              onTap: () {
                final updated = Set<String>.from(filters.levels);

                if (selected) {
                  updated.remove(level);
                } else {
                  updated.add(level);
                }

                onChanged(filters.copyWith(levels: updated));
              },
            );
          }),
          SizedBox(height: context.spaceMd),
          Divider(color: MyColors.border(context)),
          SizedBox(height: context.spaceMd),
          const _FilterTitle(title: 'Rating'),
          SizedBox(height: context.spaceSm),
          for (final rating in [4.5, 4.0, 3.0])
            _RatingFilterItem(
              rating: rating,
              selected: filters.minRating == rating,
              onTap: () {
                onChanged(
                  filters.copyWith(
                    minRating: filters.minRating == rating ? 0 : rating,
                  ),
                );
              },
            ),
          SizedBox(height: context.spaceMd),
          Divider(color: MyColors.border(context)),
          SizedBox(height: context.spaceMd),
          const _FilterTitle(title: 'Price'),
          SizedBox(height: context.spaceSm),
          _FilterRadioItem(
            label: 'All',
            selected: filters.price == CoursePriceFilter.all,
            onTap: () {
              onChanged(filters.copyWith(price: CoursePriceFilter.all));
            },
          ),
          _FilterRadioItem(
            label: 'Free',
            selected: filters.price == CoursePriceFilter.free,
            onTap: () {
              onChanged(filters.copyWith(price: CoursePriceFilter.free));
            },
          ),
          _FilterRadioItem(
            label: 'Paid',
            selected: filters.price == CoursePriceFilter.paid,
            onTap: () {
              onChanged(filters.copyWith(price: CoursePriceFilter.paid));
            },
          ),
        ],
      ),
    );
  }
}

class _FilterBottomSheet extends StatefulWidget {
  const _FilterBottomSheet({
    required this.filters,
    required this.categories,
    required this.onApply,
  });

  final ExploreFilters filters;
  final List<String> categories;
  final ValueChanged<ExploreFilters> onApply;

  @override
  State<_FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<_FilterBottomSheet> {
  late ExploreFilters _filters;

  @override
  void initState() {
    super.initState();
    _filters = widget.filters;
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: .72,
      minChildSize: .45,
      maxChildSize: .95,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: MyColors.surface(context),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
          ),
          child: Column(
            children: [
              SizedBox(height: context.spaceSm),
              Container(
                width: 42,
                height: 4,
                decoration: BoxDecoration(
                  color: MyColors.border(context),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.spaceLg,
                  vertical: context.spaceMd,
                ),
                child: Row(
                  children: [
                    Text(
                      'Filters',
                      style: context.headlineSmall.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _filters = const ExploreFilters();
                        });
                      },
                      child: const Text('Clear'),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close_rounded),
                    ),
                  ],
                ),
              ),
              Divider(height: 1, color: MyColors.border(context)),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: EdgeInsets.all(context.spaceLg),
                  children: [
                    const _FilterTitle(title: 'Category'),
                    SizedBox(height: context.spaceSm),
                    ...widget.categories.map((category) {
                      final selected = _filters.category == category;

                      return _FilterRadioItem(
                        label: category,
                        selected: selected,
                        onTap: () {
                          setState(() {
                            _filters = _filters.copyWith(
                              category: selected ? null : category,
                            );
                          });
                        },
                      );
                    }),
                    SizedBox(height: context.spaceLg),
                    Divider(color: MyColors.border(context)),
                    SizedBox(height: context.spaceLg),
                    const _FilterTitle(title: 'Level'),
                    SizedBox(height: context.spaceSm),
                    for (final level in [
                      'Beginner',
                      'Intermediate',
                      'Advanced',
                    ])
                      _FilterCheckboxItem(
                        label: level,
                        selected: _filters.levels.contains(level),
                        onTap: () {
                          final updated = Set<String>.from(_filters.levels);

                          if (updated.contains(level)) {
                            updated.remove(level);
                          } else {
                            updated.add(level);
                          }

                          setState(() {
                            _filters = _filters.copyWith(levels: updated);
                          });
                        },
                      ),
                    SizedBox(height: context.spaceLg),
                    Divider(color: MyColors.border(context)),
                    SizedBox(height: context.spaceLg),
                    const _FilterTitle(title: 'Rating'),
                    SizedBox(height: context.spaceSm),
                    for (final rating in [4.5, 4.0, 3.0])
                      _RatingFilterItem(
                        rating: rating,
                        selected: _filters.minRating == rating,
                        onTap: () {
                          setState(() {
                            _filters = _filters.copyWith(
                              minRating: _filters.minRating == rating
                                  ? 0
                                  : rating,
                            );
                          });
                        },
                      ),
                    SizedBox(height: context.spaceLg),
                    Divider(color: MyColors.border(context)),
                    SizedBox(height: context.spaceLg),
                    const _FilterTitle(title: 'Price'),
                    SizedBox(height: context.spaceSm),
                    _FilterRadioItem(
                      label: 'All',
                      selected: _filters.price == CoursePriceFilter.all,
                      onTap: () {
                        setState(() {
                          _filters = _filters.copyWith(
                            price: CoursePriceFilter.all,
                          );
                        });
                      },
                    ),
                    _FilterRadioItem(
                      label: 'Free',
                      selected: _filters.price == CoursePriceFilter.free,
                      onTap: () {
                        setState(() {
                          _filters = _filters.copyWith(
                            price: CoursePriceFilter.free,
                          );
                        });
                      },
                    ),
                    _FilterRadioItem(
                      label: 'Paid',
                      selected: _filters.price == CoursePriceFilter.paid,
                      onTap: () {
                        setState(() {
                          _filters = _filters.copyWith(
                            price: CoursePriceFilter.paid,
                          );
                        });
                      },
                    ),
                  ],
                ),
              ),
              SafeArea(
                top: false,
                child: Padding(
                  padding: EdgeInsets.all(context.spaceLg),
                  child: SizedBox(
                    width: double.infinity,
                    height: context.buttonHeightLg,
                    child: MyButtons.primary(
                      onPressed: () {
                        widget.onApply(_filters);
                      },
                      child: const Text('Apply Filters'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _FilterTitle extends StatelessWidget {
  const _FilterTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.bodyMedium.copyWith(
        fontWeight: FontWeight.w700,
        color: MyColors.textPrimary(context),
      ),
    );
  }
}

class _FilterRadioItem extends StatelessWidget {
  const _FilterRadioItem({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(context.radiusSm),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: context.spaceXxs),
        child: Row(
          children: [
            Icon(
              selected
                  ? Icons.radio_button_checked_rounded
                  : Icons.radio_button_unchecked_rounded,
              size: context.iconSm,
              color: selected
                  ? MyColors.primary(context)
                  : MyColors.textSecondary(context),
            ),
            SizedBox(width: context.spaceXs),
            Expanded(
              child: Text(
                label,
                style: context.bodyMedium.copyWith(
                  color: selected
                      ? MyColors.textPrimary(context)
                      : MyColors.textSecondary(context),
                  fontWeight: selected ? FontWeight.w600 : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterCheckboxItem extends StatelessWidget {
  const _FilterCheckboxItem({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Checkbox(value: selected, onChanged: (_) => onTap()),
          Expanded(child: Text(label, style: context.bodyMedium)),
        ],
      ),
    );
  }
}

class _RatingFilterItem extends StatelessWidget {
  const _RatingFilterItem({
    required this.rating,
    required this.selected,
    required this.onTap,
  });

  final double rating;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: context.spaceXxs),
        child: Row(
          children: [
            Icon(
              selected
                  ? Icons.radio_button_checked_rounded
                  : Icons.radio_button_unchecked_rounded,
              size: context.iconSm,
              color: selected
                  ? MyColors.primary(context)
                  : MyColors.textSecondary(context),
            ),
            SizedBox(width: context.spaceXs),
            ...List.generate(
              5,
              (index) => Icon(
                index < rating.floor()
                    ? Icons.star_rounded
                    : Icons.star_border_rounded,
                size: context.iconXs,
                color: MyColors.yellow,
              ),
            ),
            SizedBox(width: context.spaceXs),
            Text('$rating+', style: context.bodySmall),
          ],
        ),
      ),
    );
  }
}

class _EmptyCourses extends StatelessWidget {
  const _EmptyCourses();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: context.spaceXxl),
      child: Column(
        children: [
          Icon(
            Icons.search_off_rounded,
            size: context.iconXl,
            color: MyColors.textSecondary(context),
          ),
          SizedBox(height: context.spaceMd),
          Text(
            'No courses found',
            style: context.titleLarge.copyWith(fontWeight: FontWeight.w700),
          ),
          SizedBox(height: context.spaceXs),
          Text(
            'Try changing your filters to find more courses.',
            textAlign: TextAlign.center,
            style: context.bodyMedium.copyWith(
              color: MyColors.textSecondary(context),
            ),
          ),
        ],
      ),
    );
  }
}

enum CoursePriceFilter { all, free, paid }

class ExploreFilters {
  const ExploreFilters({
    this.category,
    this.levels = const {},
    this.minRating = 0,
    this.price = CoursePriceFilter.all,
  });

  final String? category;
  final Set<String> levels;
  final double minRating;
  final CoursePriceFilter price;

  bool get hasFilters {
    return category != null ||
        levels.isNotEmpty ||
        minRating > 0 ||
        price != CoursePriceFilter.all;
  }

  ExploreFilters copyWith({
    String? category,
    Set<String>? levels,
    double? minRating,
    CoursePriceFilter? price,
  }) {
    return ExploreFilters(
      category: category,
      levels: levels ?? this.levels,
      minRating: minRating ?? this.minRating,
      price: price ?? this.price,
    );
  }
}

class _ExploreCourse {
  const _ExploreCourse({
    required this.category,
    required this.title,
    required this.instructor,
    required this.rating,
    required this.reviews,
    required this.duration,
    required this.level,
    required this.price,
    required this.imageUrl,
    this.discountPrice,
  });

  final String category;
  final String title;
  final String instructor;
  final double rating;
  final String reviews;
  final String duration;
  final String level;
  final double price;
  final double? discountPrice;
  final String imageUrl;
}

enum _PathColor { blue, yellow, purple }

class _LearningPath {
  const _LearningPath({
    required this.title,
    required this.description,
    required this.courses,
    required this.duration,
    required this.colorType,
    required this.icon,
  });

  final String title;
  final String description;
  final String courses;
  final String duration;
  final _PathColor colorType;
  final IconData icon;
}

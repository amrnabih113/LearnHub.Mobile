import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:learnhub/core/adaptive/adaptive_builder.dart';
import 'package:learnhub/core/adaptive/adaptive_content.dart';
import 'package:learnhub/core/adaptive/adaptive_layout.dart';
import 'package:learnhub/core/adaptive/adaptive_value.dart';
import 'package:learnhub/core/adaptive/window_size.dart';
import 'package:learnhub/core/extensions/my_sizes_extensions.dart';
import 'package:learnhub/core/utils/my_colors.dart';

import 'package:learnhub/features/landing/presentation/cubit/explore_filters_cubit.dart';
import 'package:learnhub/features/landing/presentation/screens/mobile/mobile_explore_content.dart';
import 'package:learnhub/features/landing/presentation/screens/web/expanded_explore_content.dart';
import 'package:learnhub/features/landing/presentation/widgets/explore_hero.dart';
import 'package:learnhub/features/landing/presentation/widgets/explore_mokeup_data.dart';
import 'package:learnhub/features/landing/presentation/widgets/filter_bottom_sheet.dart';
import 'package:learnhub/features/landing/presentation/widgets/explore_filters.dart';
import 'package:learnhub/features/landing/presentation/widgets/landing_footer.dart';
import 'package:learnhub/features/landing/presentation/widgets/mobile_landing_nav_bar.dart';
import 'package:learnhub/features/landing/presentation/widgets/web_landing_nav_bar.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final List<String> _categories = ExploreMokeupData.categories;

  final List<LearningPath> _paths = ExploreMokeupData.paths;

  bool _desktopFiltersVisible = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ExploreFilterCubit(courses: ExploreMokeupData.courses),
      child: _ExploreView(
        categories: _categories,
        paths: _paths,
        desktopFiltersVisible: _desktopFiltersVisible,
        onToggleDesktopFilters: _toggleDesktopFilters,
        onOpenMobileFilters: _openFilterSheet,
      ),
    );
  }

  void _toggleDesktopFilters() {
    setState(() {
      _desktopFiltersVisible = !_desktopFiltersVisible;
    });
  }


  void _openFilterSheet() {
    final cubit = context.read<ExploreFilterCubit>();

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return FilterBottomSheet(
          filters: cubit.state.filters,
          categories: _categories,
          onApply: (filters) {
            cubit.updateFilters(filters);

            Navigator.of(sheetContext).pop();
          },
        );
      },
    );
  }
}


class _ExploreView extends StatelessWidget {
  const _ExploreView({
    required this.categories,
    required this.paths,
    required this.desktopFiltersVisible,
    required this.onToggleDesktopFilters,
    required this.onOpenMobileFilters,
  });

  final List<String> categories;
  final List<LearningPath> paths;

  final bool desktopFiltersVisible;

  final VoidCallback onToggleDesktopFilters;
  final VoidCallback onOpenMobileFilters;

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

                // =================================================================
                // CONTENT
                // =================================================================
                Expanded(
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      // =============================================================
                      // HERO
                      // =============================================================
                      SliverToBoxAdapter(
                        child:
                            BlocBuilder<ExploreFilterCubit, ExploreFilterState>(
                              buildWhen: (previous, current) =>
                                  previous.filters.category !=
                                  current.filters.category,
                              builder: (context, state) {
                                return ExploreHero(
                                  categories: categories,
                                  selectedCategory: state.filters.category,
                                  onCategorySelected: (category) {
                                    context
                                        .read<ExploreFilterCubit>()
                                        .selectCategory(category);
                                  },
                                );
                              },
                            ),
                      ),

                      // =============================================================
                      // EXPLORE CONTENT
                      // =============================================================
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
                          child:
                              BlocBuilder<
                                ExploreFilterCubit,
                                ExploreFilterState
                              >(
                                builder: (context, state) {
                                  return ExploreContent(
                                    windowSize: windowSize,
                                    categories: categories,
                                    courses: state.filteredCourses,
                                    paths: paths,
                                    filters: state.filters,
                                    filtersVisible: desktopFiltersVisible,
                                    onFilterChanged: context
                                        .read<ExploreFilterCubit>()
                                        .updateFilters,
                                    onClearFilters: context
                                        .read<ExploreFilterCubit>()
                                        .clearFilters,
                                    onToggleFilters: onToggleDesktopFilters,
                                    onOpenMobileFilters: onOpenMobileFilters,
                                  );
                                },
                              ),
                        ),
                      ),

                      // =============================================================
                      // SPACING
                      // =============================================================
                      const SliverToBoxAdapter(child: SizedBox(height: 40)),

                      // =============================================================
                      // FOOTER
                      // =============================================================
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
}

// =============================================================================
// EXPLORE CONTENT
// =============================================================================

class ExploreContent extends StatelessWidget {
  const ExploreContent({
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
  final List<ExploreCourse> courses;
  final List<LearningPath> paths;

  final ExploreFilters filters;

  final bool filtersVisible;

  final ValueChanged<ExploreFilters> onFilterChanged;

  final VoidCallback onClearFilters;
  final VoidCallback onToggleFilters;
  final VoidCallback onOpenMobileFilters;

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      compact: MobileExploreContent(
        categories: categories,
        courses: courses,
        paths: paths,
        filters: filters,
        onOpenFilters: onOpenMobileFilters,
      ),
      expanded: ExpandedExploreContent(
        categories: categories,
        courses: courses,
        paths: paths,
        filters: filters,
        filtersVisible: filtersVisible,
        onFilterChanged: onFilterChanged,
        onClearFilters: onClearFilters,
        onToggleFilters: onToggleFilters,
      ),
    );
  }
}

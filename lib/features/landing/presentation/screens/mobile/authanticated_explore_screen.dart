import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnhub/core/adaptive/adaptive_builder.dart';
import 'package:learnhub/core/adaptive/adaptive_content.dart';
import 'package:learnhub/core/adaptive/adaptive_layout.dart';
import 'package:learnhub/core/adaptive/adaptive_value.dart';
import 'package:learnhub/core/adaptive/window_size.dart';
import 'package:learnhub/core/extensions/my_sizes_extensions.dart';
import 'package:learnhub/core/utils/my_colors.dart';
import 'package:learnhub/features/common/domain/entities/course.dart';
import 'package:learnhub/features/landing/domain/entities/explore_filters.dart';
import 'package:learnhub/features/landing/domain/entities/learning_path.dart';
import 'package:learnhub/features/landing/presentation/cubit/explore_cubit.dart';
import 'package:learnhub/features/landing/presentation/screens/mobile/mobile_explore_content.dart';
import 'package:learnhub/features/landing/presentation/screens/web/web_explore_content.dart';
import 'package:learnhub/features/landing/presentation/widgets/explore_hero.dart';
import 'package:learnhub/features/landing/presentation/widgets/filter_bottom_sheet.dart';
import 'package:learnhub/service_locator.dart';

class AuthenticatedExploreScreen extends StatefulWidget {
  const AuthenticatedExploreScreen({super.key});

  @override
  State<AuthenticatedExploreScreen> createState() =>
      _AuthenticatedExploreScreenState();
}

class _AuthenticatedExploreScreenState
    extends State<AuthenticatedExploreScreen> {
  bool _desktopFiltersVisible = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExploreCubit>(
      create: (_) => sl.get<ExploreCubit>()..loadExploreData(),
      child: BlocBuilder<ExploreCubit, ExploreState>(
        builder: (context, state) {
          return _AuthenticatedExploreView(
            categories: state.categoryNames,
            paths: state.paths,
            desktopFiltersVisible: _desktopFiltersVisible,
            onToggleDesktopFilters: _toggleDesktopFilters,
            onOpenMobileFilters: () => _openFilterSheet(context),
          );
        },
      ),
    );
  }

  void _toggleDesktopFilters() {
    setState(() {
      _desktopFiltersVisible = !_desktopFiltersVisible;
    });
  }

  void _openFilterSheet(BuildContext context) {
    final cubit = context.read<ExploreCubit>();

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return FilterBottomSheet(
          filters: cubit.state.filters,
          categories: cubit.state.categoryNames,
          onApply: (filters) {
            cubit.updateFilters(filters);
            Navigator.of(sheetContext).pop();
          },
        );
      },
    );
  }
}

class _AuthenticatedExploreView extends StatelessWidget {
  const _AuthenticatedExploreView({
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
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: BlocBuilder<ExploreCubit, ExploreState>(
                    buildWhen: (previous, current) =>
                        previous.filters.category != current.filters.category ||
                        previous.categories != current.categories,
                    builder: (context, state) {
                      return ExploreHero(
                        categories: state.categoryNames,
                        selectedCategory: state.filters.category,
                        onCategorySelected: (category) {
                          context.read<ExploreCubit>().selectCategory(category);
                        },
                        onSearchChanged: (query) {
                          context.read<ExploreCubit>().searchCourses(query);
                        },
                      );
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
                    child: BlocBuilder<ExploreCubit, ExploreState>(
                      builder: (context, state) {
                        if (state.isLoading && state.allCourses.isEmpty) {
                          return const Center(
                            child: Padding(
                              padding: EdgeInsets.all(40),
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }

                        return AuthenticatedExploreContent(
                          windowSize: windowSize,
                          categories: state.categoryNames,
                          courses: state.filteredCourses,
                          paths: state.paths,
                          filters: state.filters,
                          filtersVisible: desktopFiltersVisible,
                          onFilterChanged: context
                              .read<ExploreCubit>()
                              .updateFilters,
                          onClearFilters: context
                              .read<ExploreCubit>()
                              .clearFilters,
                          onToggleFilters: onToggleDesktopFilters,
                          onOpenMobileFilters: onOpenMobileFilters,
                          onCategorySelected: (category) {
                            context.read<ExploreCubit>().selectCategory(
                              category,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),

                const SliverToBoxAdapter(child: SizedBox(height: 40)),
              ],
            );
          },
        ),
      ),
    );
  }
}

class AuthenticatedExploreContent extends StatelessWidget {
  const AuthenticatedExploreContent({
    super.key,
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
    this.onCategorySelected,
  });

  final WindowSize windowSize;
  final List<String> categories;
  final List<Course> courses;
  final List<LearningPath> paths;
  final ExploreFilters filters;
  final bool filtersVisible;

  final ValueChanged<ExploreFilters> onFilterChanged;
  final VoidCallback onClearFilters;
  final VoidCallback onToggleFilters;
  final VoidCallback onOpenMobileFilters;
  final ValueChanged<String?>? onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      compact: MobileExploreContent(
        categories: categories,
        courses: courses,
        paths: paths,
        filters: filters,
        onOpenFilters: onOpenMobileFilters,
        onCategorySelected: onCategorySelected,
      ),
      medium: MobileExploreContent(
        categories: categories,
        courses: courses,
        paths: paths,
        filters: filters,
        onOpenFilters: onOpenMobileFilters,
        onCategorySelected: onCategorySelected,
      ),
      expanded: WebExploreContent(
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

import 'package:flutter/material.dart';
import 'package:learnhub/features/landing/domain/entities/explore_filters.dart';
import 'package:learnhub/features/landing/presentation/widgets/filter_bottom_sheet_state.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({
    super.key,
    required this.filters,
    required this.categories,
    required this.onApply,
  });

  final ExploreFilters filters;
  final List<String> categories;
  final ValueChanged<ExploreFilters> onApply;

  @override
  State<FilterBottomSheet> createState() => FilterBottomSheetState();
}

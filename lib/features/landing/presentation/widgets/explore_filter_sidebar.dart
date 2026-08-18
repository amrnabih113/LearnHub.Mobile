import 'package:flutter/material.dart';
import '../../../../core/extensions/my_sizes_extensions.dart';
import '../../../../core/extensions/text_theme_extension.dart';
import '../../../../core/utils/my_colors.dart';
import '../../domain/entities/explore_filters.dart';
import 'filter_checkbox_item.dart';
import 'filter_radio_item.dart';
import 'filter_title.dart';
import 'rating_filter_item.dart';

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
          const FilterTitle(title: 'Category'),
          SizedBox(height: context.spaceSm),
          ...categories.map((category) {
            final selected = filters.category == category;

            return FilterRadioItem(
              label: category,
              selected: selected,
              onTap: () {
                onChanged(
                  filters.copyWith(
                    category: selected ? null : category,
                    clearCategory: selected,
                  ),
                );
              },
            );
          }),
          SizedBox(height: context.spaceMd),
          Divider(color: MyColors.border(context)),
          SizedBox(height: context.spaceMd),
          const FilterTitle(title: 'Level'),
          SizedBox(height: context.spaceSm),
          ...levels.map((level) {
            final selected = filters.levels.contains(level);

            return FilterCheckboxItem(
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
          const FilterTitle(title: 'Rating'),
          SizedBox(height: context.spaceSm),
          for (final rating in [4.5, 4.0, 3.0])
            RatingFilterItem(
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
          const FilterTitle(title: 'Price'),
          SizedBox(height: context.spaceSm),
          FilterRadioItem(
            label: 'All',
            selected: filters.price == CoursePriceFilter.all,
            onTap: () {
              onChanged(filters.copyWith(price: CoursePriceFilter.all));
            },
          ),
          FilterRadioItem(
            label: 'Free',
            selected: filters.price == CoursePriceFilter.free,
            onTap: () {
              onChanged(filters.copyWith(price: CoursePriceFilter.free));
            },
          ),
          FilterRadioItem(
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

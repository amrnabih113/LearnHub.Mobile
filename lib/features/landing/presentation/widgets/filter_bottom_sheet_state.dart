import 'package:flutter/material.dart';
import 'package:learnhub/core/extensions/my_sizes_extensions.dart';
import 'package:learnhub/core/extensions/text_theme_extension.dart';
import 'package:learnhub/core/ui/my_buttons.dart';
import 'package:learnhub/core/utils/my_colors.dart';
import 'package:learnhub/features/landing/presentation/widgets/explore_mokeup_data.dart';
import 'package:learnhub/features/landing/presentation/widgets/filter_bottom_sheet.dart';
import 'package:learnhub/features/landing/presentation/widgets/explore_filters.dart';
import 'package:learnhub/features/landing/presentation/widgets/filter_checkbox_item.dart';
import 'package:learnhub/features/landing/presentation/widgets/filter_radio_item.dart';
import 'package:learnhub/features/landing/presentation/widgets/filter_title.dart';
import 'package:learnhub/features/landing/presentation/widgets/rating_filter_item.dart';

class FilterBottomSheetState extends State<FilterBottomSheet> {
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
                    const FilterTitle(title: 'Category'),
                    SizedBox(height: context.spaceSm),
                    ...widget.categories.map((category) {
                      final selected = _filters.category == category;

                      return FilterRadioItem(
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
                    const FilterTitle(title: 'Level'),
                    SizedBox(height: context.spaceSm),
                    for (final level in [
                      'Beginner',
                      'Intermediate',
                      'Advanced',
                    ])
                      FilterCheckboxItem(
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
                    const FilterTitle(title: 'Rating'),
                    SizedBox(height: context.spaceSm),
                    for (final rating in [4.5, 4.0, 3.0])
                      RatingFilterItem(
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
                    const FilterTitle(title: 'Price'),
                    SizedBox(height: context.spaceSm),
                    FilterRadioItem(
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
                    FilterRadioItem(
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
                    FilterRadioItem(
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

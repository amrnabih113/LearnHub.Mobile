import 'package:flutter/material.dart';
import '../../../../core/extensions/my_sizes_extensions.dart';
import 'category_tile.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key, 
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
        CategoryTile(
          title: 'All',
          icon: Icons.apps_rounded,
          selected: selectedCategory == null,
          onTap: () => onSelected(null),
        ),
        ...categories.map(
          (category) => CategoryTile(
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

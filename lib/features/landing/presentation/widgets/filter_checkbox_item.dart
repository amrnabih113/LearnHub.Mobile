import 'package:flutter/material.dart';
import '../../../../core/extensions/text_theme_extension.dart';

class FilterCheckboxItem extends StatelessWidget {
  const FilterCheckboxItem({super.key, 
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

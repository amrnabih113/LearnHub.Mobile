import 'package:flutter/material.dart';
import '../../../../core/adaptive/adaptive_context.dart';
import '../../../../core/extensions/my_sizes_extensions.dart';
import '../../../../core/ui/my_buttons.dart';

class HeroSearch extends StatelessWidget {
  const HeroSearch({super.key});

  @override
  Widget build(BuildContext context) {
    var isCompact = AdaptiveContext.of(context).isCompact;
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 10,
      runSpacing: 10,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: AdaptiveContext.of(context).isExpanded ? 400 : 320,
          ),
          child: Expanded(
            child: SizedBox(
              height: context.buttonHeight,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search courses, topics, instructors...',
                  prefixIcon: isCompact
                      ? null
                      : const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(Icons.search),
                        ),

                  contentPadding: EdgeInsets.symmetric(
                    horizontal: context.gap(10),
                  ),
                ),
              ),
            ),
          ),
        ),

        SizedBox(
          height: context.buttonHeight,
          child: MyButtons.accent(
            onPressed: () {},
            child: isCompact ? const Icon(Icons.search) : const Text('Search'),
            context: context,
          ),
        ),
      ],
    );
  }
}

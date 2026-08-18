import 'package:flutter/material.dart';
import '../../../../core/adaptive/adaptive_layout.dart';
import '../../../../core/extensions/my_sizes_extensions.dart';
import '../../../../core/ui/app_logo.dart';
import '../../../../core/utils/my_colors.dart';
import 'my_end_drawer_button.dart';

class MobileLandingNavBar extends StatelessWidget {
  const MobileLandingNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.appBarHeight,
      width: double.infinity,
      padding: context.paddingHorizontalXl,
      child: AdaptiveLayout(
        compact: MobileActions(),
        medium: TabletActions(),
        expanded: const SizedBox.shrink(),
      ),
    );
  }
}

class TabletActions extends StatelessWidget {
  const TabletActions({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = MyColors.isDark(context);

    return Row(
      children: [
        AppLogo(
          logoColor: isDark
              ? MyColors.textPrimaryDark
              : MyColors.textPrimaryLight,
        ),

        const SizedBox(width: 24),

        Expanded(
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Search courses...',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        SizedBox(width: context.gap(40)),
        // ----------------------------------------------------
        MyEndDrawerButton(),
        SizedBox(width: context.gap(10)),
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.wb_sunny_outlined,
            color: isDark
                ? MyColors.textPrimaryDark
                : MyColors.textPrimaryLight,
          ),
        ),
      ],
    );
  }
}

class MobileActions extends StatelessWidget {
  const MobileActions({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = MyColors.isDark(context);
    return Row(
      children: [
        AppLogo(
          logoColor: isDark
              ? MyColors.textPrimaryDark
              : MyColors.textPrimaryLight,
        ),
        const Spacer(),
        IconButton(
          tooltip: 'Search',
          onPressed: () {},
          icon: Icon(
            Icons.search,
            color: isDark
                ? MyColors.textPrimaryDark
                : MyColors.textPrimaryLight,
          ),
        ),

        MyEndDrawerButton(),
      ],
    );
  }
}

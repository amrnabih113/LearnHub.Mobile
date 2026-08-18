import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/my_sizes_extensions.dart';
import '../../../../core/ui/app_logo.dart';
import '../../../../core/ui/my_buttons.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/my_colors.dart';

class WebLandingNavBar extends StatelessWidget {
  const WebLandingNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = MyColors.isDark(context);

    return SizedBox(
      height: context.appBarHeightLg,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.gap(70)),
        child: Row(
          children: [
            AppLogo(
              logoColor: isDark
                  ? MyColors.textPrimaryDark
                  : MyColors.textPrimaryLight,
            ),

            SizedBox(width: context.gap(20)),

            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search courses, topics, instructors...',
                  prefixIcon: const Icon(Icons.search),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: context.gap(14),
                  ),
                ),
              ),
            ),

            SizedBox(width: context.gap(40)),

            TextButton(
              onPressed: () {
                context.go(AppRoutes.subscription);
              },
              child: const Text('Subscribe'),
            ),

            SizedBox(width: context.gap(5)),

            TextButton(onPressed: () {}, child: const Text('Teach With Us')),

            SizedBox(width: context.gap(5)),

            MyButtons.accent(
              onPressed: () {
                context.go(AppRoutes.login);
              },
              child: const Text('Log in'),
            ),

            SizedBox(width: context.gap(10)),

            MyButtons.primary(
              onPressed: () {
                context.go(AppRoutes.register);
              },
              child: const Text('Register'),
            ),

            SizedBox(width: context.gap(30)),

            const Icon(Icons.wb_sunny_outlined),
          ],
        ),
      ),
    );
  }
}

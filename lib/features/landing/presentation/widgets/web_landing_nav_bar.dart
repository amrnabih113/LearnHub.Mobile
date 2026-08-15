import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learnhub/core/extensions/my_sizes_extensions.dart';
import 'package:learnhub/core/ui/app_logo.dart';
import 'package:learnhub/core/ui/my_buttons.dart';
import 'package:learnhub/core/utils/app_routes.dart';
import 'package:learnhub/core/utils/my_colors.dart';

class WebLandingNavBar extends StatelessWidget {
  WebLandingNavBar({super.key});
  @override
  Widget build(BuildContext context) {
    final bool isDark = MyColors.isDark(context);
    return Container(
      height: context.appBarHeightLg,
      padding: EdgeInsets.symmetric(horizontal: context.gap(70)),
      child: Row(
        children: [
          AppLogo(
            logoColor: isDark
                ? MyColors.textPrimaryDark
                : MyColors.textPrimaryLight,
          ),

          SizedBox(width: context.gap(20)),

          // Search
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search courses, topics, instructors...',
                prefixIcon: Padding(
                  padding: context.paddingSm,
                  child: const Icon(Icons.search),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),

          SizedBox(width: context.gap(40)),

          // Navigation
          TextButton(child: Text('Subscribe'), onPressed: () {}),
          SizedBox(width: context.gap(5)),
          TextButton(child: Text('Teach With Us'), onPressed: () {}),
          SizedBox(width: context.gap(5)),
          MyButtons.accent(
            child: Text('Log in'),
            onPressed: () {
              context.go(AppRoutes.login);
            },
          ),

          SizedBox(width: context.gap(10)),

          // Register
          MyButtons.primary(
            onPressed: () {
              context.go(AppRoutes.register);
            },
            child: const Text('Register'),
          ),
          SizedBox(width: context.gap(30)),

          Icon(Icons.wb_sunny_outlined),
        ],
      ),
    );
  }
}

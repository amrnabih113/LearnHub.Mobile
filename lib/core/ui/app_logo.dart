import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learnhub/core/extensions/go_router_extension.dart';
import 'package:learnhub/core/extensions/my_sizes_extensions.dart';
import 'package:learnhub/core/extensions/text_theme_extension.dart';
import 'package:learnhub/core/utils/app_routes.dart';
import 'package:learnhub/core/utils/my_colors.dart';
import 'package:learnhub/core/utils/my_images.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.logoColor = MyColors.white});
  final Color logoColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        kIsWeb
            ? context.goIfDifferent(AppRoutes.landing)
            : context.goIfDifferent(AppRoutes.home);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SvgPicture.asset(
            MyImages.appLogoDark,
            width: context.iconLg,
            height: context.iconLg,
            colorFilter: ColorFilter.mode(logoColor, BlendMode.srcIn),
          ),
          SizedBox(width: context.gap(10)),
          RichText(
            text: TextSpan(
              text: 'Learn',
              style: context.titleMedium.copyWith(
                color: logoColor,
                fontWeight: FontWeight.w900,
              ),
              children: [
                TextSpan(
                  text: 'Hub',
                  style: context.titleMedium.copyWith(
                    color: MyColors.yellow,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

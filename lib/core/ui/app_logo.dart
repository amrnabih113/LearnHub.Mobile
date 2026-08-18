import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../extensions/go_router_extension.dart';
import '../extensions/my_sizes_extensions.dart';
import '../extensions/text_theme_extension.dart';
import '../utils/app_routes.dart';
import '../utils/my_colors.dart';
import '../utils/my_images.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.logoColor = MyColors.white, this.size, this.fontSize});
  final Color logoColor;
  final double? size;
  final double? fontSize;
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
            width: size ?? context.iconLg,
            height: size ?? context.iconLg,
            colorFilter: ColorFilter.mode(logoColor, BlendMode.srcIn),
          ),
          SizedBox(width: context.gap(10)),
          RichText(
            text: TextSpan(
              text: 'Learn',
              style: context.titleMedium.copyWith(
                color: logoColor,
                fontWeight: FontWeight.w900,
                fontSize: fontSize ?? context.titleMedium.fontSize,
              ),
              children: [
                TextSpan(
                  text: 'Hub',
                  style: context.titleMedium.copyWith(
                    color: MyColors.yellow,
                    fontWeight: FontWeight.w900,
                    fontSize: fontSize ?? context.titleMedium.fontSize,
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

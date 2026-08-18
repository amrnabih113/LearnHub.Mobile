import 'package:flutter/material.dart';

import '../utils/my_colors.dart';

class MyAvatar extends StatelessWidget {
  const MyAvatar({super.key, this.imageUrl, this.fallback, this.size = 40});

  final String? imageUrl;
  final Widget? fallback;
  final double size;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      width: size,
      height: size,
      child: ClipOval(
        child: imageUrl != null && imageUrl!.isNotEmpty
            ? Image.network(
                imageUrl!,
                width: size,
                height: size,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) {
                  return _fallback(isDark);
                },
              )
            : _fallback(isDark),
      ),
    );
  }

  Widget _fallback(bool isDark) {
    return Container(
      width: size * 0.8,
      height: size * 0.8,
      color: isDark ? MyColors.blueDark : MyColors.blue,
      alignment: Alignment.center,
      child: fallback,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/extensions/my_sizes_extensions.dart';
import '../../../../core/ui/app_logo.dart';
import '../../../../core/ui/my_buttons.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/my_colors.dart';

class MobileLandingDrawer extends StatelessWidget {
  const MobileLandingDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = MyColors.isDark(context);

    return Drawer(
      width: context.screenWidth * 0.6,
      backgroundColor: isDark ? MyColors.surfaceDark : MyColors.surfaceLight,

      child: SafeArea(
        child: ListView(
          shrinkWrap: false,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 18, 12, 18),
              child: Row(
                children: [
                  AppLogo(
                    logoColor: isDark
                        ? MyColors.textPrimaryDark
                        : MyColors.textPrimaryLight,
                  ),

                  const Spacer(),
                  IconButton(
                    tooltip: 'Theme',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.wb_sunny_outlined),
                  ),
                ],
              ),
            ),

            Divider(height: 1, color: MyColors.border(context)),

            const SizedBox(height: 12),

            // ==================================================
            // MAIN NAVIGATION
            // ==================================================
            _DrawerItem(
              icon: Icons.explore_outlined,
              title: 'Explore',
              onTap: () {
                context.go(AppRoutes.explore);
              },
            ),

            _DrawerItem(
              icon: Icons.workspace_premium_outlined,
              title: 'Subscribe',
              onTap: () {
                context.go(AppRoutes.subscription);
              },
            ),

            _DrawerItem(
              icon: Icons.school_outlined,
              title: 'Teach With Us',
              onTap: () {
                Navigator.pop(context);
              },
            ),

            SizedBox(height: context.gap(50)),

            // ==================================================
            // ACCOUNT ACTIONS
            // ==================================================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: context.buttonHeight,
                    child: MyButtons.primary(
                      onPressed: () {
                        Navigator.pop(context);
                        context.go(AppRoutes.login);
                      },
                      child: const Text('Log in'),
                    ),
                  ),

                  const SizedBox(height: 10),

                  SizedBox(
                    width: double.infinity,
                    height: context.buttonHeight,
                    child: MyButtons.accent(
                      onPressed: () {
                        Navigator.pop(context);
                        context.go(AppRoutes.register);
                      },
                      child: const Text('Create account'),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// DRAWER ITEM
class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        leading: Icon(icon, size: 22),
        title: Text(title),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../core/adaptive/adaptive_context.dart';
import '../../../../core/adaptive/adaptive_value.dart';
import '../../../../core/extensions/text_theme_extension.dart';
import '../../../../core/ui/app_logo.dart';
import '../../../../core/utils/my_colors.dart';

class LandingFooter extends StatelessWidget {
  const LandingFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: MyColors.navy,
      child: Column(
        children: [
          // ============================================================
          // MAIN FOOTER
          // ============================================================
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.adaptiveValue<double>(
                compact: 20,
                medium: 32,
                expanded: 70,
              ),
              vertical: context.adaptiveValue<double>(
                compact: 45,
                medium: 55,
                expanded: 65,
              ),
            ),
            child: AdaptiveContext.of(context).isCompact
                ? const _MobileFooterContent()
                : const _DesktopFooterContent(),
          ),

          // ============================================================
          // BOTTOM BAR
          // ============================================================
          const _FooterBottomBar(),
        ],
      ),
    );
  }
}

// ======================================================================
// DESKTOP / TABLET
// ======================================================================

class _DesktopFooterContent extends StatelessWidget {
  const _DesktopFooterContent();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // --------------------------------------------------------------
        // BRAND
        // --------------------------------------------------------------
        Expanded(flex: 2, child: _FooterBrand()),

        const SizedBox(width: 50),

        // --------------------------------------------------------------
        // EXPLORE
        // --------------------------------------------------------------
        Expanded(
          child: _FooterColumn(
            title: 'Explore',
            items: const [
              'Courses',
              'Categories',
              'Subscriptions',
              'Learning Paths',
            ],
          ),
        ),

        // --------------------------------------------------------------
        // LEARNHUB
        // --------------------------------------------------------------
        Expanded(
          child: _FooterColumn(
            title: 'LearnHub',
            items: const [
              'About Us',
              'Teach With Us',
              'Careers',
              'Become an Instructor',
            ],
          ),
        ),

        // --------------------------------------------------------------
        // SUPPORT
        // --------------------------------------------------------------
        Expanded(
          child: _FooterColumn(
            title: 'Support',
            items: const ['Help Center', 'FAQ', 'Contact Us', 'Community'],
          ),
        ),
      ],
    );
  }
}

// ======================================================================
// MOBILE
// ======================================================================

class _MobileFooterContent extends StatelessWidget {
  const _MobileFooterContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _FooterBrand(),

        const SizedBox(height: 40),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _FooterColumn(
                title: 'Explore',
                items: const [
                  'Courses',
                  'Categories',
                  'Subscriptions',
                  'Learning Paths',
                ],
              ),
            ),

            const SizedBox(width: 30),

            Expanded(
              child: _FooterColumn(
                title: 'LearnHub',
                items: const [
                  'About Us',
                  'Teach With Us',
                  'Careers',
                  'Become an Instructor',
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 35),

        _FooterColumn(
          title: 'Support',
          items: const ['Help Center', 'FAQ', 'Contact Us', 'Community'],
        ),
      ],
    );
  }
}

// ======================================================================
// BRAND
// ======================================================================

class _FooterBrand extends StatelessWidget {
  const _FooterBrand();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppLogo(logoColor: MyColors.white),

        const SizedBox(height: 18),

        SizedBox(
          width: 300,
          child: Text(
            'Learn practical skills, build real projects, '
            'and grow your career.',
            style: context.bodyMedium.copyWith(
              color: MyColors.mutedDark,
              height: 1.6,
            ),
          ),
        ),

        const SizedBox(height: 24),

        const _SocialLinks(),
      ],
    );
  }
}

// ======================================================================
// FOOTER COLUMN
// ======================================================================

class _FooterColumn extends StatelessWidget {
  final String title;
  final List<String> items;

  const _FooterColumn({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.titleSmall.copyWith(
            color: MyColors.white,
            fontWeight: FontWeight.w700,
          ),
        ),

        const SizedBox(height: 18),

        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: InkWell(
              onTap: () {
                // TODO: Handle footer navigation.
              },
              child: Text(
                item,
                style: context.bodySmall.copyWith(color: MyColors.mutedDark),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ======================================================================
// SOCIAL LINKS
// ======================================================================

class _SocialLinks extends StatelessWidget {
  const _SocialLinks();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _SocialButton(icon: Icons.facebook_outlined, onTap: () {}),

        const SizedBox(width: 10),

        _SocialButton(icon: Icons.business_center_outlined, onTap: () {}),

        const SizedBox(width: 10),

        _SocialButton(icon: Icons.alternate_email, onTap: () {}),

        const SizedBox(width: 10),

        _SocialButton(icon: Icons.play_circle_outline, onTap: () {}),
      ],
    );
  }
}

// ======================================================================
// SOCIAL BUTTON
// ======================================================================

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _SocialButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withValues(alpha: 0.07),
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          width: 38,
          height: 38,
          child: Icon(icon, size: 19, color: MyColors.white),
        ),
      ),
    );
  }
}

// ======================================================================
// BOTTOM BAR
// ======================================================================

class _FooterBottomBar extends StatelessWidget {
  const _FooterBottomBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: context.adaptiveValue<double>(
          compact: 20,
          medium: 32,
          expanded: 70,
        ),
        vertical: 20,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
      child: AdaptiveContext.of(context).isCompact
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '© 2026 LearnHub. All rights reserved.',
                  style: context.bodySmall.copyWith(color: MyColors.mutedDark),
                ),

                const SizedBox(height: 12),

                const _LegalLinks(),
              ],
            )
          : Row(
              children: [
                Text(
                  '© 2026 LearnHub. All rights reserved.',
                  style: context.bodySmall.copyWith(color: MyColors.mutedDark),
                ),

                const Spacer(),

                const _LegalLinks(),
              ],
            ),
    );
  }
}

// ======================================================================
// LEGAL LINKS
// ======================================================================

class _LegalLinks extends StatelessWidget {
  const _LegalLinks();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 8,
      children: [
        _LegalLink(title: 'Privacy', onTap: () {}),
        _LegalLink(title: 'Terms', onTap: () {}),
        _LegalLink(title: 'Cookies', onTap: () {}),
      ],
    );
  }
}

// ======================================================================
// LEGAL LINK
// ======================================================================

class _LegalLink extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _LegalLink({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        title,
        style: context.bodySmall.copyWith(color: MyColors.mutedDark),
      ),
    );
  }
}

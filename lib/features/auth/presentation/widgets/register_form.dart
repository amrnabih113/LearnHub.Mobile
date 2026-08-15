import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/adaptive/adaptive_content.dart';
import '../../../../core/extensions/my_sizes_extensions.dart';
import '../../../../core/extensions/text_theme_extension.dart';
import '../../../../core/ui/my_buttons.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/my_colors.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: AdaptiveContent(
        padding: context.paddingLg,
        maxWidth: 500,
        child: Container(
          child: Center(
            child: ListView(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(context.gap(5)),
                      width: context.iconXl,
                      height: context.iconXl,
                      decoration: BoxDecoration(
                        color: MyColors.surfaceAlt(context),
                        borderRadius: BorderRadius.circular(context.radiusXl),
                      ),
                      child: Icon(
                        Icons.school_outlined,
                        size: context.iconMd,
                        color: MyColors.primary(context),
                      ),
                    ),
                    SizedBox(width: context.gap(5)),
                    Text(
                      'STUDENT ACCOUNT',
                      style: context.bodyMedium.copyWith(
                        color: MyColors.isDark(context)
                            ? MyColors.textPrimaryDark
                            : MyColors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.gap(30)),

                Text(
                  'Create your LearnHub account',
                  style: context.headlineLarge,
                ),

                SizedBox(height: context.gap(8)),

                Text(
                  'Start learning from thousands of courses.',
                  style: context.bodyLarge,
                ),

                SizedBox(height: context.gap(30)),

                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'First Name',
                            style: context.bodyMedium.copyWith(
                              color: MyColors.textPrimary(context),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: 'John'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: context.gap(12)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Last Name',
                            style: context.bodyMedium.copyWith(
                              color: MyColors.textPrimary(context),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: 'Doe'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.gap(20)),
                // ================================================================
                // EMAIL
                // ================================================================
                Text(
                  'Email address',
                  style: context.bodyMedium.copyWith(
                    color: MyColors.textPrimary(context),
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: context.gap(8)),

                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'you@example.com',
                    prefixIcon: Padding(
                      padding: context.paddingSm,
                      child: Icon(
                        Iconsax.sms,
                        size: context.iconSm,
                        color: MyColors.textSecondary(context),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: context.gap(20)),

                // ================================================================
                // PASSWORD
                // ================================================================
                Text(
                  'Password',
                  style: context.bodyMedium.copyWith(
                    color: MyColors.textPrimary(context),
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: context.gap(8)),

                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    prefixIcon: Padding(
                      padding: context.paddingSm,
                      child: Icon(
                        Iconsax.lock_1,
                        size: context.iconSm,
                        color: MyColors.textSecondary(context),
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Iconsax.eye,
                        size: context.iconSm,
                        color: MyColors.textSecondary(context),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: context.gap(20)),

                Text(
                  'Confirm Password',
                  style: context.bodyMedium.copyWith(
                    color: MyColors.textPrimary(context),
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: context.gap(8)),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Confirm your password',
                    prefixIcon: Padding(
                      padding: context.paddingSm,
                      child: Icon(
                        Iconsax.lock_1,
                        size: context.iconSm,
                        color: MyColors.textSecondary(context),
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Iconsax.eye,
                        size: context.iconSm,
                        color: MyColors.textSecondary(context),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: context.gap(30)),

                // ================================================================
                // LOGIN BUTTON
                // ================================================================
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: MyButtons.accent(
                    onPressed: () {},

                    child: Text(
                      'Create Account',
                      style: context.bodyLarge.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: context.gap(20)),

                // ================================================================
                // REGISTER
                // ================================================================
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: context.bodyMedium.copyWith(
                        color: MyColors.textSecondary(context),
                      ),
                      children: [
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: () {
                              context.go(AppRoutes.login);
                            },
                            child: Text(
                              'login',
                              style: context.bodyMedium.copyWith(
                                color: MyColors.primary(context),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

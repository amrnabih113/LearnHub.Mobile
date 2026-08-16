import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/adaptive/adaptive_content.dart';
import '../../../../core/extensions/my_sizes_extensions.dart';
import '../../../../core/extensions/text_theme_extension.dart';
import '../../../../core/ui/my_buttons.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/my_colors.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: AdaptiveContent(
        padding: context.paddingLg,
        maxWidth: 500,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              // ACCOUNT TYPE
              Row(
                children: [
                  Container(
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
                  SizedBox(width: context.spaceXs),
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

              SizedBox(height: context.spaceXl),

              // TITLE
              Text('Welcome back', style: context.displaySmall),

              SizedBox(height: context.spaceXs),

              Text('Continue your learning journey.', style: context.bodyLarge),

              SizedBox(height: context.spaceXl),

              // EMAIL
              Text(
                'Email address',
                style: context.bodyMedium.copyWith(
                  color: MyColors.textPrimary(context),
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: context.spaceXs),

              SizedBox(
                height: context.inputHeightLg,
                child: TextFormField(
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
              ),

              SizedBox(height: context.spaceMd),

              // PASSWORD
              Text(
                'Password',
                style: context.bodyMedium.copyWith(
                  color: MyColors.textPrimary(context),
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: context.spaceXs),

              SizedBox(
                height: context.inputHeightLg,
                child: TextFormField(
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
              ),

              SizedBox(height: context.spaceSm),

              // REMEMBER / FORGOT PASSWORD
              Row(
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      value: false,
                      onChanged: (value) {},
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text('Remember me', style: context.bodyMedium),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot password?',
                      style: context.bodyMedium.copyWith(
                        color: MyColors.primary(context),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: context.spaceMd),

              // LOGIN BUTTON
              SizedBox(
                width: double.infinity,
                height: context.buttonHeightXl,
                child: MyButtons.accent(
                  onPressed: () {},
                  child: Text(
                    'Login',
                    style: context.titleMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: context.spaceMd),

              // REGISTER
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: context.bodyMedium.copyWith(
                      color: MyColors.textSecondary(context),
                    ),
                    children: [
                      WidgetSpan(
                        child: InkWell(
                          onTap: () {
                            context.pushReplacement(AppRoutes.register);
                          },
                          child: Text(
                            'Register',
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
    );
  }
}

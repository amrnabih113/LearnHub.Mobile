import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:learnhub/core/adaptive/adaptive_content.dart';
import 'package:learnhub/core/extensions/my_sizes_extensions.dart';
import 'package:learnhub/core/extensions/text_theme_extension.dart';
import 'package:learnhub/core/ui/my_buttons.dart';
import 'package:learnhub/core/utils/my_colors.dart';
import 'package:learnhub/core/utils/my_images.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      left: false,
      child: Form(
        child: AdaptiveContent(
          padding: context.paddingLg,
          maxWidth: 500,
          child: Center(
            child: ListView(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                SizedBox(
                  height: context.screenHeight * 0.3,
                  child: Image.asset(MyImages.EmailSent, fit: BoxFit.contain),
                ),
                SizedBox(height: context.spaceXl),
                Text('Forgot Password ?', style: context.headlineMedium),
                SizedBox(height: context.spaceMd),
                Text(
                  'Enter your email address below and we will send you a otp to reset your password.',
                  style: context.bodyLarge,
                ),
                SizedBox(height: context.spaceXl),
                Text('Email Address', style: context.bodyLarge),
                SizedBox(height: context.spaceMd),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: context.paddingHorizontalMd,
                      child: Icon(Iconsax.message),
                    ),
                    hintText: 'Email Address',
                  ),
                ),
                SizedBox(height: context.spaceXl),
                SizedBox(
                  width: double.infinity,
                  height: context.buttonHeightLg,
                  child: MyButtons.accent(
                    onPressed: () {},
                    child: const Text('Send OTP'),
                  ),
                ),
                SizedBox(height: context.spaceXl),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        color: MyColors.border(context),
                      ),
                    ),
                    SizedBox(width: context.spaceMd),
                    Text('OR'),
                    SizedBox(width: context.spaceMd),
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        color: MyColors.border(context),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.spaceXl),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: MyColors.primary(context),
                    ),
                    label: const Text('Back to login'),
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

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/my_validators.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/adaptive/adaptive_content.dart';
import '../../../../core/extensions/my_sizes_extensions.dart';
import '../../../../core/extensions/text_theme_extension.dart';
import '../../../../core/ui/my_buttons.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_images.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key, this.email, this.otp});

  final String? email;
  final String? otp;

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  // CONTROLLERS

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // STATE

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  bool _isResetting = false;

  // LIFECYCLE

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  // RESET PASSWORD

  Future<void> _resetPassword() async {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isResetting = true;
    });

    try {
      // ======================================================================
      // TODO: CONNECT YOUR AUTH LOGIC
      // ======================================================================
      //
      // Example:
      //
      // await controller.resetPassword(
      //   email: widget.email!,
      //   otp: widget.otp!,
      //   newPassword: _passwordController.text,
      // );

      await Future<void>.delayed(const Duration(milliseconds: 800));

      if (!mounted) return;

      // Navigate to password reset success screen.
      //
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (_) => const PasswordResetSuccessScreen(),
      //   ),
      // );
    } finally {
      if (mounted) {
        setState(() {
          _isResetting = false;
        });
      }
    }
  }

  // BUILD

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      left: false,
      child: Form(
        key: _formKey,
        child: AdaptiveContent(
          padding: context.paddingLg,
          maxWidth: 500,
          child: Center(
            child: ListView(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                // ILLUSTRATION
                SizedBox(
                  height: context.screenHeight * 0.30,
                  child: Image.asset(MyImages.resetImage, fit: BoxFit.contain),
                ),

                SizedBox(height: context.spaceMd),

                // TITLE
                Text(
                  'Create a new password',
                  style: context.headlineMedium.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(height: context.spaceMd),

                // NEW PASSWORD
                Text(
                  'New Password',
                  style: context.bodyLarge.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: context.spaceMd),

                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.visiblePassword,
                  autofillHints: const [AutofillHints.newPassword],
                  validator: MyValidator.validatePassword,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: context.paddingHorizontalMd,
                      child: Icon(
                        Iconsax.lock,
                        color: MyColors.textSecondary(context),
                      ),
                    ),
                    hintText: 'Enter new password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      icon: Icon(
                        _obscurePassword ? Iconsax.eye : Iconsax.eye_slash,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: context.spaceLg),

                // CONFIRM PASSWORD
                Text(
                  'Confirm Password',
                  style: context.bodyLarge.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: context.spaceMd),

                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: _obscureConfirmPassword,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  autofillHints: const [AutofillHints.newPassword],
                  validator: (value) {
                    return MyValidator.validateConfirmPassword(
                      _passwordController.text,
                      value,
                    );
                  },
                  onFieldSubmitted: (_) => _resetPassword(),
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: context.paddingHorizontalMd,
                      child: Icon(
                        Iconsax.lock_1,
                        color: MyColors.textSecondary(context),
                      ),
                    ),
                    hintText: 'Confirm new password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      },
                      icon: Icon(
                        _obscureConfirmPassword
                            ? Iconsax.eye
                            : Iconsax.eye_slash,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: context.spaceMd),
                // RESET BUTTON
                SizedBox(
                  width: double.infinity,
                  height: context.buttonHeightLg,
                  child: MyButtons.accent(
                    onPressed: _isResetting ? null : _resetPassword,
                    child: _isResetting
                        ? SizedBox(
                            width: context.iconSm,
                            height: context.iconSm,
                            child: const CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text('Reset password'),
                  ),
                ),

                SizedBox(height: context.spaceLg),

                // BACK TO LOGIN
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    onPressed: () {
                      context.go(AppRoutes.login);
                    },
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: MyColors.primary(context),
                    ),
                    label: Text(
                      'Back to login',
                      style: context.bodyMedium.copyWith(
                        color: MyColors.primary(context),
                        fontWeight: FontWeight.w600,
                      ),
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

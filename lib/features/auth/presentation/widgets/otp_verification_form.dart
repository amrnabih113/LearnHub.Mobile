import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';

import 'package:iconsax/iconsax.dart';
import '../../../../core/adaptive/adaptive_content.dart';
import '../../../../core/adaptive/adaptive_value.dart';
import '../../../../core/extensions/my_sizes_extensions.dart';
import '../../../../core/extensions/text_theme_extension.dart';
import '../../../../core/ui/my_buttons.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_images.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationForm extends StatefulWidget {
  const OtpVerificationForm({super.key, this.email});

  final String? email;

  @override
  State<OtpVerificationForm> createState() => _OtpVerificationFormState();
}

class _OtpVerificationFormState extends State<OtpVerificationForm> {
  // CONTROLLERS

  final TextEditingController _pinController = TextEditingController();

  final FocusNode _pinFocusNode = FocusNode();

  // STATE

  static const int _otpLength = 6;
  static const int _resendDuration = 60;

  Timer? _timer;

  int _remainingSeconds = _resendDuration;

  bool _isVerifying = false;
  bool _isResending = false;

  String _otp = '';

  // LIFECYCLE

  @override
  void initState() {
    super.initState();

    _startTimer();

    // Automatically focus OTP when the screen opens.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _pinFocusNode.requestFocus();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pinController.dispose();
    _pinFocusNode.dispose();

    super.dispose();
  }

  // TIMER

  void _startTimer() {
    _timer?.cancel();

    setState(() {
      _remainingSeconds = _resendDuration;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds <= 1) {
        timer.cancel();

        if (mounted) {
          setState(() {
            _remainingSeconds = 0;
          });
        }

        return;
      }

      if (mounted) {
        setState(() {
          _remainingSeconds--;
        });
      }
    });
  }

  // OTP

  void _onOtpChanged(String value) {
    setState(() {
      _otp = value;
    });
  }

  Future<void> _verifyOtp(String pin) async {
    if (pin.length != _otpLength || _isVerifying) {
      return;
    }

    setState(() {
      _isVerifying = true;
    });

    try {
      // ======================================================================
      // TODO: CONNECT YOUR AUTH LOGIC
      // ======================================================================
      //
      // Example:
      //
      // await controller.verifyPasswordResetOtp(
      //   email: widget.email!,
      //   otp: pin,
      // );

      await Future<void>.delayed(const Duration(milliseconds: 700));

      if (!mounted) return;

      context.go(AppRoutes.resetPassword);
      // Navigate to reset password after successful verification.
      //
      // Get.toNamed(
      //   AppRoutes.resetPassword,
      //   arguments: {
      //     'email': widget.email,
      //     'otp': pin,
      //   },
      // );
    } finally {
      if (mounted) {
        setState(() {
          _isVerifying = false;
        });
      }
    }
  }

  // RESEND OTP

  Future<void> _resendOtp() async {
    if (_remainingSeconds > 0 || _isResending) {
      return;
    }

    setState(() {
      _isResending = true;
    });

    try {
      // ======================================================================
      // TODO: CONNECT YOUR AUTH LOGIC
      // ======================================================================
      //
      // await controller.resendPasswordResetOtp(
      //   email: widget.email!,
      // );

      await Future<void>.delayed(const Duration(milliseconds: 700));

      if (!mounted) return;

      _pinController.clear();

      setState(() {
        _otp = '';
      });

      _startTimer();

      _pinFocusNode.requestFocus();
    } finally {
      if (mounted) {
        setState(() {
          _isResending = false;
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
                  child: Image.asset(MyImages.otpImage, fit: BoxFit.contain),
                ),

                SizedBox(height: context.spaceXl),

                // TITLE
                Text(
                  'Verify your email',
                  style: context.headlineMedium.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(height: context.spaceMd),

                // DESCRIPTION
                Text(
                  widget.email == null
                      ? 'Enter the 6-digit code we sent to your email address.'
                      : 'Enter the 6-digit code we sent to ${widget.email}.',
                  style: context.bodyLarge.copyWith(
                    color: MyColors.textSecondary(context),
                    height: 1.5,
                  ),
                ),

                SizedBox(height: context.spaceXl),

                // OTP INPUT
                _OtpInput(
                  controller: _pinController,
                  focusNode: _pinFocusNode,
                  onChanged: _onOtpChanged,
                  onCompleted: _verifyOtp,
                ),

                SizedBox(height: context.spaceMd),

                // VERIFYING STATE
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: _isVerifying
                      ? Row(
                          key: const ValueKey('verifying'),
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: context.iconXs,
                              height: context.iconXs,
                              child: const CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            ),
                            SizedBox(width: context.spaceSm),
                            Text(
                              'Verifying code...',
                              style: context.bodySmall.copyWith(
                                color: MyColors.textSecondary(context),
                              ),
                            ),
                          ],
                        )
                      : const SizedBox(key: ValueKey('empty')),
                ),

                SizedBox(height: context.spaceLg),

                // RESEND
                Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: _remainingSeconds > 0
                        ? Text.rich(
                            TextSpan(
                              text: 'You can resend the code in ',
                              style: context.bodyMedium.copyWith(
                                color: MyColors.textSecondary(context),
                              ),
                              children: [
                                TextSpan(
                                  text: _formatTime(_remainingSeconds),
                                  style: context.bodyMedium.copyWith(
                                    color: MyColors.primary(context),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : TextButton.icon(
                            key: const ValueKey('resend'),
                            onPressed: _isResending ? null : _resendOtp,
                            icon: _isResending
                                ? SizedBox(
                                    width: context.iconSm,
                                    height: context.iconSm,
                                    child: const CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Icon(
                                    Iconsax.refresh,
                                    size: context.iconSm,
                                    color: MyColors.primary(context),
                                  ),
                            label: Text(
                              'Resend code',
                              style: context.bodyMedium.copyWith(
                                color: MyColors.primary(context),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                  ),
                ),

                SizedBox(height: context.spaceXl),

                // VERIFY BUTTON
                SizedBox(
                  width: double.infinity,
                  height: context.buttonHeightLg,
                  child: MyButtons.accent(
                    onPressed: _otp.length == _otpLength && !_isVerifying
                        ? () => _verifyOtp(_otp)
                        : null,
                    child: _isVerifying
                        ? SizedBox(
                            width: context.iconSm,
                            height: context.iconSm,
                            child: const CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text('Verify code'),
                  ),
                ),

                SizedBox(height: context.spaceXl),

                // DIVIDER
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1.5,
                        color: MyColors.border(context),
                      ),
                    ),
                    SizedBox(width: context.spaceMd),
                    Text(
                      'OR',
                      style: context.bodySmall.copyWith(
                        color: MyColors.textSecondary(context),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: context.spaceMd),
                    Expanded(
                      child: Divider(
                        thickness: 1.5,
                        color: MyColors.border(context),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: context.spaceLg),

                // BACK TO LOGIN
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
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

  // FORMAT TIMER

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;

    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}

// =============================================================================
// OTP INPUT
// =============================================================================

class _OtpInput extends StatelessWidget {
  const _OtpInput({
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    required this.onCompleted,
  });

  final TextEditingController controller;
  final FocusNode focusNode;

  final ValueChanged<String> onChanged;
  final ValueChanged<String> onCompleted;

  @override
  Widget build(BuildContext context) {
    // =========================================================================
    // DEFAULT
    // =========================================================================

    final defaultPinTheme = PinTheme(
      width: context.adaptiveValue(compact: 46, medium: 52, expanded: 56),
      height: context.adaptiveValue(compact: 52, medium: 58, expanded: 60),
      textStyle: context.titleLarge.copyWith(
        fontWeight: FontWeight.w700,
        color: MyColors.primary(context),
      ),
      decoration: BoxDecoration(
        color: MyColors.surface(context),
        borderRadius: BorderRadius.circular(context.radiusMd),
        border: Border.all(color: MyColors.border(context), width: 1.5),
      ),
    );

    // =========================================================================
    // FOCUSED
    // =========================================================================

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: MyColors.primary(context), width: 2),
      boxShadow: [
        BoxShadow(
          color: MyColors.primary(context).withValues(alpha: 0.10),
          blurRadius: 8,
          spreadRadius: 1,
        ),
      ],
    );

    // =========================================================================
    // SUBMITTED
    // =========================================================================

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: MyColors.primary(context).withValues(alpha: 0.06),
        border: Border.all(color: MyColors.primary(context), width: 1.5),
      ),
    );

    // =========================================================================
    // ERROR
    // =========================================================================

    final errorPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: MyColors.error, width: 1.5),
    );

    return Pinput(
      length: 6,

      // Controller
      controller: controller,

      // Focus
      focusNode: focusNode,

      // Theme
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      errorPinTheme: errorPinTheme,

      // Cursor
      showCursor: true,
      cursor: Container(width: 2, height: 24, color: MyColors.primary(context)),

      // Keyboard
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,

      // Autofill
      autofillHints: const [AutofillHints.oneTimeCode],

      // Behavior
      closeKeyboardWhenCompleted: true,
      pinAnimationType: PinAnimationType.scale,

      // Callbacks
      onChanged: onChanged,
      onCompleted: onCompleted,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/extensions/localization.dart';
import '../../../core/theme/theme.dart';
import '../../../core/widgets/betopia_logo.dart';
import '../../../core/widgets/google_icon.dart';

/// Right-side authentication / Welcome Back card for Betopia AI.
class BetopiaAuthCard extends StatefulWidget {
  const BetopiaAuthCard({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.onSignIn,
    this.onSignUp,
    this.onForgotPassword,
    this.onGoogleSignIn,
    this.onSsoSignIn,
    this.isLoading = false,
    this.showLogo = false,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onSignIn;
  final VoidCallback? onSignUp;
  final VoidCallback? onForgotPassword;
  final VoidCallback? onGoogleSignIn;
  final VoidCallback? onSsoSignIn;
  final bool isLoading;
  final bool showLogo;

  @override
  State<BetopiaAuthCard> createState() => _BetopiaAuthCardState();
}

class _BetopiaAuthCardState extends State<BetopiaAuthCard> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final colors = context.color;
    final locale = context.locale;

    return Container(
      color: colors.background.canvas,
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 28),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 440),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.showLogo) ...[
                  const Center(
                    child: BetopiaLogo(fontSize: 24, iconSize: 30),
                  ),
                  const Gap(28),
                ],
                // Title
                Text(
                  locale.welcomeBack,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: colors.text.defaultValue,
                    letterSpacing: -0.8,
                  ),
                ),
                const Gap(8),
                // Subtitle
                Text(
                  locale.welcomeBackSubtitle,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.45,
                    color: colors.text.muted,
                  ),
                ),
                const Gap(28),

                // Social Sign-in Buttons
                _SocialAuthButton(
                  icon: const GoogleIcon(size: 18),
                  label: locale.signInWithGoogle,
                  onTap: widget.onGoogleSignIn ?? () {},
                ),
                const Gap(12),
                _SocialAuthButton(
                  icon: const _SsoIcon(),
                  label: locale.logInWithSso,
                  onTap: widget.onSsoSignIn ?? () {},
                ),
                const Gap(24),

                // Divider
                _AuthDivider(label: locale.orSignInWithEmail),
                const Gap(24),

                // Work Email Field
                Text(
                  locale.workEmail,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.8,
                    color: colors.text.muted,
                  ),
                ),
                const Gap(8),
                _AuthTextField(
                  controller: widget.emailController,
                  hintText: locale.workEmailHint,
                  prefixIcon: Icon(
                    Icons.alternate_email_rounded,
                    size: 18,
                    color: colors.text.muted,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const Gap(20),

                // Password Field
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      locale.passwordLabel,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.8,
                        color: colors.text.muted,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.onForgotPassword,
                      child: Text(
                        locale.forgotPassword,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: colors.primary.defaultValue,
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(8),
                _AuthTextField(
                  controller: widget.passwordController,
                  hintText: locale.passwordHint,
                  obscureText: _obscurePassword,
                  prefixIcon: Icon(
                    Icons.lock_outline_rounded,
                    size: 18,
                    color: colors.text.muted,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() => _obscurePassword = !_obscurePassword);
                    },
                    child: Icon(
                      _obscurePassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: 18,
                      color: colors.text.muted,
                    ),
                  ),
                ),
                const Gap(24),

                // Primary Sign In Button
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: widget.isLoading ? null : widget.onSignIn,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors.primary.defaultValue,
                      foregroundColor: colors.text.defaultValue,
                      disabledBackgroundColor:
                          colors.primary.defaultValue.withValues(alpha: 0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),
                    child: widget.isLoading
                        ? SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                colors.text.defaultValue,
                              ),
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                locale.signIn,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: colors.text.defaultValue,
                                ),
                              ),
                              const Gap(8),
                              Icon(
                                Icons.arrow_forward_rounded,
                                size: 18,
                                color: colors.text.defaultValue,
                              ),
                            ],
                          ),
                  ),
                ),
                const Gap(20),

                // Bottom Sign Up Link
                Center(
                  child: GestureDetector(
                    onTap: widget.onSignUp,
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 13,
                          color: colors.text.muted,
                        ),
                        children: [
                          TextSpan(text: locale.dontHaveAccount),
                          TextSpan(
                            text: locale.signUpFree,
                            style: TextStyle(
                              color: colors.primary.defaultValue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
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

class _SocialAuthButton extends StatelessWidget {
  const _SocialAuthButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final Widget icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.color;

    return SizedBox(
      width: double.infinity,
      height: 46,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          backgroundColor: colors.background.surface,
          side: BorderSide(color: colors.border.defaultValue, width: 1.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const Gap(12),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: colors.text.defaultValue,
                letterSpacing: -0.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AuthTextField extends StatelessWidget {
  const _AuthTextField({
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
  });

  final TextEditingController controller;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    final colors = context.color;

    return Container(
      decoration: BoxDecoration(
        color: colors.background.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colors.border.defaultValue, width: 1.0),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: TextStyle(
          fontSize: 14,
          color: colors.text.defaultValue,
        ),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 14,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: colors.text.muted.withValues(alpha: 0.6),
          ),
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 14, right: 10),
                  child: prefixIcon,
                )
              : null,
          prefixIconConstraints: const BoxConstraints(
            minWidth: 42,
            minHeight: 20,
          ),
          suffixIcon: suffixIcon != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: suffixIcon,
                )
              : null,
          suffixIconConstraints: const BoxConstraints(
            minWidth: 42,
            minHeight: 20,
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}

class _AuthDivider extends StatelessWidget {
  const _AuthDivider({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = context.color;

    return Row(
      children: [
        Expanded(
          child: Divider(
            color: colors.border.defaultValue,
            thickness: 0.9,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.6,
              color: colors.text.muted,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: colors.border.defaultValue,
            thickness: 0.9,
          ),
        ),
      ],
    );
  }
}

class _SsoIcon extends StatelessWidget {
  const _SsoIcon();

  @override
  Widget build(BuildContext context) {
    final colors = context.color;

    return Container(
      width: 18,
      height: 18,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: colors.border.defaultValue,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        'b',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w800,
          color: colors.text.defaultValue,
          height: 1.0,
        ),
      ),
    );
  }
}


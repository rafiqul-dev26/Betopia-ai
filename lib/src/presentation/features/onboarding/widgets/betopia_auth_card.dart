import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
    return Container(
      color: const Color(0xFF0C0D11),
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
                const Text(
                  'Welcome back',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: -0.8,
                  ),
                ),
                const Gap(8),
                // Subtitle
                const Text(
                  'Sign in to pick up your conversations, '
                  'right where you left off.',
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.45,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
                const Gap(28),

                // Social Sign-in Buttons
                _SocialAuthButton(
                  icon: const GoogleIcon(size: 18),
                  label: 'Sign in with Google',
                  onTap: widget.onGoogleSignIn ?? () {},
                ),
                const Gap(12),
                _SocialAuthButton(
                  icon: const _SsoIcon(),
                  label: 'Log in with Betopia SSO',
                  onTap: widget.onSsoSignIn ?? () {},
                ),
                const Gap(24),

                // Divider
                const _AuthDivider(label: 'OR SIGN IN WITH EMAIL'),
                const Gap(24),

                // Work Email Field
                const Text(
                  'WORK EMAIL',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.8,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
                const Gap(8),
                _AuthTextField(
                  controller: widget.emailController,
                  hintText: 'name@enterprise.com',
                  prefixIcon: const Icon(
                    Icons.alternate_email_rounded,
                    size: 18,
                    color: Color(0xFF6B7280),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const Gap(20),

                // Password Field
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'PASSWORD',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.8,
                        color: Color(0xFF9CA3AF),
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.onForgotPassword,
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFF640A),
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(8),
                _AuthTextField(
                  controller: widget.passwordController,
                  hintText: '••••••••',
                  obscureText: _obscurePassword,
                  prefixIcon: const Icon(
                    Icons.lock_outline_rounded,
                    size: 18,
                    color: Color(0xFF6B7280),
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
                      color: const Color(0xFF6B7280),
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
                      backgroundColor: const Color(0xFFFF640A),
                      foregroundColor: Colors.white,
                      disabledBackgroundColor:
                          const Color(0xFFFF640A).withValues(alpha: 0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),
                    child: widget.isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Sign In',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              Gap(8),
                              Icon(
                                Icons.arrow_forward_rounded,
                                size: 18,
                                color: Colors.white,
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
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF9CA3AF),
                        ),
                        children: [
                          TextSpan(text: "Don't have an account? "),
                          TextSpan(
                            text: 'Sign up free',
                            style: TextStyle(
                              color: Color(0xFFFF640A),
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
    return SizedBox(
      width: double.infinity,
      height: 46,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0xFF16181F),
          side: const BorderSide(color: Color(0xFF262833), width: 1.0),
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
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFFE5E7EB),
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
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF16181F),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF262833), width: 1.0),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 14,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 14,
            color: Color(0xFF4B5563),
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
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Color(0xFF242731),
            thickness: 0.9,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.6,
              color: Color(0xFF6B7280),
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            color: Color(0xFF242731),
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
    return Container(
      width: 18,
      height: 18,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFF242731),
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Text(
        'b',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w800,
          color: Colors.white,
          height: 1.0,
        ),
      ),
    );
  }
}

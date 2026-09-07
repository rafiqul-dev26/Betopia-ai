import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/go_router_extension.dart';
import '../../../../../core/extensions/validation.dart';
import '../../../../../core/utiliity/validation/validation.dart';
import '../../../../core/router/routes.dart';
import '../../../../core/widgets/betopia_logo.dart';
import '../../../../core/widgets/google_icon.dart';

/// Betopia AI Create Account / Sign Up Screen matching the reference design.
class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onCreateAccount() {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    // Simulate account creation & navigate to login or home
    Future.delayed(const Duration(milliseconds: 600), () {
      if (!mounted) return;
      setState(() => _isLoading = false);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color(0xFFFF640A),
          content: Text(
            'Account created successfully! Please sign in.',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
      context.pushNamedAndRemoveUntil(Routes.login.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C0D11),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Brand Logo with BETA tag
                  const BetopiaLogo(fontSize: 22, iconSize: 28),
                  const Gap(20),

                  // Main Heading
                  const Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: -0.8,
                    ),
                  ),
                  const Gap(8),

                  // Subtitle
                  const Text(
                    'Join Betopia to access the ethereal command',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF9CA3AF),
                      letterSpacing: -0.1,
                    ),
                  ),
                  const Gap(28),

                  // Elevated Registration Card Container
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 28,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF15171D),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0xFF242732),
                        width: 1.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.35),
                          blurRadius: 24,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Sign up with Google Button
                          SizedBox(
                            width: double.infinity,
                            height: 46,
                            child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                backgroundColor: const Color(0xFF1B1D25),
                                side: const BorderSide(
                                  color: Color(0xFF2A2D38),
                                  width: 1.0,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GoogleIcon(size: 18),
                                  Gap(12),
                                  Text(
                                    'Sign up with Google',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFFE5E7EB),
                                      letterSpacing: -0.1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Gap(22),

                          // Divider
                          const _RegisterDivider(
                            label: 'OR REGISTER WITH EMAIL',
                          ),
                          const Gap(22),

                          // Full Name Field
                          const _FieldLabel(label: 'FULL NAME'),
                          const Gap(8),
                          _SignUpTextField(
                            controller: _fullNameController,
                            hintText: 'Jane Smith',
                            validator: context.validator.apply([
                              RequiredValidation(),
                            ]),
                          ),
                          const Gap(18),

                          // Work Email Field
                          const _FieldLabel(label: 'WORK EMAIL'),
                          const Gap(8),
                          _SignUpTextField(
                            controller: _emailController,
                            hintText: 'name@company.com',
                            keyboardType: TextInputType.emailAddress,
                            validator: context.validator.apply([
                              RequiredValidation(),
                              EmailValidation(),
                            ]),
                          ),
                          const Gap(18),

                          // Password Field
                          const _FieldLabel(label: 'PASSWORD'),
                          const Gap(8),
                          _SignUpTextField(
                            controller: _passwordController,
                            hintText: 'Min. 8 characters',
                            obscureText: _isPasswordObscured,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isPasswordObscured = !_isPasswordObscured;
                                });
                              },
                              child: Icon(
                                _isPasswordObscured
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                size: 18,
                                color: const Color(0xFF6B7280),
                              ),
                            ),
                            validator: context.validator.apply([
                              RequiredValidation(),
                              PasswordValidation(minLength: 8),
                            ]),
                          ),
                          const Gap(18),

                          // Confirm Password Field
                          const _FieldLabel(label: 'CONFIRM PASSWORD'),
                          const Gap(8),
                          _SignUpTextField(
                            controller: _confirmPasswordController,
                            hintText: '••••••••',
                            obscureText: _isConfirmPasswordObscured,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isConfirmPasswordObscured =
                                      !_isConfirmPasswordObscured;
                                });
                              },
                              child: Icon(
                                _isConfirmPasswordObscured
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                size: 18,
                                color: const Color(0xFF6B7280),
                              ),
                            ),
                            validator: context.validator.apply([
                              RequiredValidation(),
                              ConfirmPasswordValidation(
                                password: () => _passwordController.text,
                              ),
                            ]),
                          ),
                          const Gap(24),

                          // Primary Create Account Button
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: _isLoading ? null : _onCreateAccount,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFF640A),
                                foregroundColor: Colors.white,
                                disabledBackgroundColor: const Color(0xFFFF640A)
                                    .withValues(alpha: 0.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 0,
                              ),
                              child: _isLoading
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Colors.white,
                                        ),
                                      ),
                                    )
                                  : const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Create Account',
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

                          // Sign In Link
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                if (context.canPop()) {
                                  context.pop();
                                } else {
                                  context.pushNamedAndRemoveUntil(
                                    Routes.login.name,
                                  );
                                }
                              },
                              child: RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF9CA3AF),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Already have an account? ',
                                    ),
                                    TextSpan(
                                      text: 'Sign In',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.8,
        color: Color(0xFF8E95A5),
      ),
    );
  }
}

class _SignUpTextField extends StatelessWidget {
  const _SignUpTextField({
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType,
    this.validator,
  });

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: const TextStyle(
        fontSize: 14,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: const Color(0xFF121318),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
          color: Color(0xFF4B5563),
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF242732), width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF242732), width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFFF640A), width: 1.2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFE03131), width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFE03131), width: 1.2),
        ),
      ),
    );
  }
}

class _RegisterDivider extends StatelessWidget {
  const _RegisterDivider({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Color(0xFF242732),
            thickness: 0.9,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
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
            color: Color(0xFF242732),
            thickness: 0.9,
          ),
        ),
      ],
    );
  }
}

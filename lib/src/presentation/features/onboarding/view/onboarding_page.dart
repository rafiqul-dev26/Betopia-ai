import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/base/result.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/extensions/localization.dart';
import '../../../../domain/failures/business_failure.dart';
import '../../../core/application_state/onboarding_status_provider/onboarding_status_provider.dart';
import '../../../core/application_state/session_status_provider/session_status_provider.dart';
import '../../../core/failure/business_failure_ui_mapper.dart';
import '../../../core/router/routes.dart';
import '../../authentication/login/riverpod/login_provider.dart';
import '../widgets/betopia_auth_card.dart';
import '../widgets/betopia_hero_view.dart';

/// Betopia AI Onboarding & Sign-in Screen matching the luxury dark reference
/// UI.
class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _pageController = PageController();
  int _mobilePageIndex = 0;

  @override
  void initState() {
    super.initState();

    ref.listenManual(loginProvider, (previous, next) {
      switch (next) {
        case AsyncData(value: Success()):
          _completeOnboarding();
        case AsyncError(error: final BusinessFailure failure):
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: const Color(0xFFE03131),
              content: Text(
                BusinessFailureUIMapper.map(failure, context.locale).message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        case AsyncError():
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: const Color(0xFFE03131),
              content: Text(
                BusinessFailureUIMapper.unexpected(context.locale).message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        default:
      }
    });
  }

  void _completeOnboarding() {
    ref.read(markOnboardingCompletedUseCaseProvider).call();
    ref.invalidate(onboardingStatusProvider);
    ref.invalidate(sessionStatusProvider);
    if (context.mounted) {
      context.go(Routes.home.path);
    }
  }

  void _onSignIn() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color(0xFF262833),
          content: Text(
            'Please enter both work email and password',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
      return;
    }

    ref.read(loginProvider.notifier).login(
          email: email,
          password: password,
          shouldRemember: true,
        );
  }

  void _onSignUp() {
    context.pushNamed(Routes.registration.name);
  }

  void _onForgotPassword() {
    context.pushNamed(Routes.resetPassword.name);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginProvider);
    final isWideScreen = MediaQuery.of(context).size.width >= 850;

    return Scaffold(
      backgroundColor: const Color(0xFF0C0D11),
      body: isWideScreen
          // Desktop / Tablet Side-by-Side Dual Column Layout
          ? Row(
              children: [
                // Left Hero Showcase
                Expanded(
                  flex: 5,
                  child: BetopiaHeroView(
                    onGetStarted: () {},
                  ),
                ),
                // Subtle vertical divider line
                Container(
                  width: 1,
                  color: const Color(0xFF1F212B),
                ),
                // Right Welcome Back Card
                Expanded(
                  flex: 5,
                  child: BetopiaAuthCard(
                    emailController: _emailController,
                    passwordController: _passwordController,
                    isLoading: loginState.isLoading,
                    onSignIn: _onSignIn,
                    onSignUp: _onSignUp,
                    onForgotPassword: _onForgotPassword,
                  ),
                ),
              ],
            )
          // Mobile Smooth Multi-Page Layout
          : Stack(
              children: [
                PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() => _mobilePageIndex = index);
                  },
                  children: [
                    // Page 1: Hero Showcase
                    BetopiaHeroView(
                      showMobileActions: true,
                      onGetStarted: () {
                        _pageController.animateToPage(
                          1,
                          duration: const Duration(milliseconds: 350),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                    // Page 2: Welcome Back Form
                    SafeArea(
                      child: Stack(
                        children: [
                          BetopiaAuthCard(
                            showLogo: true,
                            emailController: _emailController,
                            passwordController: _passwordController,
                            isLoading: loginState.isLoading,
                            onSignIn: _onSignIn,
                            onSignUp: _onSignUp,
                            onForgotPassword: _onForgotPassword,
                          ),
                          Positioned(
                            top: 12,
                            left: 16,
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: Color(0xFF9CA3AF),
                                size: 20,
                              ),
                              onPressed: () {
                                _pageController.animateToPage(
                                  0,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Mobile Page indicator dots
                if (_mobilePageIndex == 0)
                  Positioned(
                    top: 28,
                    right: 24,
                    child: TextButton(
                      onPressed: () {
                        _pageController.animateToPage(
                          1,
                          duration: const Duration(milliseconds: 350),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Color(0xFFFF640A),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
    );
  }
}

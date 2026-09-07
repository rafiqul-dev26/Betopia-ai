import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/base/result.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/extensions/localization.dart';
import '../../../../../domain/failures/business_failure.dart';
import '../../../../core/application_state/onboarding_status_provider/onboarding_status_provider.dart';
import '../../../../core/application_state/session_status_provider/session_status_provider.dart';
import '../../../../core/failure/business_failure_ui_mapper.dart';
import '../../../../core/router/routes.dart';
import '../../../onboarding/widgets/betopia_auth_card.dart';
import '../../../onboarding/widgets/betopia_hero_view.dart';
import '../riverpod/login_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    ref.listenManual(loginProvider, (previous, next) {
      switch (next) {
        case AsyncData(value: Success()):
          // Mark onboarding completed & update session state
          ref.read(markOnboardingCompletedUseCaseProvider).call();
          ref.invalidate(onboardingStatusProvider);
          ref.invalidate(sessionStatusProvider);

          // Proactively navigate to the dashboard
          if (context.mounted) {
            context.go(Routes.home.path);
          }
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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
  Widget build(BuildContext context) {
    final state = ref.watch(loginProvider);
    final isWideScreen = MediaQuery.of(context).size.width >= 850;

    return Scaffold(
      backgroundColor: const Color(0xFF0C0D11),
      body: isWideScreen
          ? Row(
              children: [
                const Expanded(
                  flex: 5,
                  child: BetopiaHeroView(),
                ),
                Container(
                  width: 1,
                  color: const Color(0xFF1F212B),
                ),
                Expanded(
                  flex: 5,
                  child: BetopiaAuthCard(
                    emailController: _emailController,
                    passwordController: _passwordController,
                    isLoading: state.isLoading,
                    onSignIn: _onSignIn,
                    onSignUp: _onSignUp,
                    onForgotPassword: _onForgotPassword,
                  ),
                ),
              ],
            )
          : SafeArea(
              child: BetopiaAuthCard(
                showLogo: true,
                emailController: _emailController,
                passwordController: _passwordController,
                isLoading: state.isLoading,
                onSignIn: _onSignIn,
                onSignUp: _onSignUp,
                onForgotPassword: _onForgotPassword,
              ),
            ),
    );
  }
}

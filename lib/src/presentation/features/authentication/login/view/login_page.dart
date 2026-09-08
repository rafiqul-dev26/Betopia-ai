import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/base/result.dart';
import '../../../../../core/extensions/localization.dart';
import '../../../../../domain/failures/business_failure.dart';
import '../../../../core/failure/business_failure_ui_mapper.dart';
import '../../../../core/router/routes.dart';
import '../../../../core/theme/theme.dart';
import '../../../onboarding/widgets/betopia_auth_card.dart';
import '../../../onboarding/widgets/betopia_hero_view.dart';
import '../riverpod/login_provider.dart';

import '../../biometrics/riverpod/biometrics_provider.dart';
import '../../sso/widgets/sso_provider_dialog.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _canCheckBiometrics = false;

  @override
  void initState() {
    super.initState();
    _checkBiometrics();

    ref.listenManual(loginProvider, (previous, next) {
      switch (next) {
        case AsyncData(value: Success()):
          // Proactively navigate to the dashboard
          if (context.mounted) {
            context.go(Routes.home.path);
          }
        case AsyncError(error: final BusinessFailure failure):
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: context.color.status.danger,
              content: Text(
                BusinessFailureUIMapper.map(failure, context.locale).message,
                style: TextStyle(color: context.color.text.defaultValue),
              ),
            ),
          );
        case AsyncError():
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: context.color.status.danger,
              content: Text(
                BusinessFailureUIMapper.unexpected(context.locale).message,
                style: TextStyle(color: context.color.text.defaultValue),
              ),
            ),
          );
        default:
      }
    });
  }

  Future<void> _checkBiometrics() async {
    final available =
        await ref.read(biometricsProvider.notifier).checkAvailability();
    if (mounted) {
      setState(() => _canCheckBiometrics = available);
    }
  }

  Future<void> _onBiometricSignIn() async {
    final success = await ref
        .read(biometricsProvider.notifier)
        .authenticateAndLogin(
          localizedReason: context.locale.biometricPromptReason,
        );

    if (success && mounted) {
      context.go(Routes.home.path);
    }
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
        SnackBar(
          backgroundColor: context.color.background.surface,
          content: Text(
            context.locale.enterWorkEmailAndPassword,
            style: TextStyle(color: context.color.text.defaultValue),
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

  void _onSsoSignIn() {
    SsoProviderDialog.show(context);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginProvider);
    final isWideScreen = MediaQuery.of(context).size.width >= 850;
    final colors = context.color;

    return Scaffold(
      backgroundColor: colors.background.canvas,
      body: isWideScreen
          ? Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: BetopiaHeroView(),
                ),
                Container(
                  width: 1,
                  color: colors.border.subtle,
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
                    onSsoSignIn: _onSsoSignIn,
                    onBiometricSignIn:
                        _canCheckBiometrics ? _onBiometricSignIn : null,
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
                onSsoSignIn: _onSsoSignIn,
                onBiometricSignIn:
                    _canCheckBiometrics ? _onBiometricSignIn : null,
              ),
            ),
    );
  }
}


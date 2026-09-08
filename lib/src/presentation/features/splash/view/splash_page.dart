import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/theme.dart';
import '../../../core/widgets/betopia_logo.dart';
import '../../../core/widgets/orbital_background.dart';

/// Betopia AI Splash screen shown during bootstrap & startup initialization.
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.color;

    return Scaffold(
      backgroundColor: colors.background.canvas,
      body: OrbitalBackground(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const BetopiaLogo(fontSize: 28, iconSize: 36),
              const Gap(28),
              SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    colors.primary.defaultValue,
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


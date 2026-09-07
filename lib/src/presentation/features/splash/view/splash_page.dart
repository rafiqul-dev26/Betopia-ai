import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/widgets/betopia_logo.dart';
import '../../../core/widgets/orbital_background.dart';

/// Betopia AI Splash screen shown during bootstrap & startup initialization.
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF0C0D11),
      body: OrbitalBackground(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BetopiaLogo(fontSize: 28, iconSize: 36),
              Gap(28),
              SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.2,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF640A)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

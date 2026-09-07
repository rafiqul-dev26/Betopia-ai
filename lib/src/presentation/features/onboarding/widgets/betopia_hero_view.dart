import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/widgets/betopia_logo.dart';
import '../../../core/widgets/orbital_background.dart';

/// Left hero showcase for Betopia AI onboarding with overflow protection.
class BetopiaHeroView extends StatelessWidget {
  const BetopiaHeroView({
    super.key,
    this.onGetStarted,
    this.showMobileActions = false,
  });

  final VoidCallback? onGetStarted;
  final bool showMobileActions;

  @override
  Widget build(BuildContext context) {
    return OrbitalBackground(
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: (constraints.maxHeight - 48).clamp(
                    0.0,
                    double.infinity,
                  ),
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Top Brand Logo & Beta badge
                      const BetopiaLogo(fontSize: 24, iconSize: 30),
                      const Gap(24),

                      // Center Hero Content
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const _HeroHeadline(),
                          const Gap(16),

                          // Subtitle
                          const Text(
                            'Reasoning, code, documents, images, and voice — '
                            'routed to the right engine, automatically.',
                            style: TextStyle(
                              fontSize: 15,
                              height: 1.5,
                              color: Color(0xFF9CA3AF),
                              letterSpacing: -0.1,
                            ),
                          ),
                          const Gap(24),

                          // 3 Feature Badges
                          const _FeatureBadge(
                            icon: Icons.auto_awesome_rounded,
                            iconColor: Color(0xFFFFA048),
                            text: '10+ frontier AI models, one chat',
                          ),
                          const Gap(10),
                          const _FeatureBadge(
                            icon: Icons.bolt_rounded,
                            iconColor: Color(0xFFFF640A),
                            text: 'Real-time streaming responses',
                          ),
                          const Gap(10),
                          const _FeatureBadge(
                            icon: Icons.shield_outlined,
                            iconColor: Color(0xFFF59E0B),
                            text: 'Enterprise-grade security',
                          ),

                          if (showMobileActions) ...[
                            const Gap(28),
                            SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: ElevatedButton(
                                onPressed: onGetStarted,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFFF640A),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 0,
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Get Started',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Gap(8),
                                    Icon(
                                      Icons.arrow_forward_rounded,
                                      size: 18,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      const Gap(24),

                      // Footer copyright & links
                      const Text(
                        '© 2026 Betopia AI · Terms · Privacy',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF6B7280),
                          letterSpacing: 0.1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _HeroHeadline extends StatelessWidget {
  const _HeroHeadline();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ask anything,',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            height: 1.15,
            letterSpacing: -1.0,
          ),
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            // Gradient "answered"
            ShaderMask(
              shaderCallback: (bounds) {
                return const LinearGradient(
                  colors: [
                    Color(0xFFFF7A1A),
                    Color(0xFFFF9548),
                    Color(0xFFC084FC),
                  ],
                  stops: [0.0, 0.45, 1.0],
                ).createShader(bounds);
              },
              child: const Text(
                'answered',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  height: 1.15,
                  letterSpacing: -1.0,
                ),
              ),
            ),
            const Text(
              ' faster.',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                height: 1.15,
                letterSpacing: -1.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _FeatureBadge extends StatelessWidget {
  const _FeatureBadge({
    required this.icon,
    required this.iconColor,
    required this.text,
  });

  final IconData icon;
  final Color iconColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      decoration: BoxDecoration(
        color: const Color(0xFF161820).withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFF262833),
          width: 0.9,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: iconColor),
          const Gap(10),
          Flexible(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xFFE5E7EB),
                letterSpacing: -0.1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

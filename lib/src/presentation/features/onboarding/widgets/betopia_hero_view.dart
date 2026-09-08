import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/extensions/localization.dart';
import '../../../core/theme/theme.dart';
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
    final colors = context.color;
    final locale = context.locale;

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
                          Text(
                            locale.heroSubtitle,
                            style: TextStyle(
                              fontSize: 15,
                              height: 1.5,
                              color: colors.text.muted,
                              letterSpacing: -0.1,
                            ),
                          ),
                          const Gap(24),

                          // 3 Feature Badges
                          _FeatureBadge(
                            icon: Icons.auto_awesome_rounded,
                            iconColor: colors.accent.gold,
                            text: locale.featureFrontierModels,
                          ),
                          const Gap(10),
                          _FeatureBadge(
                            icon: Icons.bolt_rounded,
                            iconColor: colors.primary.defaultValue,
                            text: locale.featureStreaming,
                          ),
                          const Gap(10),
                          _FeatureBadge(
                            icon: Icons.shield_outlined,
                            iconColor: colors.accent.gold,
                            text: locale.featureEnterpriseSecurity,
                          ),

                          if (showMobileActions) ...[
                            const Gap(28),
                            SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: ElevatedButton(
                                onPressed: onGetStarted,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: colors.primary.defaultValue,
                                  foregroundColor: colors.text.defaultValue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      locale.getStarted,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Gap(8),
                                    const Icon(
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
                      Text(
                        locale.footerCopyright,
                        style: TextStyle(
                          fontSize: 12,
                          color: colors.text.muted,
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
    final colors = context.color;
    final locale = context.locale;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          locale.heroHeadlinePrefix,
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w800,
            color: colors.text.defaultValue,
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
                return LinearGradient(
                  colors: [
                    colors.primary.defaultValue,
                    colors.accent.gold,
                    colors.accent.purple,
                  ],
                  stops: const [0.0, 0.45, 1.0],
                ).createShader(bounds);
              },
              child: Text(
                locale.heroHeadlineGradient,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  color: colors.text.defaultValue,
                  height: 1.15,
                  letterSpacing: -1.0,
                ),
              ),
            ),
            Text(
              locale.heroHeadlineSuffix,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w800,
                color: colors.text.defaultValue,
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
    final colors = context.color;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      decoration: BoxDecoration(
        color: colors.background.surface.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: colors.border.defaultValue,
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
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: colors.text.defaultValue,
                letterSpacing: -0.1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


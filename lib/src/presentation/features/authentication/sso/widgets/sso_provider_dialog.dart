import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../../core/base/result.dart';
import '../../../../../core/extensions/localization.dart';
import '../../../../../domain/entities/oidc_provider_entity.dart';
import '../../../../core/failure/business_failure_ui_mapper.dart';
import '../../../../core/theme/theme.dart';
import '../riverpod/sso_provider.dart';
import 'sso_ticket_dialog.dart';
import 'sso_webview_page.dart';

class SsoProviderDialog extends ConsumerStatefulWidget {
  const SsoProviderDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (context) => const SsoProviderDialog(),
    );
  }

  @override
  ConsumerState<SsoProviderDialog> createState() => _SsoProviderDialogState();
}

class _SsoProviderDialogState extends ConsumerState<SsoProviderDialog> {
  bool _isLoading = true;
  String? _errorMessage;
  List<OidcProviderEntity> _providers = const [];

  @override
  void initState() {
    super.initState();
    _loadProviders();
  }

  Future<void> _loadProviders() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final result = await ref.read(ssoProvider.notifier).fetchProviders();

    if (!mounted) return;

    switch (result) {
      case Success(:final data):
        setState(() {
          _isLoading = false;
          _providers = data;
        });
      case Error(:final error):
        setState(() {
          _isLoading = false;
          _errorMessage =
              BusinessFailureUIMapper.map(error, context.locale).message;
        });
    }
  }

  Future<void> _handleProviderSelected(OidcProviderEntity provider) async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final authUrlResult =
        await ref.read(ssoProvider.notifier).getAuthUrl(provider.id);

    if (!mounted) return;

    switch (authUrlResult) {
      case Success(:final data):
        Navigator.of(context).pop();
        await SsoWebViewPage.open(
          context,
          initialUrl: data,
          provider: provider,
        );
      case Error(:final error):
        setState(() {
          _isLoading = false;
          _errorMessage =
              BusinessFailureUIMapper.map(error, context.locale).message;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.color;
    final locale = context.locale;

    return Dialog(
      backgroundColor: colors.background.canvas,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: colors.border.subtle,
          width: 1,
        ),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 440),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: colors.primary.defaultValue
                          .withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.corporate_fare_rounded,
                      color: colors.primary.defaultValue,
                      size: 20,
                    ),
                  ),
                  const Gap(12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          locale.ssoLoginTitle,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: colors.text.defaultValue,
                          ),
                        ),
                        const Gap(2),
                        Text(
                          locale.ssoLoginSubtitle,
                          style: TextStyle(
                            fontSize: 12,
                            color: colors.text.muted,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      color: colors.text.muted,
                      size: 20,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const Gap(20),
              if (_isLoading) ...[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: CircularProgressIndicator(
                      color: colors.primary.defaultValue,
                      strokeWidth: 2.5,
                    ),
                  ),
                ),
              ] else if (_errorMessage != null) ...[
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: colors.status.danger.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: colors.status.danger.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: colors.status.danger,
                        size: 18,
                      ),
                      const Gap(8),
                      Expanded(
                        child: Text(
                          _errorMessage!,
                          style: TextStyle(
                            fontSize: 13,
                            color: colors.status.danger,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(16),
                Center(
                  child: TextButton.icon(
                    onPressed: _loadProviders,
                    icon: const Icon(Icons.refresh, size: 16),
                    label: Text(locale.clickToResend),
                  ),
                ),
              ] else if (_providers.isEmpty) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.cloud_off_rounded,
                          size: 36,
                          color: colors.text.muted,
                        ),
                        const Gap(8),
                        Text(
                          locale.noSsoProvidersFound,
                          style: TextStyle(
                            fontSize: 13,
                            color: colors.text.muted,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(12),
                Center(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      SsoTicketDialog.show(context);
                    },
                    icon: const Icon(Icons.key_rounded, size: 16),
                    label: Text(locale.enterAuthTicket),
                  ),
                ),
              ] else ...[
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _providers.length,
                  separatorBuilder: (context, index) => const Gap(10),
                  itemBuilder: (context, index) {
                    final provider = _providers[index];
                    return _ProviderTile(
                      provider: provider,
                      onTap: () => _handleProviderSelected(provider),
                    );
                  },
                ),
                const Gap(16),
                Center(
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      SsoTicketDialog.show(context);
                    },
                    icon: const Icon(Icons.vpn_key_outlined, size: 16),
                    label: Text(
                      locale.enterAuthTicket,
                      style: TextStyle(
                        fontSize: 12,
                        color: colors.text.muted,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _ProviderTile extends StatelessWidget {
  const _ProviderTile({
    required this.provider,
    required this.onTap,
  });

  final OidcProviderEntity provider;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.color;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: colors.background.canvas,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: colors.border.subtle,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.shield_outlined,
                size: 20,
                color: colors.primary.defaultValue,
              ),
              const Gap(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      provider.oidcName,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: colors.text.defaultValue,
                      ),
                    ),
                    if (provider.allowedDomains != null &&
                        provider.allowedDomains!.isNotEmpty) ...[
                      const Gap(2),
                      Text(
                        provider.allowedDomains!,
                        style: TextStyle(
                          fontSize: 11,
                          color: colors.text.muted,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
                color: colors.text.muted,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

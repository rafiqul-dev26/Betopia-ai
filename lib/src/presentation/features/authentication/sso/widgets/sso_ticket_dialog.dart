import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/localization.dart';
import '../../../../../domain/failures/business_failure.dart';
import '../../../../core/failure/business_failure_ui_mapper.dart';
import '../../../../core/router/routes.dart';
import '../../../../core/theme/theme.dart';
import '../riverpod/sso_provider.dart';

class SsoTicketDialog extends ConsumerStatefulWidget {
  const SsoTicketDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (context) => const SsoTicketDialog(),
    );
  }

  @override
  ConsumerState<SsoTicketDialog> createState() => _SsoTicketDialogState();
}

class _SsoTicketDialogState extends ConsumerState<SsoTicketDialog> {
  final _ticketController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _ticketController.dispose();
    super.dispose();
  }

  Future<void> _handleExchange() async {
    if (!_formKey.currentState!.validate()) return;

    final ticket = _ticketController.text.trim();
    await ref.read(ssoProvider.notifier).exchangeTicket(ticket: ticket);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.color;
    final locale = context.locale;
    final ssoState = ref.watch(ssoProvider);
    final isLoading = ssoState.isLoading;

    ref.listen(ssoProvider, (prev, next) {
      next.whenOrNull(
        data: (result) {
          if (result != null && mounted) {
            Navigator.of(context, rootNavigator: true).pop();
            context.go(Routes.home.path);
          }
        },
        error: (error, _) {
          if (mounted) {
            final message = error is BusinessFailure
                ? BusinessFailureUIMapper.map(error, locale).message
                : locale.ssoFailed;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: colors.status.danger,
              ),
            );
          }
        },
      );
    });

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
          child: Form(
            key: _formKey,
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
                        Icons.vpn_key_rounded,
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
                            locale.enterAuthTicket,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: colors.text.defaultValue,
                            ),
                          ),
                          const Gap(2),
                          Text(
                            locale.enterAuthTicketHint,
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
                TextFormField(
                  controller: _ticketController,
                  enabled: !isLoading,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 13,
                    color: colors.text.defaultValue,
                  ),
                  decoration: InputDecoration(
                    hintText: 'e.g. sso_auth_ticket_...',
                    hintStyle: TextStyle(
                      fontSize: 13,
                      color: colors.text.muted,
                    ),
                    filled: true,
                    fillColor: colors.background.canvas,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: colors.border.subtle),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: colors.border.subtle),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: colors.primary.defaultValue,
                        width: 1.5,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return locale.isRequired;
                    }
                    if (value.trim().length < 8) {
                      return locale.minLengthValidation(8);
                    }
                    return null;
                  },
                ),
                const Gap(20),
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : _handleExchange,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors.primary.defaultValue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),
                    child: isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            locale.exchangeTicket,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
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

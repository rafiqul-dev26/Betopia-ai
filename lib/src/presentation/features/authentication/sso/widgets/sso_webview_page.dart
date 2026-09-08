import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import '../../../../../core/extensions/localization.dart';
import '../../../../../domain/entities/oidc_provider_entity.dart';
import '../../../../../domain/failures/business_failure.dart';
import '../../../../core/failure/business_failure_ui_mapper.dart';
import '../../../../core/router/routes.dart';
import '../../../../core/theme/theme.dart';
import '../riverpod/sso_provider.dart';

/// In-App WebView for seamless IdP SSO authentication using webview_flutter.
/// Automatically loads the authorization URL and intercepts redirects
/// containing authentication tickets/codes to log the user in.
class SsoWebViewPage extends ConsumerStatefulWidget {
  const SsoWebViewPage({
    super.key,
    required this.initialUrl,
    required this.provider,
  });

  final String initialUrl;
  final OidcProviderEntity provider;

  static Future<void> open(
    BuildContext context, {
    required String initialUrl,
    required OidcProviderEntity provider,
  }) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => SsoWebViewPage(
          initialUrl: initialUrl,
          provider: provider,
        ),
      ),
    );
  }

  @override
  ConsumerState<SsoWebViewPage> createState() => _SsoWebViewPageState();
}

class _SsoWebViewPageState extends ConsumerState<SsoWebViewPage> {
  late final WebViewController _controller;
  int _loadingProgress = 0;
  bool _isExchanging = false;
  bool _hasIntercepted = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _initWebViewController();
  }

  void _initWebViewController() {
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else if (WebViewPlatform.instance is AndroidWebViewPlatform) {
      params = AndroidWebViewControllerCreationParams();
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final controller = WebViewController.fromPlatformCreationParams(params);

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            if (mounted) {
              setState(() {
                _loadingProgress = progress;
                if (progress >= 100) {
                  _errorMessage = null;
                }
              });
            }
          },
          onPageStarted: (url) {
            _handleInterceptUrl(url);
          },
          onPageFinished: (url) {
            _handleInterceptUrl(url);
          },
          onUrlChange: (change) {
            final url = change.url;
            print('WebView URL changed: $url');
            if (url != null) _handleInterceptUrl(url);
          },
          onWebResourceError: (error) {
            // Ignore cancelled navigation errors (-999 on iOS / -1 on Android)
            if (error.errorCode == -999 || error.errorCode == -1) return;

            if (mounted && !_hasIntercepted && !_isExchanging) {
              setState(() {
                _errorMessage =
                    '${error.description} (Code: ${error.errorCode})';
              });
            }
          },
          onNavigationRequest: (request) {
            final intercepted = _handleInterceptUrl(request.url);
            if (intercepted) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );

    // Platform-specific enhancements
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      final androidController =
          controller.platform as AndroidWebViewController;
      androidController.setMediaPlaybackRequiresUserGesture(false);
    }

    final effectiveUrl = widget.initialUrl.trim();
    final uri = Uri.tryParse(effectiveUrl);
    if (uri != null) {
      controller.loadRequest(uri);
    }

    _controller = controller;
  }

  bool _handleInterceptUrl(String urlString) {
    if (_hasIntercepted || _isExchanging) return true;

    final uri = Uri.tryParse(urlString);
    if (uri == null) return false;

    final queryParams = uri.queryParameters;
    final fragmentParams = uri.fragment.isNotEmpty
        ? Uri.splitQueryString(uri.fragment)
        : const <String, String>{};

    // 1. Check for ticket in query parameters or fragment
    final ticket = queryParams['ticket'] ?? fragmentParams['ticket'];
    if (ticket != null && ticket.isNotEmpty) {
      _hasIntercepted = true;
      _exchangeAuthTicket(ticket);
      return true;
    }

    // 2. Check for direct access_token / token in query or fragment
    final accessToken = queryParams['access_token'] ??
        fragmentParams['access_token'] ??
        queryParams['token'] ??
        fragmentParams['token'];
    final refreshToken =
        queryParams['refresh_token'] ?? fragmentParams['refresh_token'];

    if (accessToken != null && accessToken.isNotEmpty) {
      _hasIntercepted = true;
      _completeDirectSession(accessToken, refreshToken);
      return true;
    }

    // Allow IdP callback to backend (/api/oidc/callback) to proceed
    return false;
  }

  Future<void> _exchangeAuthTicket(String ticket) async {
    setState(() => _isExchanging = true);
    await ref.read(ssoProvider.notifier).exchangeTicket(ticket: ticket);
  }

  Future<void> _completeDirectSession(
    String accessToken,
    String? refreshToken,
  ) async {
    setState(() => _isExchanging = true);
    await ref.read(ssoProvider.notifier).completeDirectSession(
          accessToken: accessToken,
          refreshToken: refreshToken,
        );
  }

  Future<void> _openExternalBrowser() async {
    final uri = Uri.tryParse(widget.initialUrl);
    if (uri != null && await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.color;
    final locale = context.locale;

    ref.listen(ssoProvider, (prev, next) {
      next.whenOrNull(
        data: (result) {
          if (result != null && mounted) {
            Navigator.of(context).pop();
            context.go(Routes.home.path);
          }
        },
        error: (error, _) {
          if (mounted) {
            setState(() {
              _isExchanging = false;
              _hasIntercepted = false;
            });
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

    return Scaffold(
      backgroundColor: colors.background.canvas,
      appBar: AppBar(
        backgroundColor: colors.background.canvas,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.close, color: colors.text.defaultValue, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            Icon(
              Icons.lock_outline_rounded,
              size: 16,
              color: colors.primary.defaultValue,
            ),
            const Gap(8),
            Expanded(
              child: Text(
                '${widget.provider.oidcName} - ${locale.ssoBrowserTitle}',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: colors.text.defaultValue,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Open in system browser',
            icon: Icon(
              Icons.open_in_browser_rounded,
              color: colors.text.muted,
              size: 20,
            ),
            onPressed: _openExternalBrowser,
          ),
          IconButton(
            icon: Icon(
              Icons.refresh_rounded,
              color: colors.text.muted,
              size: 20,
            ),
            onPressed: () {
              setState(() => _errorMessage = null);
              _controller.reload();
            },
          ),
        ],
        bottom: _loadingProgress < 100 && !_isExchanging
            ? PreferredSize(
                preferredSize: const Size.fromHeight(2),
                child: LinearProgressIndicator(
                  value: _loadingProgress / 100.0,
                  backgroundColor: colors.border.subtle,
                  color: colors.primary.defaultValue,
                  minHeight: 2,
                ),
              )
            : null,
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_errorMessage != null && !_isExchanging)
            Container(
              color: colors.background.canvas,
              padding: const EdgeInsets.all(24),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.error_outline_rounded,
                      color: colors.status.danger,
                      size: 40,
                    ),
                    const Gap(12),
                    Text(
                      _errorMessage!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        color: colors.status.danger,
                      ),
                    ),
                    const Gap(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton.icon(
                          onPressed: () {
                            setState(() => _errorMessage = null);
                            _controller.reload();
                          },
                          icon: const Icon(Icons.refresh, size: 16),
                          label: Text(locale.clickToResend),
                        ),
                        const Gap(12),
                        ElevatedButton.icon(
                          onPressed: _openExternalBrowser,
                          icon: const Icon(Icons.open_in_browser, size: 16),
                          label: const Text('Open External'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          if (_isExchanging)
            Container(
              color: colors.background.canvas.withValues(alpha: 0.9),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(
                      color: colors.primary.defaultValue,
                      strokeWidth: 3,
                    ),
                    const Gap(16),
                    Text(
                      locale.authenticatingSso,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: colors.text.defaultValue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

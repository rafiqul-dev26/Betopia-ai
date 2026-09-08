import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/localization.dart';
import '../../../../domain/failures/business_failure.dart';
import '../../../core/application_state/logout_provider/logout_provider.dart';
import '../../../core/failure/business_failure_ui_mapper.dart';
import '../../../core/router/routes.dart';
import '../../../core/theme/theme.dart';
import '../../../core/widgets/betopia_logo.dart';
import '../widgets/chat_sidebar.dart';
import '../widgets/dot_grid_background.dart';

/// Betopia AI Home / Dashboard screen matching the reference design.
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final _promptController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isMenuOpen = false;
  bool _isSidebarOpen = true;
  String? _selectedChatId;
  String _selectedMode = 'Deep Research';

  @override
  void initState() {
    super.initState();
    ref.listenManual(logoutProvider, (previous, next) {
      switch (next) {
        case AsyncData(value: true):
          if (context.mounted) {
            context.go(Routes.login.path);
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
        default:
      }
    });
  }

  @override
  void dispose() {
    _promptController.dispose();
    super.dispose();
  }

  void _onSubmitted([String? text]) {
    final query = text ?? _promptController.text.trim();
    if (query.isEmpty) return;

    _promptController.clear();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: context.color.background.surface,
        content: Text(
          context.locale.processingQuery(query, _selectedMode),
          style: TextStyle(color: context.color.text.defaultValue),
        ),
      ),
    );
  }

  void _onSelectChat(String id) {
    setState(() => _selectedChatId = id);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: context.color.background.surface,
        content: Text(
          context.locale.loadedConversation(id),
          style: TextStyle(color: context.color.text.defaultValue),
        ),
      ),
    );
  }

  void _onNewChat() {
    setState(() {
      _selectedChatId = null;
      _promptController.clear();
    });
  }

  Future<void> _showLogoutConfirmationDialog() async {
    final colors = context.color;
    final locale = context.locale;

    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        bool isSubmitting = false;

        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              backgroundColor: colors.background.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: colors.border.defaultValue, width: 1),
              ),
              contentPadding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          colors.primary.defaultValue.withValues(alpha: 0.12),
                      border: Border.all(
                        color:
                            colors.primary.defaultValue.withValues(alpha: 0.25),
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.logout_rounded,
                        color: colors.primary.defaultValue,
                        size: 26,
                      ),
                    ),
                  ),
                  const Gap(18),
                  Text(
                    locale.signOutConfirmTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: colors.text.defaultValue,
                    ),
                  ),
                  const Gap(8),
                  Text(
                    locale.signOutConfirmDescription,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: colors.text.muted,
                      height: 1.4,
                    ),
                  ),
                  const Gap(24),
                  if (isSubmitting) ...[
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: colors.background.canvas,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: colors.border.defaultValue),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.4,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                colors.primary.defaultValue,
                              ),
                            ),
                          ),
                          const Gap(12),
                          Text(
                            locale.signingOut,
                            style: TextStyle(
                              color: colors.text.defaultValue,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ] else ...[
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.of(dialogContext).pop(),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              side: BorderSide(color: colors.border.subtle),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              foregroundColor: colors.text.muted,
                            ),
                            child: Text(
                              locale.cancel,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const Gap(12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              setDialogState(() => isSubmitting = true);
                              Future.delayed(
                                const Duration(milliseconds: 1000),
                                () async {
                                  await ref
                                      .read(logoutProvider.notifier)
                                      .call();
                                  if (dialogContext.mounted) {
                                    Navigator.of(dialogContext).pop();
                                  }
                                },
                              );

                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              backgroundColor: colors.primary.defaultValue,
                              foregroundColor: colors.text.defaultValue,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              locale.yesSignOut,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth >= 800;
    final isLoggingOut = ref.watch(logoutProvider).isLoading;
    final colors = context.color;
    final locale = context.locale;

    final mainContent = DotGridBackground(
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 680),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Large Emblem
                  const BetopiaIcon(size: 80),
                  const Gap(10),

                  // Greeting Header
                  const _HeroGreeting(name: 'Md'),
                  const Gap(10),

                  // Subtitle
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      locale.homeSubtitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.45,
                        color: colors.text.muted,
                        letterSpacing: -0.1,
                      ),
                    ),
                  ),
                  const Gap(32),

                  // Floating Attach Menu & Input Bar Stack
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Main Input Capsule
                          _PromptCapsule(
                            controller: _promptController,
                            isMenuOpen: _isMenuOpen,
                            onToggleMenu: () {
                              setState(() => _isMenuOpen = !_isMenuOpen);
                            },
                            onSubmit: _onSubmitted,
                          ),
                        ],
                      ),

                      // Floating Attach Menu
                      if (_isMenuOpen)
                        Positioned(
                          left: 14,
                          bottom: 185,
                          child: _AttachMenu(
                            onClose: () {
                              setState(() => _isMenuOpen = false);
                            },
                          ),
                        ),
                    ],
                  ),
                  const Gap(22),

                  // Mode Filter Chips
                  _ModeChipsRow(
                    selectedMode: _selectedMode,
                    onSelectMode: (mode) {
                      setState(() => _selectedMode = mode);
                    },
                  ),
                  const Gap(36),

                  // Footer Disclaimer
                  Text(
                    locale.disclaimerBetopiaAi,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                      color: colors.text.muted.withValues(alpha: 0.7),
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    final loadingOverlay = isLoggingOut
        ? Container(
            color: Colors.black.withValues(alpha: 0.7),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 24,
                ),
                decoration: BoxDecoration(
                  color: colors.background.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: colors.border.defaultValue),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.4),
                      blurRadius: 24,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 36,
                      height: 36,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.8,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          colors.primary.defaultValue,
                        ),
                      ),
                    ),
                    const Gap(16),
                    Text(
                      locale.signingOut,
                      style: TextStyle(
                        color: colors.text.defaultValue,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : const SizedBox.shrink();

    if (isWideScreen) {
      return Scaffold(
        key: _scaffoldKey,
        backgroundColor: colors.background.canvas,
        body: Stack(
          children: [
            Row(
              children: [
                // Left Sidebar
                if (_isSidebarOpen)
                  ChatSidebar(
                    selectedChatId: _selectedChatId,
                    onSelectChat: _onSelectChat,
                    onNewChat: _onNewChat,
                    onToggleCollapse: () {
                      setState(() => _isSidebarOpen = false);
                    },
                    onSignOut: _showLogoutConfirmationDialog,
                  ),

                // Main Chat Area
                Expanded(
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      scrolledUnderElevation: 0,
                      leading: !_isSidebarOpen
                          ? IconButton(
                              icon: Icon(
                                Icons.view_sidebar_outlined,
                                size: 20,
                                color: colors.text.muted,
                              ),
                              tooltip: locale.openSidebar,
                              onPressed: () {
                                setState(() => _isSidebarOpen = true);
                              },
                            )
                          : null,
                      actions: [
                        IconButton(
                          icon: Icon(
                            Icons.logout_rounded,
                            color: colors.text.muted,
                            size: 20,
                          ),
                          tooltip: locale.signOut,
                          onPressed: _showLogoutConfirmationDialog,
                        ),
                        const Gap(8),
                      ],
                    ),
                    body: mainContent,
                  ),
                ),
              ],
            ),
            if (isLoggingOut) loadingOverlay,
          ],
        ),
      );
    }

    // Mobile / Compact Screen
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: colors.background.canvas,
      drawer: Drawer(
        backgroundColor: colors.background.canvas,
        child: ChatSidebar(
          isDrawer: true,
          selectedChatId: _selectedChatId,
          onSelectChat: (id) {
            _onSelectChat(id);
            Navigator.of(context).pop();
          },
          onNewChat: () {
            _onNewChat();
            Navigator.of(context).pop();
          },
          onToggleCollapse: () {
            Navigator.of(context).pop();
          },
          onSignOut: () {
            Navigator.of(context).pop();
            unawaited(_showLogoutConfirmationDialog());
          },
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu_rounded,
            size: 22,
            color: colors.text.muted,
          ),
          tooltip: locale.openSidebar,
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: const BetopiaLogo(fontSize: 18, iconSize: 24),
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout_rounded,
              color: colors.text.muted,
              size: 20,
            ),
            tooltip: locale.signOut,
            onPressed: _showLogoutConfirmationDialog,
          ),
          const Gap(8),
        ],
      ),
      body: Stack(
        children: [
          mainContent,
          if (isLoggingOut) loadingOverlay,
        ],
      ),
    );
  }
}

class _HeroGreeting extends StatelessWidget {
  const _HeroGreeting({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    final colors = context.color;
    final locale = context.locale;
    final greeting = locale.helloGreeting(name);
    final prefix = greeting.contains(name)
        ? greeting.substring(0, greeting.indexOf(name))
        : 'Hello, ';

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          prefix,
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.w800,
            color: colors.text.defaultValue,
            letterSpacing: -1.2,
          ),
        ),
        ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: [
                colors.primary.defaultValue,
                colors.accent.gold,
                colors.accent.purple,
              ],
              stops: const [0.0, 0.5, 1.0],
            ).createShader(bounds);
          },
          child: Text(
            name,
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.w800,
              color: colors.text.defaultValue,
              letterSpacing: -1.2,
            ),
          ),
        ),
      ],
    );
  }
}

class _AttachMenu extends StatelessWidget {
  const _AttachMenu({required this.onClose});

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final colors = context.color;
    final locale = context.locale;

    return Container(
      width: 200,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: colors.background.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colors.border.defaultValue, width: 0.9),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.45),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _AttachMenuItem(
            icon: Icons.attach_file_rounded,
            iconColor: colors.primary.defaultValue,
            iconBg: colors.primary.defaultValue.withValues(alpha: 0.15),
            title: locale.addFilesAndPhotos,
            onTap: onClose,
          ),
          const Gap(4),
          _AttachMenuItem(
            icon: Icons.storage_rounded,
            iconColor: colors.status.success,
            iconBg: colors.status.success.withValues(alpha: 0.15),
            title: locale.knowledgeBase,
            trailing: Icon(
              Icons.arrow_forward_rounded,
              size: 13,
              color: colors.text.muted,
            ),
            onTap: onClose,
          ),
          const Gap(4),
          _AttachMenuItem(
            icon: Icons.build_outlined,
            iconColor: colors.text.muted,
            iconBg: colors.border.subtle,
            title: locale.toolsAndSkills,
            badge: locale.comingSoon,
            onTap: onClose,
          ),
        ],
      ),
    );
  }
}

class _AttachMenuItem extends StatelessWidget {
  const _AttachMenuItem({
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.title,
    this.trailing,
    this.badge,
    required this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String title;
  final Widget? trailing;
  final String? badge;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.color;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, size: 15, color: iconColor),
            ),
            const Gap(10),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w500,
                  color: colors.text.defaultValue,
                ),
              ),
            ),
            if (badge != null)
              Text(
                badge!,
                style: TextStyle(
                  fontSize: 9.5,
                  color: colors.text.muted,
                ),
              ),
            if (trailing case final Widget widget) widget,
          ],
        ),
      ),
    );
  }
}

class _PromptCapsule extends StatelessWidget {
  const _PromptCapsule({
    required this.controller,
    required this.isMenuOpen,
    required this.onToggleMenu,
    required this.onSubmit,
  });

  final TextEditingController controller;
  final bool isMenuOpen;
  final VoidCallback onToggleMenu;
  final ValueChanged<String> onSubmit;

  @override
  Widget build(BuildContext context) {
    final colors = context.color;
    final locale = context.locale;

    return Container(
      decoration: BoxDecoration(
        color: colors.background.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colors.border.defaultValue, width: 1.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.35),
            blurRadius: 24,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // Top Input Stack
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
            child: Stack(
              children: [
                // Full Width Text Input
                TextField(
                  controller: controller,
                  maxLines: 5,
                  onSubmitted: onSubmit,
                  style: TextStyle(
                    fontSize: 14,
                    color: colors.text.defaultValue,
                  ),
                  decoration: InputDecoration(
                    hintText: locale.whatWillYouCreateToday,
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: colors.text.muted,
                    ),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    isDense: true,
                    contentPadding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                  ),
                ),

                // Left Attach Toggle Button (on top of text box)
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onTap: onToggleMenu,
                    child: Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        color: colors.background.canvas,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        isMenuOpen
                            ? Icons.close_rounded
                            : Icons.attach_file_rounded,
                        size: 18,
                        color: colors.primary.defaultValue,
                      ),
                    ),
                  ),
                ),

                // Right Action Icons + Send Button (on top of text box)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.translate_rounded,
                          size: 18,
                          color: colors.text.muted,
                        ),
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(
                          minWidth: 32,
                          minHeight: 34,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.mic_none_rounded,
                          size: 19,
                          color: colors.text.muted,
                        ),
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(
                          minWidth: 32,
                          minHeight: 34,
                        ),
                      ),
                      const Gap(4),

                      // Send Button
                      GestureDetector(
                        onTap: () => onSubmit(controller.text),
                        child: Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                            color: colors.primary.defaultValue,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.arrow_upward_rounded,
                            size: 18,
                            color: colors.text.defaultValue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Divider inside capsule
          Divider(
            color: colors.border.subtle,
            height: 1,
            thickness: 0.8,
          ),

          // Bottom Action Options Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                // AUTO Dropdown
                _CapsulePill(
                  icon: Icons.auto_awesome_rounded,
                  iconColor: colors.text.muted,
                  label: locale.auto,
                  hasDropdown: true,
                  onTap: () {},
                ),
                const Gap(8),

                // AGENT Pill
                _CapsulePill(
                  icon: Icons.smart_toy_outlined,
                  iconColor: colors.text.muted,
                  label: locale.agent,
                  hasDot: true,
                  onTap: () {},
                ),
                const Spacer(),

                // Commands shortcut
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: colors.background.canvas,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '[/]',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: colors.primary.defaultValue,
                        ),
                      ),
                      const Gap(4),
                      Text(
                        locale.commands,
                        style: TextStyle(
                          fontSize: 11,
                          color: colors.text.muted,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CapsulePill extends StatelessWidget {
  const _CapsulePill({
    required this.icon,
    required this.iconColor,
    required this.label,
    this.hasDropdown = false,
    this.hasDot = false,
    required this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final bool hasDropdown;
  final bool hasDot;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.color;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: colors.background.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: colors.border.defaultValue, width: 0.8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 13, color: iconColor),
            const Gap(5),
            Text(
              label,
              style: TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.w600,
                color: colors.text.defaultValue,
                letterSpacing: 0.4,
              ),
            ),
            if (hasDot) ...[
              const Gap(6),
              Container(
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                  color: colors.status.success,
                  shape: BoxShape.circle,
                ),
              ),
            ],
            if (hasDropdown) ...[
              const Gap(4),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 14,
                color: colors.text.muted,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ModeChipsRow extends StatelessWidget {
  const _ModeChipsRow({
    required this.selectedMode,
    required this.onSelectMode,
  });

  final String selectedMode;
  final ValueChanged<String> onSelectMode;

  @override
  Widget build(BuildContext context) {
    final locale = context.locale;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _ModeChip(
            icon: Icons.slideshow_outlined,
            label: locale.slides,
            badge: locale.soon,
            isSelected: selectedMode == locale.slides,
            onTap: () => onSelectMode(locale.slides),
          ),
          const Gap(8),
          _ModeChip(
            icon: Icons.psychology_outlined,
            label: locale.deepResearch,
            isSpecial: true,
            isSelected: selectedMode == locale.deepResearch,
            onTap: () => onSelectMode(locale.deepResearch),
          ),
          const Gap(8),
          _ModeChip(
            icon: Icons.code_rounded,
            label: locale.code,
            badge: locale.soon,
            isSelected: selectedMode == locale.code,
            onTap: () => onSelectMode(locale.code),
          ),
          const Gap(8),
          _ModeChip(
            icon: Icons.image_outlined,
            label: locale.imageGen,
            isPurple: true,
            isSelected: selectedMode == locale.imageGen,
            onTap: () => onSelectMode(locale.imageGen),
          ),
          const Gap(8),
          _ModeChip(
            label: locale.more,
            hasDropdown: true,
            isSelected: false,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _ModeChip extends StatelessWidget {
  const _ModeChip({
    this.icon,
    required this.label,
    this.badge,
    this.isSpecial = false,
    this.isPurple = false,
    this.hasDropdown = false,
    required this.isSelected,
    required this.onTap,
  });

  final IconData? icon;
  final String label;
  final String? badge;
  final bool isSpecial;
  final bool isPurple;
  final bool hasDropdown;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.color;

    Color bg = colors.background.surface;
    Color border = colors.border.defaultValue;
    Color textColor = colors.text.muted;

    if (isSpecial) {
      bg = colors.primary.defaultValue.withValues(alpha: 0.15);
      border = colors.primary.defaultValue.withValues(alpha: 0.6);
      textColor = colors.primary.defaultValue;
    } else if (isPurple) {
      bg = colors.accent.purple.withValues(alpha: 0.15);
      border = colors.accent.purple.withValues(alpha: 0.5);
      textColor = colors.accent.purple;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: border, width: 0.9),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 15, color: textColor),
              const Gap(6),
            ],
            Text(
              label,
              style: TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
            if (badge != null) ...[
              const Gap(6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                decoration: BoxDecoration(
                  color: colors.background.canvas,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  badge!,
                  style: TextStyle(
                    fontSize: 8.5,
                    fontWeight: FontWeight.w700,
                    color: colors.text.muted,
                  ),
                ),
              ),
            ],
            if (hasDropdown) ...[
              const Gap(4),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 14,
                color: colors.text.muted,
              ),
            ],
          ],
        ),
      ),
    );
  }
}


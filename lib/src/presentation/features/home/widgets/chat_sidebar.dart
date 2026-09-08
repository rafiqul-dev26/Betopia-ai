import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../core/extensions/localization.dart';
import '../../../core/application_state/logout_provider/logout_provider.dart';
import '../../../core/theme/theme.dart';
import '../../../core/widgets/betopia_logo.dart';

/// Item representation in the chat history sidebar.
class ChatHistoryItem {
  const ChatHistoryItem({
    required this.id,
    required this.title,
    required this.group,
  });

  final String id;
  final String title;
  final String group;
}

/// Left navigation sidebar for Betopia AI displaying chat history,
/// workspaces, libraries, and user profile.
class ChatSidebar extends ConsumerStatefulWidget {
  const ChatSidebar({
    super.key,
    this.selectedChatId,
    this.onSelectChat,
    this.onNewChat,
    this.onToggleCollapse,
    this.onSignOut,
    this.isDrawer = false,
  });

  final String? selectedChatId;
  final ValueChanged<String>? onSelectChat;
  final VoidCallback? onNewChat;
  final VoidCallback? onToggleCollapse;
  final VoidCallback? onSignOut;
  final bool isDrawer;

  @override
  ConsumerState<ChatSidebar> createState() => _ChatSidebarState();
}

class _ChatSidebarState extends ConsumerState<ChatSidebar> {
  bool _isWorkspaceExpanded = true;
  bool _isLibraryExpanded = true;

  List<ChatHistoryItem> _getHistoryItems(BuildContext context) => [
        ChatHistoryItem(
          id: '1',
          title: 'How Solve a Critical TI',
          group: context.locale.yesterday,
        ),
        ChatHistoryItem(
          id: '2',
          title: 'Chat Gpt Like Applicat',
          group: context.locale.yesterday,
        ),
        ChatHistoryItem(
          id: '3',
          title: 'You Are an Autonomous',
          group: context.locale.yesterday,
        ),
        ChatHistoryItem(
          id: '4',
          title: 'Image Generate Where',
          group: context.locale.yesterday,
        ),
        ChatHistoryItem(
          id: '5',
          title: 'Quick Greeting',
          group: context.locale.yesterday,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final colors = context.color;
    final locale = context.locale;
    final historyItems = _getHistoryItems(context);

    return Container(
      width: 270,
      decoration: BoxDecoration(
        color: colors.background.canvas,
        border: Border(
          right: BorderSide(color: colors.border.subtle, width: 0.8),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top Bar: Logo & Collapse Button
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 12, 14),
              child: Row(
                children: [
                  const BetopiaLogo(fontSize: 17, iconSize: 22),
                  const Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.view_sidebar_outlined,
                      size: 19,
                      color: colors.text.muted,
                    ),
                    splashRadius: 18,
                    tooltip: locale.collapseSidebar,
                    onPressed: widget.onToggleCollapse,
                  ),
                ],
              ),
            ),

            // New Chat Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: InkWell(
                onTap: widget.onNewChat,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: colors.primary.defaultValue.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: colors.primary.defaultValue.withValues(alpha: 0.3),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_circle_outline_rounded,
                        size: 16,
                        color: colors.primary.defaultValue,
                      ),
                      const Gap(8),
                      Text(
                        locale.newChat,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: colors.primary.defaultValue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Gap(16),

            // Chat History Section
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    child: Text(
                      locale.chatHistory,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.7,
                        color: colors.text.muted,
                      ),
                    ),
                  ),
                  const Gap(4),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    child: Text(
                      locale.yesterday,
                      style: TextStyle(
                        fontSize: 9.5,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                        color: colors.text.muted.withValues(alpha: 0.7),
                      ),
                    ),
                  ),
                  const Gap(2),
                  for (final item in historyItems)
                    _HistoryTile(
                      item: item,
                      isSelected: widget.selectedChatId == item.id,
                      onTap: () => widget.onSelectChat?.call(item.id),
                    ),
                ],
              ),
            ),

            Divider(color: colors.border.subtle, height: 1),

            // Collapsible Workspace Section
            _CollapsibleGroup(
              title: locale.workspace,
              isExpanded: _isWorkspaceExpanded,
              onToggle: () {
                setState(() => _isWorkspaceExpanded = !_isWorkspaceExpanded);
              },
              children: [
                _NavSubTile(
                  icon: Icons.build_outlined,
                  title: locale.tools,
                  onTap: () {},
                ),
                _NavSubTile(
                  icon: Icons.hub_outlined,
                  title: locale.connectors,
                  onTap: () {},
                ),
              ],
            ),

            Divider(color: colors.border.subtle, height: 1),

            // Collapsible Library Section
            _CollapsibleGroup(
              title: locale.library,
              isExpanded: _isLibraryExpanded,
              onToggle: () {
                setState(() => _isLibraryExpanded = !_isLibraryExpanded);
              },
              children: [
                _NavSubTile(
                  icon: Icons.library_books_outlined,
                  title: locale.assetLibrary,
                  onTap: () {},
                ),
                _NavSubTile(
                  icon: Icons.history_rounded,
                  title: locale.temporalArchive,
                  onTap: () {},
                ),
              ],
            ),

            Divider(color: colors.border.subtle, height: 1),

            // User Profile Section
            _UserProfileTile(
              name: 'Md rafiqul islam',
              role: locale.standardRole,
              onSignOut: widget.onSignOut ?? () {
                ref.read(logoutProvider.notifier).call();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _HistoryTile extends StatelessWidget {
  const _HistoryTile({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  final ChatHistoryItem item;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.color;

    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      decoration: BoxDecoration(
        color: isSelected ? colors.background.surface : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        dense: true,
        visualDensity: const VisualDensity(horizontal: -3, vertical: -3),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        leading: Icon(
          Icons.chat_bubble_outline_rounded,
          size: 14,
          color: colors.text.muted,
        ),
        title: Text(
          item.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 12.5,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            color:
                isSelected ? colors.text.defaultValue : colors.text.muted,
          ),
        ),
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        hoverColor: colors.background.surface,
      ),
    );
  }
}

class _CollapsibleGroup extends StatelessWidget {
  const _CollapsibleGroup({
    required this.title,
    required this.isExpanded,
    required this.onToggle,
    required this.children,
  });

  final String title;
  final bool isExpanded;
  final VoidCallback onToggle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final colors = context.color;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: onToggle,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 12, 8),
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.7,
                    color: colors.text.muted,
                  ),
                ),
                const Spacer(),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_down_rounded
                      : Icons.keyboard_arrow_right_rounded,
                  size: 16,
                  color: colors.text.muted,
                ),
              ],
            ),
          ),
        ),
        if (isExpanded) ...children,
        const Gap(4),
      ],
    );
  }
}

class _NavSubTile extends StatelessWidget {
  const _NavSubTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.color;

    return InkWell(
      onTap: onTap,
      hoverColor: colors.background.surface,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Row(
          children: [
            Icon(icon, size: 15, color: colors.text.muted),
            const Gap(10),
            Text(
              title,
              style: TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.w400,
                color: colors.text.defaultValue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserProfileTile extends StatelessWidget {
  const _UserProfileTile({
    required this.name,
    required this.role,
    required this.onSignOut,
  });

  final String name;
  final String role;
  final VoidCallback onSignOut;

  @override
  Widget build(BuildContext context) {
    final colors = context.color;
    final locale = context.locale;

    return PopupMenuButton<String>(
      color: colors.background.surface,
      offset: const Offset(0, -60),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: colors.border.defaultValue),
      ),
      onSelected: (value) {
        if (value == 'logout') {
          onSignOut();
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'profile',
          child: Row(
            children: [
              Icon(Icons.person_outline, size: 16, color: colors.text.muted),
              const Gap(8),
              Text(
                locale.accountSettings,
                style: TextStyle(
                  color: colors.text.defaultValue,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'logout',
          child: Row(
            children: [
              Icon(
                Icons.logout_rounded,
                size: 16,
                color: colors.primary.defaultValue,
              ),
              const Gap(8),
              Text(
                locale.signOut,
                style: TextStyle(
                  color: colors.primary.defaultValue,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    colors.primary.defaultValue,
                    colors.accent.purple,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border.all(
                  color: colors.border.defaultValue,
                  width: 1.5,
                ),
              ),
              child: const Center(
                child: Text(
                  '👨‍💻',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const Gap(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                      color: colors.text.defaultValue,
                    ),
                  ),
                  Text(
                    role,
                    style: TextStyle(
                      fontSize: 10.5,
                      color: colors.text.muted,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 16,
              color: colors.text.muted,
            ),
          ],
        ),
      ),
    );
  }
}


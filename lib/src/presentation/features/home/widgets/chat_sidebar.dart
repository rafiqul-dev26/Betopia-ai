import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../core/application_state/logout_provider/logout_provider.dart';
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

  final List<ChatHistoryItem> _historyItems = const [
    ChatHistoryItem(
      id: '1',
      title: 'How Solve a Critical TI',
      group: 'YESTERDAY',
    ),
    ChatHistoryItem(
      id: '2',
      title: 'Chat Gpt Like Applicat',
      group: 'YESTERDAY',
    ),
    ChatHistoryItem(
      id: '3',
      title: 'You Are an Autonomous',
      group: 'YESTERDAY',
    ),
    ChatHistoryItem(
      id: '4',
      title: 'Image Generate Where',
      group: 'YESTERDAY',
    ),
    ChatHistoryItem(
      id: '5',
      title: 'Quick Greeting',
      group: 'YESTERDAY',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      decoration: const BoxDecoration(
        color: Color(0xFF0C0D11),
        border: Border(
          right: BorderSide(color: Color(0xFF1E212B), width: 0.8),
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
                    icon: const Icon(
                      Icons.view_sidebar_outlined,
                      size: 19,
                      color: Color(0xFF9CA3AF),
                    ),
                    splashRadius: 18,
                    tooltip: 'Collapse sidebar',
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
                    color: const Color(0x1AFF640A),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0x4DFF640A),
                      width: 1,
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_circle_outline_rounded,
                        size: 16,
                        color: Color(0xFFFF640A),
                      ),
                      Gap(8),
                      Text(
                        'New Chat',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFF8B4A),
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    child: Text(
                      'CHAT HISTORY',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.7,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                  ),
                  const Gap(4),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    child: Text(
                      'YESTERDAY',
                      style: TextStyle(
                        fontSize: 9.5,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                        color: Color(0xFF4B5563),
                      ),
                    ),
                  ),
                  const Gap(2),
                  for (final item in _historyItems)
                    _HistoryTile(
                      item: item,
                      isSelected: widget.selectedChatId == item.id,
                      onTap: () => widget.onSelectChat?.call(item.id),
                    ),
                ],
              ),
            ),

            const Divider(color: Color(0xFF1E212B), height: 1),

            // Collapsible Workspace Section
            _CollapsibleGroup(
              title: 'WORKSPACE',
              isExpanded: _isWorkspaceExpanded,
              onToggle: () {
                setState(() => _isWorkspaceExpanded = !_isWorkspaceExpanded);
              },
              children: [
                _NavSubTile(
                  icon: Icons.build_outlined,
                  title: 'Tools',
                  onTap: () {},
                ),
                _NavSubTile(
                  icon: Icons.hub_outlined,
                  title: 'Connectors',
                  onTap: () {},
                ),
              ],
            ),

            const Divider(color: Color(0xFF1E212B), height: 1),

            // Collapsible Library Section
            _CollapsibleGroup(
              title: 'LIBRARY',
              isExpanded: _isLibraryExpanded,
              onToggle: () {
                setState(() => _isLibraryExpanded = !_isLibraryExpanded);
              },
              children: [
                _NavSubTile(
                  icon: Icons.library_books_outlined,
                  title: 'Asset Library',
                  onTap: () {},
                ),
                _NavSubTile(
                  icon: Icons.history_rounded,
                  title: 'Temporal Archive',
                  onTap: () {},
                ),
              ],
            ),

            const Divider(color: Color(0xFF1E212B), height: 1),

            // User Profile Section
            _UserProfileTile(
              name: 'Md rafiqul islam',
              role: 'standard',
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
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF1B1D25) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        dense: true,
        visualDensity: const VisualDensity(horizontal: -3, vertical: -3),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        leading: const Icon(
          Icons.chat_bubble_outline_rounded,
          size: 14,
          color: Color(0xFF6B7280),
        ),
        title: Text(
          item.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 12.5,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            color: isSelected
                ? const Color(0xFFF3F4F6)
                : const Color(0xFF9CA3AF),
          ),
        ),
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        hoverColor: const Color(0xFF161820),
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
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.7,
                    color: Color(0xFF6B7280),
                  ),
                ),
                const Spacer(),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_down_rounded
                      : Icons.keyboard_arrow_right_rounded,
                  size: 16,
                  color: const Color(0xFF6B7280),
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
    return InkWell(
      onTap: onTap,
      hoverColor: const Color(0xFF161820),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Row(
          children: [
            Icon(icon, size: 15, color: const Color(0xFF9CA3AF)),
            const Gap(10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.w400,
                color: Color(0xFFD1D5DB),
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
    return PopupMenuButton<String>(
      color: const Color(0xFF161820),
      offset: const Offset(0, -60),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Color(0xFF242732)),
      ),
      onSelected: (value) {
        if (value == 'logout') {
          onSignOut();
        }
      },
      itemBuilder: (context) => const [
        PopupMenuItem(
          value: 'profile',
          child: Row(
            children: [
              Icon(Icons.person_outline, size: 16, color: Color(0xFF9CA3AF)),
              Gap(8),
              Text(
                'Account Settings',
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'logout',
          child: Row(
            children: [
              Icon(Icons.logout_rounded, size: 16, color: Color(0xFFFF640A)),
              Gap(8),
              Text(
                'Sign Out',
                style: TextStyle(color: Color(0xFFFF8B4A), fontSize: 13),
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
                gradient: const LinearGradient(
                  colors: [Color(0xFFFF8B4A), Color(0xFFC084FC)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border.all(color: const Color(0xFF333746), width: 1.5),
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
                    style: const TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFE5E7EB),
                    ),
                  ),
                  Text(
                    role,
                    style: const TextStyle(
                      fontSize: 10.5,
                      color: Color(0xFF9CA3AF),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 16,
              color: Color(0xFF6B7280),
            ),
          ],
        ),
      ),
    );
  }
}

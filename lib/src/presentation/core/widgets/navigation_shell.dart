import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/extensions/localization.dart';
import '../theme/theme.dart';

class NavigationShell extends StatefulWidget {
  const NavigationShell({super.key, required this.statefulNavigationShell});

  final StatefulNavigationShell statefulNavigationShell;

  @override
  State<NavigationShell> createState() => _NavigationShellState();
}

class _NavigationShellState extends State<NavigationShell> {
  @override
  Widget build(BuildContext context) {
    final colors = context.color;

    return Scaffold(
      backgroundColor: colors.background.canvas,
      body: widget.statefulNavigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: colors.background.canvas,
          border: Border(
            top: BorderSide(color: colors.border.subtle, width: 0.8),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: colors.background.canvas,
          elevation: 0,
          currentIndex: widget.statefulNavigationShell.currentIndex,
          selectedItemColor: colors.primary.defaultValue,
          unselectedItemColor: colors.text.muted,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            widget.statefulNavigationShell.goBranch(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.chat_bubble_outline_rounded),
              activeIcon: const Icon(Icons.chat_bubble_rounded),
              label: context.locale.home,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person_outline_rounded),
              activeIcon: const Icon(Icons.person_rounded),
              label: context.locale.profile,
            ),
          ],
        ),
      ),
    );
  }
}


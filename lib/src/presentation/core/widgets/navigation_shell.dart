import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/extensions/localization.dart';

class NavigationShell extends StatefulWidget {
  const NavigationShell({super.key, required this.statefulNavigationShell});

  final StatefulNavigationShell statefulNavigationShell;

  @override
  State<NavigationShell> createState() => _NavigationShellState();
}

class _NavigationShellState extends State<NavigationShell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C0D11),
      body: widget.statefulNavigationShell,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF0C0D11),
          border: Border(
            top: BorderSide(color: Color(0xFF1E212B), width: 0.8),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color(0xFF0C0D11),
          elevation: 0,
          currentIndex: widget.statefulNavigationShell.currentIndex,
          selectedItemColor: const Color(0xFFFF640A),
          unselectedItemColor: const Color(0xFF6B7280),
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

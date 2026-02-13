import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../mobile_floating_nav.dart';
import '../premium_nav_bar.dart' show NavItem;
import '../premium_top_nav.dart';
import '../window_drag_area.dart';

class MainShellScaffold extends StatelessWidget {
  final bool isMobile;
  final bool usePremiumBackground;
  final int selectedIndex;
  final List<NavItem> navItems;
  final List<int> visibleIndices;
  final List<Widget> pages;
  final Animation<double> fadeAnimation;
  final ValueChanged<int> onItemTapped;
  final VoidCallback onRemoteControlTap;

  const MainShellScaffold({
    super.key,
    required this.isMobile,
    required this.usePremiumBackground,
    required this.selectedIndex,
    required this.navItems,
    required this.visibleIndices,
    required this.pages,
    required this.fadeAnimation,
    required this.onItemTapped,
    required this.onRemoteControlTap,
  });

  bool get _isIosLike => !kIsWeb && (Platform.isIOS || Platform.isMacOS);
  bool get _isWindows => !kIsWeb && Platform.isWindows;

  @override
  Widget build(BuildContext context) {
    if (_isIosLike) {
      return _buildIosShell(context);
    }
    if (_isWindows) {
      return _buildWindowsShell(context);
    }
    return _buildDefaultShell(context);
  }

  Widget _buildBody() {
    return SafeArea(
      child: FadeTransition(
        opacity: fadeAnimation,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 350),
          child: KeyedSubtree(
            key: ValueKey<int>(selectedIndex),
            child: pages[selectedIndex],
          ),
        ),
      ),
    );
  }

  Scaffold _buildIosShell(BuildContext context) {
    final currentNavIndex = visibleIndices.indexOf(selectedIndex);
    return Scaffold(
      backgroundColor:
          usePremiumBackground ? Colors.transparent : Theme.of(context).scaffoldBackgroundColor,
      appBar: isMobile
          ? null
          : AppBar(
              title: PremiumTopNav(
                currentIndex: currentNavIndex < 0 ? 0 : currentNavIndex,
                items: navItems,
                badges: List<int>.filled(navItems.length, 0),
                onTap: (relativeIndex) => onItemTapped(visibleIndices[relativeIndex]),
                haptics: true,
              ),
              automaticallyImplyLeading: false,
            ),
      body: Stack(
        children: [
          _buildBody(),
          if (isMobile)
            MobileFloatingNav(
              currentIndex: currentNavIndex < 0 ? 0 : currentNavIndex,
              items: [for (final n in navItems) MobileNavItem(n.icon, n.label)],
              onTap: (relativeIndex) => onItemTapped(visibleIndices[relativeIndex]),
              onRemoteControlTap: onRemoteControlTap,
            ),
        ],
      ),
    );
  }

  Scaffold _buildWindowsShell(BuildContext context) {
    final currentNavIndex = visibleIndices.indexOf(selectedIndex);
    return Scaffold(
      backgroundColor:
          usePremiumBackground ? Colors.transparent : Theme.of(context).scaffoldBackgroundColor,
      appBar: isMobile
          ? null
          : AppBar(
              title: WindowDragArea(
                child: PremiumTopNav(
                  currentIndex: currentNavIndex < 0 ? 0 : currentNavIndex,
                  items: navItems,
                  badges: List<int>.filled(navItems.length, 0),
                  onTap: (relativeIndex) => onItemTapped(visibleIndices[relativeIndex]),
                  haptics: false,
                ),
              ),
              automaticallyImplyLeading: false,
            ),
      body: Stack(
        children: [
          _buildBody(),
          if (isMobile)
            MobileFloatingNav(
              currentIndex: currentNavIndex < 0 ? 0 : currentNavIndex,
              items: [for (final n in navItems) MobileNavItem(n.icon, n.label)],
              onTap: (relativeIndex) => onItemTapped(visibleIndices[relativeIndex]),
              onRemoteControlTap: onRemoteControlTap,
            ),
        ],
      ),
    );
  }

  Scaffold _buildDefaultShell(BuildContext context) => _buildWindowsShell(context);
}

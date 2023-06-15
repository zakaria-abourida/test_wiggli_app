import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:test_wiggli_app/widgets/shared/bottom_navigation_bar.dart/bottom_navigation_bar_widget.dart';

class TabNavigationPage extends StatefulWidget {
  const TabNavigationPage(this.navigationShell, {super.key});

  final StatefulNavigationShell navigationShell;

  @override
  State<TabNavigationPage> createState() => _TabNavigationPageState();
}

class _TabNavigationPageState extends State<TabNavigationPage>
    with SingleTickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widget.navigationShell,
        bottomNavigationBar: BottomNavigationBarWidget(
          controller: controller,
          onTap: _onTap,
        ));
  }

  void _onTap(index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }
}

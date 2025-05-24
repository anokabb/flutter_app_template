import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/extensions/context_extension.dart';
import 'package:flutter_app_template/src/core/gen/assets.gen.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AppShell extends StatefulWidget {
  const AppShell({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> with SingleTickerProviderStateMixin {
  late final TabController controller = TabController(
    length: 3,
    vsync: this,
    initialIndex: widget.navigationShell.currentIndex,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.index = widget.navigationShell.currentIndex;
    return Scaffold(
      body: widget.navigationShell,
      backgroundColor: context.theme.appColors.background,
      bottomNavigationBar: Theme(
        data: context.theme.copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          selectedItemColor: context.theme.appColors.primary,
          currentIndex: widget.navigationShell.currentIndex,
          selectedLabelStyle: context.theme.appTextTheme.body3.copyWith(fontSize: 10),
          unselectedLabelStyle: context.theme.appTextTheme.body3.copyWith(fontSize: 10),
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          onTap: _onTap,
          items: [
            BottomNavigationBarItem(
              label: context.localization.home,
              icon: NavigationBarIcon(Assets.svg.tabHome),
              tooltip: '',
            ),
            BottomNavigationBarItem(
              label: context.localization.home,
              icon: NavigationBarIcon(Assets.svg.tabHome),
              tooltip: '',
            ),
            BottomNavigationBarItem(
              label: context.localization.home,
              icon: NavigationBarIcon(Assets.svg.tabHome),
              tooltip: '',
            ),
          ],
        ),
      ),
    );
  }

  void _onTap(int index) {
    widget.navigationShell.goBranch(index);
  }
}

class NavigationBarIcon extends StatelessWidget {
  final String svgAsset;

  const NavigationBarIcon(
    this.svgAsset, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final color = IconTheme.of(context).color;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SvgPicture.asset(
        svgAsset,
        colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      ),
    );
  }
}

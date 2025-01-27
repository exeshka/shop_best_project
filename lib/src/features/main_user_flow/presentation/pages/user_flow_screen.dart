import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_best_project/gen/assets.gen.dart';
import 'package:shop_best_project/src/core/theme/theme.dart';

class UserFlowScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const UserFlowScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: navigationShell,
      bottomNavigationBar: CupertinoTabBar(
        onTap: (value) {
          navigationShell.goBranch(value, initialLocation: true);
        },
        backgroundColor: context.onBgColor,
        currentIndex: navigationShell.currentIndex,
        activeColor: context.appTheme.primaryColor,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.svg.ciHouse01,
                colorFilter: ColorFilter.mode(
                    context.appTheme.inActiveIconsColor, BlendMode.srcIn),
              ),
              activeIcon: SvgPicture.asset(
                Assets.svg.ciHouse01,
                colorFilter: ColorFilter.mode(
                    context.appTheme.appBarIconsColor, BlendMode.srcIn),
              )),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.svg.ciChatConversationCircle,
                colorFilter: ColorFilter.mode(
                    context.appTheme.inActiveIconsColor, BlendMode.srcIn),
              ),
              activeIcon: SvgPicture.asset(
                Assets.svg.ciChatConversationCircle,
                colorFilter: ColorFilter.mode(
                    context.appTheme.appBarIconsColor, BlendMode.srcIn),
              )),
        ],
      ),
    );
  }
}

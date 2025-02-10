import 'dart:math';
import 'dart:ui';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:blurhash_ffi/blurhashffi_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_best_project/gen/assets.gen.dart';
import 'package:shop_best_project/src/core/bloc/user/user_bloc.dart';
import 'package:shop_best_project/src/core/extension/extension.dart';
import 'package:shop_best_project/src/core/theme/other_constants.dart';
import 'package:shop_best_project/src/core/theme/theme.dart';
import 'package:shop_best_project/src/core/widgets/custom_sliver_appbar.dart';
import 'package:shop_best_project/src/core/widgets/image_widget.dart';
import 'package:shop_best_project/src/features/main_user_flow/features/settings/presentation/pages/settings_screen.dart';

class UserScreen extends StatefulWidget {
  static const String path = '/user';
  static const String name = 'user';
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late Animation<double> _appbarSize;
  late AnimationController _appbarSizeController;

  bool _appBarIsExpanded = true;

  static const expandedDefaultHeight = kToolbarHeight + 250;
  static const expandedMaxHeight = kToolbarHeight + 400;
  static const collapsedHeight = kToolbarHeight + 44;

  @override
  void initState() {
    _appbarSizeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300), // Более плавная анимация
    );

    _appbarSize = Tween<double>(
      begin: expandedMaxHeight,
      end: expandedDefaultHeight,
    ).animate(CurvedAnimation(
      parent: _appbarSizeController,
      curve: Curves.easeInOut,
    ));

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        _scrollController.position.isScrollingNotifier.addListener(
          () {
            _onScrollEnd();
          },
        );
      },
    );

    super.initState();
  }

  void _onScrollEnd() {
    if (!_scrollController.position.isScrollingNotifier.value) {
      _handleSnapScroll();
    }
  }

  void _handleSnapScroll() {
    double offset = _scrollController.offset;

    // Задаем пороговое значение для диапазона
    double snapThreshold = (_appbarSize.value - collapsedHeight) / 2;

    // Если скролл выше минимального значения, остаемся развернутыми
    if (offset < snapThreshold) {
      _animateScrollTo(0.0); // Раскрыть шапку
    }
    // Если скролл выходит за диапазон, сворачиваем
    else if (offset >= snapThreshold &&
        offset < (expandedDefaultHeight - collapsedHeight)) {
      _animateScrollTo(expandedDefaultHeight - collapsedHeight);
    }
  }

  void _animateScrollTo(double offset) {
    Future.microtask(
      () {
        _scrollController.animateTo(
          offset,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      },
    );
  }

  void _updateAppBarHeight({required bool stretch}) {
    if (_appBarIsExpanded == stretch)
      return; // Если состояние не меняется, ничего не делать.

    _appBarIsExpanded = stretch;

    if (stretch) {
      _appbarSizeController.reverse(); // Увеличение высоты
    } else {
      _appbarSizeController.forward(); // Уменьшение высоты
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        controller: _scrollController,
        slivers: [
          AnimatedBuilder(
            animation: _appbarSize,
            builder: (context, child) => SliverPersistentHeader(
                pinned: true,
                delegate: CustomSliverAppBar.transitionAnimation(
                  maxExtent: _appbarSize.value,
                  minExtent: collapsedHeight,
                  stretchConfiguration: OverScrollHeaderStretchConfiguration(
                    onStretchTrigger: () async =>
                        _updateAppBarHeight(stretch: true),
                  ),
                  builder: (context, shrinkOffset, maxExtent, minExtent) {
                    if (shrinkOffset > 1 && _appBarIsExpanded) {
                      _updateAppBarHeight(stretch: false);
                    }

                    return BlocBuilder<UserBloc, UserState>(
                      builder: (context, userState) {
                        return Material(
                          color: Colors.transparent,
                          child: AnimatedContainer(
                            duration: duration,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                if (userState is UserStateSuccess)
                                  Positioned.fill(
                                      child: AnimatedOpacity(
                                    duration: duration,
                                    opacity: shrinkOffset > 150 ? 0 : 1,
                                    child: ImageWidget(
                                        image: userState.userModel.image),
                                  )),

                                Positioned.fill(
                                    child: ClipRect(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: sigmaX,
                                      sigmaY: sigmaX,
                                    ),
                                    child: Container(
                                      color: context.onBgColor,
                                    ),
                                  ),
                                )),

                                //TODO: Сделать подложку эмодзи как в телеграмме

                                // Positioned.fill(
                                //     child: Center(
                                //         child: CenterAttractionGrid(
                                //   offset: shrinkOffset,
                                //   columns: 5,
                                //   rows: 3,
                                //   key: GlobalKey(),
                                // ))),

                                if (userState is UserStateSuccess)
                                  AnimatedPositioned(
                                    duration: duration,
                                    bottom: _appBarIsExpanded
                                        ? 0
                                        : shrinkOffset > 60
                                            ? 82 + shrinkOffset
                                            : 82,
                                    left: 0,
                                    right: 0,
                                    top: _appBarIsExpanded ? 0 : null,
                                    child: Center(
                                      child: AnimatedContainer(
                                        clipBehavior: Clip.hardEdge,
                                        duration: duration,
                                        height: _appBarIsExpanded ? null : 100,
                                        width: _appBarIsExpanded ? null : 100,
                                        decoration: BoxDecoration(
                                          color: context.appTheme.bgColor,
                                          borderRadius: BorderRadius.circular(
                                              _appBarIsExpanded ? 0 : 100),
                                        ),
                                        child: SizedBox(
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: ImageWidget(
                                              image: userState.userModel.image),
                                        ),
                                      ),
                                    ),
                                  ),

                                if (userState is UserStateSuccess)
                                  AnimatedPositioned(
                                      duration: duration,
                                      bottom: shrinkOffset > 60
                                          ? (collapsedHeight / 2) -
                                              kToolbarHeight +
                                              22
                                          : 42,
                                      left: 16,
                                      right: 16,
                                      child: AnimatedAlign(
                                          duration: duration,
                                          alignment: _appBarIsExpanded
                                              ? Alignment.centerLeft
                                              : Alignment.center,
                                          child: Text(
                                            userState.userModel.userName,
                                            style: context.semiBold16,
                                          ))),

                                if (userState is UserStateSuccess)
                                  AnimatedPositioned(
                                      duration: duration,
                                      bottom: shrinkOffset > 60
                                          ? kToolbarHeight / 2
                                          : 16,
                                      left: 16,
                                      right: 16,
                                      child: AnimatedOpacity(
                                        duration: duration,
                                        opacity: shrinkOffset > 60 ? 0 : 1,
                                        child: AnimatedAlign(
                                            duration: duration,
                                            alignment: _appBarIsExpanded
                                                ? Alignment.centerLeft
                                                : Alignment.center,
                                            child: Text(
                                              userState.userModel.email,
                                              style: context.meduim14,
                                            )),
                                      )),

                                AnimatedPositioned(
                                    duration: duration,
                                    top: (collapsedHeight / 2),
                                    left: shrinkOffset > 100 ? 0 : 12,
                                    child: CupertinoButton(
                                      padding: EdgeInsets.all(4),
                                      child: AnimatedContainer(
                                        duration: duration,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: !_appBarIsExpanded
                                                ? Colors.transparent
                                                : context.onBgColor),
                                        child: Padding(
                                          padding: EdgeInsets.all(
                                              shrinkOffset > 100 ? 0 : 8),
                                          child: Icon(
                                            Icons.arrow_back_ios_new_rounded,
                                            color: shrinkOffset > 100
                                                ? context.appTheme.primaryColor
                                                : context.appBarIconsColor,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        GoRouter.of(context).pop();
                                      },
                                    )),

                                // if (userState is UserStateSuccess)
                                //   Positioned.fill(
                                //     child: Align(
                                //         alignment:
                                //             Alignment(0, -shrinkOffset * 0.001),
                                //         child: Text(
                                //           userState.userModel.userName,
                                //           style: context.semiBold16,
                                //         )),
                                //   ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                )),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 16),
            sliver: SliverList(
                delegate: SliverChildListDelegate([
              SettingsGroupWidget(
                children: [
                  SettingsTileWidget(
                    onTap: () {
                      GoRouter.of(context).pushNamed(SettingsScreen.name);
                    },
                    icon: SvgPicture.asset(Assets.svg.ciSettings),
                    iconColor: Colors.red,
                    title: context.s.settings,
                  ),
                  SettingsTileWidget(
                    onTap: () {},
                    icon: Icon(Icons.settings_accessibility_sharp),
                    iconColor: Colors.blue,
                    title: context.s.settings,
                  ),
                  SettingsTileWidget(
                    onTap: () {},
                    icon: Icon(Icons.settings_accessibility_sharp),
                    iconColor: Colors.green,
                    title: context.s.settings,
                  ),
                ],
              ),
              SettingsGroupWidget(
                children: [
                  SettingsTileWidget(
                    onTap: () {
                      GoRouter.of(context).pushNamed(SettingsScreen.name);
                    },
                    icon: SvgPicture.asset(Assets.svg.ciSettings),
                    iconColor: Colors.red,
                    title: context.s.settings,
                  ),
                  SettingsTileWidget(
                    onTap: () {},
                    icon: Icon(Icons.settings_accessibility_sharp),
                    iconColor: Colors.blue,
                    title: context.s.settings,
                  ),
                  SettingsTileWidget(
                    onTap: () {},
                    icon: Icon(Icons.settings_accessibility_sharp),
                    iconColor: Colors.green,
                    title: context.s.settings,
                  ),
                ],
              ),
              SettingsGroupWidget(
                children: [
                  SettingsTileWidget(
                    onTap: () {
                      GoRouter.of(context).pushNamed(SettingsScreen.name);
                    },
                    icon: SvgPicture.asset(Assets.svg.ciSettings),
                    iconColor: Colors.red,
                    title: context.s.settings,
                  ),
                  SettingsTileWidget(
                    onTap: () {},
                    icon: Icon(Icons.settings_accessibility_sharp),
                    iconColor: Colors.blue,
                    title: context.s.settings,
                  ),
                  SettingsTileWidget(
                    onTap: () {},
                    icon: Icon(Icons.settings_accessibility_sharp),
                    iconColor: Colors.green,
                    title: context.s.settings,
                  ),
                ],
              )
            ])),
          )
        ],
      ),
    );
  }
}

class SettingsTileWidget extends StatelessWidget {
  final String title;

  final Widget icon;
  final bool? isRadio;
  final bool? isActive;
  final Color? iconColor;

  final void Function() onTap;

  const SettingsTileWidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap,
      this.isRadio = false,
      this.isActive = false,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.listTileColor,
      child: GestureDetector(
        onTap: () => onTap(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 6,
          ),
          child: Material(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    16.widthBox,
                    Container(
                      decoration: BoxDecoration(
                          color: iconColor,
                          borderRadius: BorderRadius.circular(12)),
                      height: 35,
                      width: 35,
                      padding: EdgeInsets.all(6),
                      child: icon,
                    ),
                    16.widthBox,
                    Text(
                      title,
                      style: context.semiBold16,
                    ),
                  ],
                ),
                Row(
                  children: [
                    isRadio!
                        ? Container(
                            width: 40,
                            height: 40,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                // color: context.onBgColor,
                                shape: BoxShape.circle),
                            padding: EdgeInsets.all(11),
                            child: Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  color: isActive!
                                      ? context.appTheme.primaryColor
                                      : context.onBgColor,
                                  shape: BoxShape.circle),
                            ),
                          )
                        : Icon(Icons.chevron_right_rounded),
                    8.widthBox,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SettingsGroupWidget extends StatelessWidget {
  final List<Widget> children;
  const SettingsGroupWidget({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(
                    alpha: 0.05,
                  ),
                  blurRadius: 10,
                )
              ]),
          child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 2),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              primary: false,
              itemBuilder: (context, index) {
                return children[index];
              },
              separatorBuilder: (context, index) => Container(
                    height: 4,
                    color: context.bgColor,
                  ),
              itemCount: children.length)),
    );
  }
}

import 'dart:ui';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_best_project/src/core/extension/extension.dart';
import 'package:shop_best_project/src/core/theme/bloc/theme_bloc.dart';
import 'package:shop_best_project/src/core/theme/other_constants.dart';
import 'package:shop_best_project/src/core/theme/theme.dart';
import 'package:shop_best_project/src/core/widgets/custom_sliver_appbar.dart';
import 'package:shop_best_project/src/features/main_user_flow/features/user/presentation/pages/user_screen.dart';

class SettingsScreen extends StatelessWidget {
  static const path = "settings";
  static const name = "settings";
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
              pinned: true,
              delegate: CustomSliverAppBar.transitionAnimation(
                maxExtent: kToolbarHeight + 44,
                minExtent: kToolbarHeight + 44,
                stretchConfiguration: OverScrollHeaderStretchConfiguration(),
                builder: (context, shrinkOffset, maxExtent, minExtent) {
                  return Material(
                    color: Colors.transparent,
                    child: Container(
                      // color: context.appbarColor,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Positioned.fill(
                              child: ClipRect(
                                  child: BackdropFilter(
                            filter: ImageFilter.blur(
                                sigmaX: sigmaX, sigmaY: sigmaY),
                            child: Container(),
                          ))),
                          Positioned(
                              top: kToolbarHeight,
                              child: SizedBox(
                                height: 40,
                                width: 40,
                                child: BackButton(
                                  color: context.appTheme.primaryColor,
                                ),
                              )),
                          Positioned(
                            bottom: 11,
                            left: 16,
                            right: 16,
                            child: SizedBox(
                              width: context.mqWidth - 32 - 40 - 16 - 80,
                              child: Center(
                                  child: Text(
                                context.s.settings,
                                style: context.meduim16,
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )),
          SliverList(
              delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(context.s.app_theme),
              ),
              ThemeModeWidget(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(context.s.language),
              ),
            ],
          ))
        ],
      ),
    );
  }
}

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ThemeModeWidget extends StatelessWidget {
  const ThemeModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return SettingsGroupWidget(children: [
              SettingsTileWidget(
                isRadio: true,
                isActive: state.themeMode == ThemeMode.system,
                title: context.s.system_theme,
                icon: Icon(Icons.system_update),
                onTap: () {
                  BlocProvider.of<ThemeBloc>(context).add(ChangeTheme(
                    themeMode: ThemeMode.system,
                  ));
                },
              ),
              SettingsTileWidget(
                isRadio: true,
                isActive: state.themeMode == ThemeMode.dark,
                title: context.s.dark_theme,
                icon: Icon(Icons.system_update),
                onTap: () {
                  BlocProvider.of<ThemeBloc>(context).add(ChangeTheme(
                    themeMode: ThemeMode.dark,
                  ));
                },
              ),
              SettingsTileWidget(
                isRadio: true,
                isActive: state.themeMode == ThemeMode.light,
                title: context.s.light_theme,
                icon: Icon(Icons.system_update),
                onTap: () {
                  BlocProvider.of<ThemeBloc>(context).add(ChangeTheme(
                    themeMode: ThemeMode.light,
                  ));
                },
              ),
            ]);
          },
        )
      ],
    );
  }
}

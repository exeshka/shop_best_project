import 'package:flutter/material.dart';
import 'package:shop_best_project/src/core/theme/color_constants.dart';
import 'package:shop_best_project/src/core/theme/style_constants.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'theme.tailor.dart';

@TailorMixin()
class AppTheme extends ThemeExtension<AppTheme> with _$AppThemeTailorMixin {
  AppTheme(
      {required this.bgColor,
      required this.appBarIconsColor,
      required this.onBgColor,
      required this.primaryColor,
      required this.mainTextColor,
      required this.inputBgColor,
      required this.inActiveIconsColor,
      required this.secondTextColor,
      required this.semiBold22,
      required this.semiBold16,
      required this.meduim16,
      required this.meduim14,
      required this.regular16,
      required this.regular12,
      required this.appbarColor,
      required this.appBarOpenedTextColor,
      required this.regular10,
      required this.listTileColor});

  //
  final Color bgColor;
  final Color appBarIconsColor;
  final Color inActiveIconsColor;
  final Color onBgColor;
  final Color primaryColor;
  final Color mainTextColor;
  final Color inputBgColor;
  final Color secondTextColor;

  final Color listTileColor;

  //
  final TextStyle semiBold22;
  final TextStyle semiBold16;
  final TextStyle meduim16;
  final TextStyle meduim14;
  final TextStyle regular16;
  final TextStyle regular12;
  final TextStyle regular10;

  final Color appbarColor;

  final Color appBarOpenedTextColor;

  //dark theme
  factory AppTheme.darkTheme({Color? primaryColor}) {
    return AppTheme(
      appBarOpenedTextColor: Colors.white,
      appbarColor: DarkColorConstants.appBarColor,
      listTileColor: DarkColorConstants.listTileColor,
      inActiveIconsColor: DarkColorConstants.inActiveIconsColor,
      bgColor: DarkColorConstants.bgColor,
      appBarIconsColor: DarkColorConstants.appBarIconsColor,
      onBgColor: DarkColorConstants.onBgColor,
      primaryColor: primaryColor ?? DarkColorConstants.primaryColor,
      mainTextColor: DarkColorConstants.mainTextColor,
      inputBgColor: DarkColorConstants.inputBgColor,
      secondTextColor: DarkColorConstants.secondTextColor,
      semiBold22: StyleConstants.semiBold22
          .copyWith(color: DarkColorConstants.mainTextColor),
      semiBold16: StyleConstants.semiBold16
          .copyWith(color: DarkColorConstants.mainTextColor),
      meduim16: StyleConstants.medium16
          .copyWith(color: DarkColorConstants.mainTextColor),
      meduim14: StyleConstants.medium14
          .copyWith(color: DarkColorConstants.secondTextColor),
      regular16: StyleConstants.regular16
          .copyWith(color: DarkColorConstants.mainTextColor),
      regular12: StyleConstants.regular12
          .copyWith(color: DarkColorConstants.mainTextColor),
      regular10: StyleConstants.regular10
          .copyWith(color: DarkColorConstants.mainTextColor),
    );
  }

  // light theme
  static AppTheme get lightTheme => AppTheme(
        appBarOpenedTextColor: Colors.white,
        appbarColor: LightColorConstants.appBarColor,
        listTileColor: LightColorConstants.listTileColor,
        inActiveIconsColor: LightColorConstants.inActiveIconsColor,
        bgColor: LightColorConstants.bgColor,
        appBarIconsColor: LightColorConstants.appBarIconsColor,
        onBgColor: LightColorConstants.onBgColor,
        primaryColor: LightColorConstants.primaryColor,
        mainTextColor: LightColorConstants.mainTextColor,
        inputBgColor: LightColorConstants.inputBgColor,
        secondTextColor: LightColorConstants.secondTextColor,
        semiBold22: StyleConstants.semiBold22
            .copyWith(color: LightColorConstants.mainTextColor),
        semiBold16: StyleConstants.semiBold16
            .copyWith(color: LightColorConstants.mainTextColor),
        meduim16: StyleConstants.medium16
            .copyWith(color: LightColorConstants.mainTextColor),
        meduim14: StyleConstants.medium14
            .copyWith(color: LightColorConstants.secondTextColor),
        regular16: StyleConstants.regular16
            .copyWith(color: LightColorConstants.mainTextColor),
        regular12: StyleConstants.regular12
            .copyWith(color: LightColorConstants.mainTextColor),
        regular10: StyleConstants.regular10
            .copyWith(color: LightColorConstants.mainTextColor),
      );

  static ThemeData get defaultDark => ThemeData(
        colorScheme: ColorScheme.dark(
          primary: AppTheme.darkTheme().primaryColor,
          surface: AppTheme.darkTheme().bgColor,
        ),
        extensions: [AppTheme.darkTheme()],
        useMaterial3: true,
      );

  static ThemeData get defaultLight => ThemeData(
        colorScheme: ColorScheme.light(
          primary: AppTheme.lightTheme.primaryColor,
          surface: AppTheme.lightTheme.bgColor,
        ),
        extensions: [AppTheme.lightTheme],
        useMaterial3: true,
      );
}

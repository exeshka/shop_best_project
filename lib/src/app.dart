import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shop_best_project/generated/l10n.dart';
import 'package:shop_best_project/src/core/router/router.dart';
import 'package:shop_best_project/src/core/theme/bloc/theme_bloc.dart';
import 'package:shop_best_project/src/core/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeMode>(
      builder: (context, themeState) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lighthemeData,
          darkTheme: AppTheme.darkThemeData,
          themeMode: ThemeMode.dark,
          supportedLocales: S.delegate.supportedLocales,
          locale: S.delegate.supportedLocales.first,
          routerConfig: router,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        );
      },
    );
  }
}

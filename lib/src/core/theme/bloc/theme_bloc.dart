import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shop_best_project/src/core/theme/theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(
          themeMode: ThemeMode.dark,
        )) {
    on<GetThemeMode>((event, emit) {
      emit(ThemeState(
        themeMode: ThemeMode.system,
      ));
    });

    on<ChangeTheme>((event, emit) {
      emit(ThemeState(
        themeMode: event.themeMode,
      ));
    });
  }
}

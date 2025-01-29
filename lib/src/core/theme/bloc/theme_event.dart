part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

final class GetThemeMode extends ThemeEvent {}

final class ChangeTheme extends ThemeEvent {
  final ThemeMode themeMode;

  const ChangeTheme({
    required this.themeMode,
  });

  @override
  List<Object> get props => [
        themeMode,
      ];
}

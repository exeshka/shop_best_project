// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Профиль`
  String get profile {
    return Intl.message(
      'Профиль',
      name: 'profile',
      desc: 'Label for the user\'s profile section',
      args: [],
    );
  }

  /// `Поиск`
  String get search {
    return Intl.message(
      'Поиск',
      name: 'search',
      desc: 'Label for the search functionality',
      args: [],
    );
  }

  /// `Не авторизован`
  String get unauthorized {
    return Intl.message(
      'Не авторизован',
      name: 'unauthorized',
      desc: 'Message displayed when the user is not authorized',
      args: [],
    );
  }

  /// `Требуется авторизация`
  String get authorization_required {
    return Intl.message(
      'Требуется авторизация',
      name: 'authorization_required',
      desc: 'Message displayed when authorization is needed',
      args: [],
    );
  }

  /// `Войти`
  String get login {
    return Intl.message(
      'Войти',
      name: 'login',
      desc: 'Button label for login',
      args: [],
    );
  }

  /// `Продолжить`
  String get continue_word {
    return Intl.message(
      'Продолжить',
      name: 'continue_word',
      desc: 'Button label for continuing an action',
      args: [],
    );
  }

  /// `Окей`
  String get ok {
    return Intl.message(
      'Окей',
      name: 'ok',
      desc: 'Button label for confirmation',
      args: [],
    );
  }

  /// `Далее`
  String get next {
    return Intl.message(
      'Далее',
      name: 'next',
      desc: 'Button label for moving to the next step',
      args: [],
    );
  }

  /// `Хорошо`
  String get good {
    return Intl.message(
      'Хорошо',
      name: 'good',
      desc: 'General positive confirmation message',
      args: [],
    );
  }

  /// `Успешно зарегистрирован`
  String get successfully_registered {
    return Intl.message(
      'Успешно зарегистрирован',
      name: 'successfully_registered',
      desc: 'Message displayed after successful registration',
      args: [],
    );
  }

  /// `Произошла ошибка авторизации, код ошибки {code}`
  String authorization_error(Object code) {
    return Intl.message(
      'Произошла ошибка авторизации, код ошибки $code',
      name: 'authorization_error',
      desc:
          'Message displayed when an authorization error occurs. Includes error code.',
      args: [code],
    );
  }

  /// `Настройки`
  String get settings {
    return Intl.message(
      'Настройки',
      name: 'settings',
      desc: 'Label for the settings section',
      args: [],
    );
  }

  /// `Уведомления`
  String get notifications {
    return Intl.message(
      'Уведомления',
      name: 'notifications',
      desc: 'Label for the notifications section',
      args: [],
    );
  }

  /// `Сменить аккаунт`
  String get switch_account {
    return Intl.message(
      'Сменить аккаунт',
      name: 'switch_account',
      desc: 'Button label for switching accounts',
      args: [],
    );
  }

  /// `Добавить аккаунт`
  String get add_account {
    return Intl.message(
      'Добавить аккаунт',
      name: 'add_account',
      desc: 'Button label for adding a new account',
      args: [],
    );
  }

  /// `Темная тема`
  String get dark_theme {
    return Intl.message(
      'Темная тема',
      name: 'dark_theme',
      desc: 'Label for dark theme option',
      args: [],
    );
  }

  /// `Системная тема`
  String get system_theme {
    return Intl.message(
      'Системная тема',
      name: 'system_theme',
      desc: 'Label for system theme option',
      args: [],
    );
  }

  /// `Светлая тема`
  String get light_theme {
    return Intl.message(
      'Светлая тема',
      name: 'light_theme',
      desc: 'Label for light theme option',
      args: [],
    );
  }

  /// `Цветовой акцент`
  String get accent_color {
    return Intl.message(
      'Цветовой акцент',
      name: 'accent_color',
      desc: 'Label for accent color option',
      args: [],
    );
  }

  /// `Выбрать`
  String get select {
    return Intl.message(
      'Выбрать',
      name: 'select',
      desc: 'Button label for selection action',
      args: [],
    );
  }

  /// `Язык`
  String get language {
    return Intl.message(
      'Язык',
      name: 'language',
      desc: 'Label for language selection option',
      args: [],
    );
  }

  /// `Е-мейл`
  String get email {
    return Intl.message(
      'Е-мейл',
      name: 'email',
      desc: 'Label for email input field',
      args: [],
    );
  }

  /// `Имя`
  String get first_name {
    return Intl.message(
      'Имя',
      name: 'first_name',
      desc: 'Label for first name input field',
      args: [],
    );
  }

  /// `Фамилия`
  String get last_name {
    return Intl.message(
      'Фамилия',
      name: 'last_name',
      desc: 'Label for last name input field',
      args: [],
    );
  }

  /// `Фото профиля`
  String get profile_photo {
    return Intl.message(
      'Фото профиля',
      name: 'profile_photo',
      desc: 'Label for profile photo option',
      args: [],
    );
  }

  /// `Войти с помощью Apple`
  String get login_with_apple {
    return Intl.message(
      'Войти с помощью Apple',
      name: 'login_with_apple',
      desc: 'Button label for logging in with Apple',
      args: [],
    );
  }

  /// `Войти с помощью Google`
  String get login_with_google {
    return Intl.message(
      'Войти с помощью Google',
      name: 'login_with_google',
      desc: 'Button label for logging in with Google',
      args: [],
    );
  }

  /// `Введите корректный email`
  String get enter_valid_email {
    return Intl.message(
      'Введите корректный email',
      name: 'enter_valid_email',
      desc: 'Error message for invalid email input',
      args: [],
    );
  }

  /// `На почту {email} был отправлен код подтверждения`
  String confirmation_code_sent(String email) {
    return Intl.message(
      'На почту $email был отправлен код подтверждения',
      name: 'confirmation_code_sent',
      desc: 'Message displayed when a confirmation code is sent to the email',
      args: [email],
    );
  }

  /// `Повторить попытку`
  String get retry {
    return Intl.message(
      'Повторить попытку',
      name: 'retry',
      desc: 'Button label for retrying an action',
      args: [],
    );
  }

  /// `Слишком много запросов, пожалуйста попробуйте через {time}`
  String too_many_requests(String time) {
    return Intl.message(
      'Слишком много запросов, пожалуйста попробуйте через $time',
      name: 'too_many_requests',
      desc: 'Message displayed when there are too many requests',
      args: [time],
    );
  }

  /// `Тема приложения`
  String get app_theme {
    return Intl.message(
      'Тема приложения',
      name: 'app_theme',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

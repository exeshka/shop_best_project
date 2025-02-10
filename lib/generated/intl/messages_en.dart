// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(code) => "Произошла ошибка авторизации, код ошибки ${code}";

  static String m1(email) =>
      "На почту ${email} был отправлен код подтверждения";

  static String m2(time) =>
      "Слишком много запросов, пожалуйста попробуйте через ${time}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accent_color": MessageLookupByLibrary.simpleMessage("Цветовой акцент"),
        "add_account": MessageLookupByLibrary.simpleMessage("Добавить аккаунт"),
        "app_theme": MessageLookupByLibrary.simpleMessage("Тема приложения"),
        "authorization_error": m0,
        "authorization_required":
            MessageLookupByLibrary.simpleMessage("Требуется авторизация"),
        "confirmation_code_sent": m1,
        "continue_word": MessageLookupByLibrary.simpleMessage("Продолжить"),
        "dark_theme": MessageLookupByLibrary.simpleMessage("Темная тема"),
        "email": MessageLookupByLibrary.simpleMessage("Е-мейл"),
        "enter_valid_email":
            MessageLookupByLibrary.simpleMessage("Введите корректный email"),
        "first_name": MessageLookupByLibrary.simpleMessage("Имя"),
        "good": MessageLookupByLibrary.simpleMessage("Хорошо"),
        "language": MessageLookupByLibrary.simpleMessage("Язык"),
        "last_name": MessageLookupByLibrary.simpleMessage("Фамилия"),
        "light_theme": MessageLookupByLibrary.simpleMessage("Светлая тема"),
        "login": MessageLookupByLibrary.simpleMessage("Войти"),
        "login_with_apple":
            MessageLookupByLibrary.simpleMessage("Войти с помощью Apple"),
        "login_with_google":
            MessageLookupByLibrary.simpleMessage("Войти с помощью Google"),
        "next": MessageLookupByLibrary.simpleMessage("Далее"),
        "notifications": MessageLookupByLibrary.simpleMessage("Уведомления"),
        "ok": MessageLookupByLibrary.simpleMessage("Окей"),
        "profile": MessageLookupByLibrary.simpleMessage("Профиль"),
        "profile_photo": MessageLookupByLibrary.simpleMessage("Фото профиля"),
        "retry": MessageLookupByLibrary.simpleMessage("Повторить попытку"),
        "search": MessageLookupByLibrary.simpleMessage("Поиск"),
        "select": MessageLookupByLibrary.simpleMessage("Выбрать"),
        "settings": MessageLookupByLibrary.simpleMessage("Настройки"),
        "successfully_registered":
            MessageLookupByLibrary.simpleMessage("Успешно зарегистрирован"),
        "switch_account":
            MessageLookupByLibrary.simpleMessage("Сменить аккаунт"),
        "system_theme": MessageLookupByLibrary.simpleMessage("Системная тема"),
        "too_many_requests": m2,
        "unauthorized": MessageLookupByLibrary.simpleMessage("Не авторизован")
      };
}

//GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Internationalization
// **************************************************************************

import 'package:flutter/widgets.dart';
import 'package:internationalization/internationalization.dart';

class Intl {
  static String get stringsPath => "assets/translations/";
  static List<Locale> get suportedLocales => [
    Locale('pt', 'BR'),
    Locale('en', 'US'),
  ];
  static List<String> get files => [
    "login"
  ];

  static _Login get login => const _Login();
}

class _Login {
  const _Login();

  String txfdUserLabel({int pluralValue, List<String> args, Map<String, dynamic> namedArgs}) 
  => "txfd_user_label".translate(pluralValue: pluralValue, args: args, namedArgs: namedArgs);
  String txfdUserPass({int pluralValue, List<String> args, Map<String, dynamic> namedArgs}) 
  => "txfd_user_pass".translate(pluralValue: pluralValue, args: args, namedArgs: namedArgs);
  String btnLogin({int pluralValue, List<String> args, Map<String, dynamic> namedArgs}) 
  => "btn_login".translate(pluralValue: pluralValue, args: args, namedArgs: namedArgs);
}


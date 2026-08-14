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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `This field is required`
  String get error_field_required {
    return Intl.message(
      'This field is required',
      name: 'error_field_required',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get error_email_required {
    return Intl.message(
      'Email is required',
      name: 'error_email_required',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get error_email_invalid {
    return Intl.message(
      'Please enter a valid email address',
      name: 'error_email_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get error_password_required {
    return Intl.message(
      'Password is required',
      name: 'error_password_required',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters`
  String get error_password_short {
    return Intl.message(
      'Password must be at least 6 characters',
      name: 'error_password_short',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one uppercase letter`
  String get error_password_uppercase {
    return Intl.message(
      'Password must contain at least one uppercase letter',
      name: 'error_password_uppercase',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one number`
  String get error_password_number {
    return Intl.message(
      'Password must contain at least one number',
      name: 'error_password_number',
      desc: '',
      args: [],
    );
  }

  /// `Phone number is required`
  String get error_phone_required {
    return Intl.message(
      'Phone number is required',
      name: 'error_phone_required',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number`
  String get error_phone_invalid {
    return Intl.message(
      'Please enter a valid phone number',
      name: 'error_phone_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your password`
  String get error_confirm_password_required {
    return Intl.message(
      'Please confirm your password',
      name: 'error_confirm_password_required',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get error_passwords_not_match {
    return Intl.message(
      'Passwords do not match',
      name: 'error_passwords_not_match',
      desc: '',
      args: [],
    );
  }

  /// `Username is required`
  String get error_username_required {
    return Intl.message(
      'Username is required',
      name: 'error_username_required',
      desc: '',
      args: [],
    );
  }

  /// `Username cannot contain @`
  String get error_username_at {
    return Intl.message(
      'Username cannot contain @',
      name: 'error_username_at',
      desc: '',
      args: [],
    );
  }

  /// `Username must be at least 3 characters`
  String get error_username_short {
    return Intl.message(
      'Username must be at least 3 characters',
      name: 'error_username_short',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
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

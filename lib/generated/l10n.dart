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

  /// `IMC Calculator`
  String get appBarTitle {
    return Intl.message(
      'IMC Calculator',
      name: 'appBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Weight (kg)`
  String get pageHomeWeigh {
    return Intl.message(
      'Weight (kg)',
      name: 'pageHomeWeigh',
      desc: '',
      args: [],
    );
  }

  /// `Height (cm)`
  String get pageHomeHeight {
    return Intl.message(
      'Height (cm)',
      name: 'pageHomeHeight',
      desc: '',
      args: [],
    );
  }

  /// `Calculate`
  String get pageHomeCalculate {
    return Intl.message(
      'Calculate',
      name: 'pageHomeCalculate',
      desc: '',
      args: [],
    );
  }

  /// `Under Weight`
  String get bmiResultUnder {
    return Intl.message(
      'Under Weight',
      name: 'bmiResultUnder',
      desc: '',
      args: [],
    );
  }

  /// `Normal`
  String get bmiResultNormal {
    return Intl.message(
      'Normal',
      name: 'bmiResultNormal',
      desc: '',
      args: [],
    );
  }

  /// `Overweight`
  String get bmiResultOverWeight {
    return Intl.message(
      'Overweight',
      name: 'bmiResultOverWeight',
      desc: '',
      args: [],
    );
  }

  /// `Obesity`
  String get bmiResultObesity {
    return Intl.message(
      'Obesity',
      name: 'bmiResultObesity',
      desc: '',
      args: [],
    );
  }

  /// `Weight is required!`
  String get pageHomeWeightIsRequired {
    return Intl.message(
      'Weight is required!',
      name: 'pageHomeWeightIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Height is required!`
  String get pageHomeHeightIsRequired {
    return Intl.message(
      'Height is required!',
      name: 'pageHomeHeightIsRequired',
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
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
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

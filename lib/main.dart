import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'app_router.dart';

import 'core/themes/my_theme.dart';
import 'generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    const locale = Locale('en');

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      title: 'LearnHub',

      locale: locale,

      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      supportedLocales: S.delegate.supportedLocales,

      theme: MyTheme.lightTheme(context, locale),

      darkTheme: MyTheme.darkTheme(context, locale),

      themeMode: _themeMode,

      routerConfig: appRouter,
    );
  }
}

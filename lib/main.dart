import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_router.dart';
import 'core/themes/my_theme.dart';
import 'service_locator.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDi();

  runApp(
    DevicePreview(
      enabled: true, // Set to false to disable Device Preview
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeMode _themeMode = ThemeMode.dark;

  // void _toggleTheme() {
  //   setState(() {
  //     _themeMode = _themeMode == ThemeMode.light
  //         ? ThemeMode.dark
  //         : ThemeMode.light;
  //   });
  // }

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

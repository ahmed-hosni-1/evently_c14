import 'package:evently_c14/core/manager/app_manager.dart';
import 'package:evently_c14/core/routes/app_routes_name.dart';
import 'package:evently_c14/core/theme/app_theme.dart';
import 'package:evently_c14/modules/auth/screens/login_screen.dart';
import 'package:evently_c14/modules/auth/screens/reset_password_screen.dart';
import 'package:evently_c14/modules/layout/screens/layout_screen.dart';
import 'package:evently_c14/modules/on_bording/screens/welcome_screen.dart';
import 'package:evently_c14/modules/splash/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
import 'modules/auth/screens/register_screen.dart';
import 'modules/event/screens/add_event_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => AppProvider()..getLang()..getTheme(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      locale: Locale(provider.lang),
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: provider.themeMode,
      routes: {
        AppRoutesName.splash: (_) => SplashScreen(),
        AppRoutesName.welcome: (_) => WelcomeScreen(),
        AppRoutesName.login: (_) => LoginScreen(),
        AppRoutesName.register: (_) => RegisterScreen(),
        AppRoutesName.reset: (_) => ResetPasswordScreen(),
        AppRoutesName.layout: (_) => LayoutScreen(),
        AppRoutesName.addEvent: (_) => AddEventScreen(),
      },
    );
  }
}

extension navigator on String {
  go(BuildContext context) => Navigator.pushNamed(context, this);
  removeBack(BuildContext context) =>
      Navigator.pushReplacementNamed(context, this);
  removeAll(BuildContext context) => Navigator.pushNamedAndRemoveUntil(
        context,
        this,
        (route) => false,
      );
}

extension localization on BuildContext {
  AppLocalizations get tr => AppLocalizations.of(this)!;
}

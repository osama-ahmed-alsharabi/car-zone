import 'package:car_zone/core/theme/dark_theme.dart';
import 'package:car_zone/features/splash/presentation/view/splash_view.dart';
import 'package:car_zone/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const CarZone());
}

class CarZone extends StatelessWidget {
  const CarZone({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale("ar"),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: dark(),
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}

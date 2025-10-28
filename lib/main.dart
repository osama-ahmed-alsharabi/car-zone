import 'package:car_zone/core/database/dao/user_dao.dart';
import 'package:car_zone/core/helpers/service_locator.dart';
import 'package:car_zone/core/theme/dark_theme.dart';
import 'package:car_zone/core/router/app_router.dart';
import 'package:car_zone/features/home/presentation/view_model/user_view_model.dart/user_view_model_cubit.dart';
import 'package:car_zone/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupServiceLocator();
  runApp(const CarZone());
}

class CarZone extends StatelessWidget {
  const CarZone({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserViewModelCubit(getIt.get<UserDao>())..getUserData(),
      child: MaterialApp.router(
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
        routerConfig: AppRouter.router,
      ),
    );
  }
}

import 'package:car_zone/core/helpers/api_helper.dart';
import 'package:car_zone/features/auth/login/data/imp/login_imp.dart';
import 'package:car_zone/features/auth/login/data/repo/login_repo.dart';
import 'package:car_zone/features/auth/register/data/imp/register_repo_imp.dart';
import 'package:car_zone/features/auth/register/data/repo/register_repo.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiHelper>(ApiHelper(dio: Dio()));
  getIt.registerSingleton<LoginRepo>(
    LoginImp(
      firebaseAuth: FirebaseAuth.instance,
      apiHelper: getIt.get<ApiHelper>(),
    ),
  );

  getIt.registerSingleton<RegisterRepo>(
    RegisterRepoImp(apiHelper: getIt.get<ApiHelper>()),
  );
}

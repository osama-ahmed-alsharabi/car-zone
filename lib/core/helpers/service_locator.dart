import 'package:car_zone/core/database/dao/brand_local_data_source.dart';
import 'package:car_zone/core/database/dao/car_local_data_source.dart';
import 'package:car_zone/core/database/dao/user_dao.dart';
import 'package:car_zone/core/helpers/api_helper.dart';
import 'package:car_zone/core/helpers/secure_token_storage.dart';
import 'package:car_zone/core/helpers/shared_pref_helper.dart';
import 'package:car_zone/features/auth/login/data/imp/login_imp.dart';
import 'package:car_zone/features/auth/login/data/repo/login_repo.dart';
import 'package:car_zone/features/auth/register/data/imp/register_repo_imp.dart';
import 'package:car_zone/features/auth/register/data/repo/register_repo.dart';
import 'package:car_zone/features/home/data/imp/home_imp.dart';
import 'package:car_zone/features/home/data/repo/home_repo.dart';
import 'package:car_zone/features/profile/data/imp/profile_imp.dart';
import 'package:car_zone/features/profile/data/repo/profile_repo.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  getIt.registerSingleton<UserDao>(UserDao());
  getIt.registerSingleton<CarLocalDataSource>(CarLocalDataSource());
  getIt.registerSingleton<BrandLocalDataSource>(BrandLocalDataSource());
  final prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPrefHelper>(SharedPrefHelper(prefs));
  getIt.registerSingleton<SecureTokenStorage>(
    SecureTokenStorage(const FlutterSecureStorage()),
  );
  getIt.registerSingleton<ApiHelper>(ApiHelper(dio: Dio()));

  getIt.registerSingleton<ProfileRepo>(
    ProfileImp(
      getIt.get<CarLocalDataSource>(),
      getIt.get<UserDao>(),
      api: getIt.get<ApiHelper>(),
    ),
  );
  getIt.registerSingleton<LoginRepo>(
    LoginImp(
      firebaseAuth: FirebaseAuth.instance,
      apiHelper: getIt.get<ApiHelper>(),
      secureTokenStorage: getIt.get<SecureTokenStorage>(),
      userDao: getIt.get<UserDao>(),
    ),
  );

  getIt.registerSingleton<RegisterRepo>(
    RegisterRepoImp(apiHelper: getIt.get<ApiHelper>()),
  );
  getIt.registerSingleton<HomeRepo>(
    HomeImp(
      api: getIt.get<ApiHelper>(),
      localDataSource: getIt.get<CarLocalDataSource>(),
      brandLocalDataSource: getIt.get<BrandLocalDataSource>(),
    ),
  );
}

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tech_all/provider/otp_provider.dart';
import 'package:tech_all/provider/theme_provider.dart';
import 'package:tech_all/utill/app_constants.dart';
import 'package:tech_all/utill/preferenceutils.dart';

import 'data/datasource/remote/dio/dio_client.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';
import 'provider/splash_provider.dart';

final sl = GetIt.instance;

Future<void> init() async {

  //Repo
  sl.registerLazySingleton(() => DioClient(AppConstants.baseURL, sl(), loggingInterceptor: sl()));
  // sl.registerLazySingleton(() => OtpRepo(dioClient: sl()));

  // Provider
  sl.registerFactory(() => SplashProvider());
  sl.registerFactory(() => ThemeProvider(sharedPreferences: sl()));
  sl.registerFactory(() => OTPProvider());

  // External
  PreferenceUtils.init();
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
}

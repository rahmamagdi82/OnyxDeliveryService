import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ony_x_delivery_service/features/home/data/data_source/remote_data_source.dart';
import 'package:ony_x_delivery_service/features/home/data/repository/home_repository_implementation.dart';
import 'package:ony_x_delivery_service/features/home/domain/repository/home_repository.dart';
import 'package:ony_x_delivery_service/features/home/domain/use_cases/home_use_case.dart';
import 'package:ony_x_delivery_service/features/home/presentation/controller/get_bills_cubit.dart';
import 'package:ony_x_delivery_service/features/login/data/data_source/remote_data_source.dart';
import 'package:ony_x_delivery_service/features/login/domain/repository/login_repository.dart';
import 'package:ony_x_delivery_service/features/login/domain/use_cases/check_login_use_case.dart';
import 'package:ony_x_delivery_service/features/login/domain/use_cases/login_use_case.dart';
import 'package:ony_x_delivery_service/features/login/presentation/controller/check_login_cubit.dart';
import 'package:ony_x_delivery_service/features/login/presentation/controller/login_cubit.dart';

import '../../features/login/data/data_source/local_data_source.dart';
import '../../features/login/data/repository/login_repository_implement.dart';
import 'api_services.dart';
final getItInstance = GetIt.instance;

Future<void> initAppModule() async{


  // api service
  getItInstance.registerLazySingleton<ApiServices>(() => ApiServices(dio: Dio()));

  // remote data source
  getItInstance.registerLazySingleton<LoginRemoteDataSource>(() => LoginRemoteDataSourceImp(apiServices: getItInstance(),));
  getItInstance.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSourceImp(apiServices: getItInstance(),));

  // local data source
  getItInstance.registerLazySingleton<LoginLocalDataSource>(() => LoginLocalDataSourceImp());

  // repository
  getItInstance.registerLazySingleton<LoginRepository>(() => LoginRepositoryImp(loginRemoteDataSource: getItInstance(), loginLocalDataSource: getItInstance()));
  getItInstance.registerLazySingleton<HomeRepository>(() => HomeRepositoryImp(homeRemoteDataSource: getItInstance()));

  // use case
  getItInstance.registerLazySingleton<LoginUseCase>(() => LoginUseCase(loginRepository: getItInstance(),));
  getItInstance.registerLazySingleton<CheckLoginUseCase>(() => CheckLoginUseCase(loginRepository: getItInstance(),));
  getItInstance.registerLazySingleton<HomeUseCase>(() => HomeUseCase(homeRepository: getItInstance()));

// cubit
  getItInstance.registerLazySingleton(() => LoginCubit(loginUseCase: getItInstance(),));
  getItInstance.registerLazySingleton(() => CheckLoginCubit(checkLoginUseCase: getItInstance(),));
  getItInstance.registerLazySingleton(() => GetBillsCubit(homeUseCase: getItInstance(),));


}
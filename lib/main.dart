import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ony_x_delivery_service/core/utils/api_services.dart';
import 'package:ony_x_delivery_service/features/login/data/data_source/local_data_source.dart';
import 'package:ony_x_delivery_service/features/login/data/data_source/remote_data_source.dart';
import 'package:ony_x_delivery_service/features/login/data/repository/login_repository_implement.dart';
import 'package:ony_x_delivery_service/features/login/domain/entites/user_entity.dart';
import 'package:ony_x_delivery_service/features/login/domain/use_cases/check_login_use_case.dart';
import 'package:ony_x_delivery_service/features/login/domain/use_cases/login_use_case.dart';
import 'package:ony_x_delivery_service/features/login/presentation/controller/check_login_cubit.dart';
import 'package:ony_x_delivery_service/features/login/presentation/controller/login_cubit.dart';

import 'core/utils/constants.dart';
import 'core/utils/router_manager.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(UserEntityAdapter());
  await Hive.openBox<UserEntity>(AppConstants.loginBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit(loginUseCase: LoginUseCase(loginRepository: LoginRepositoryImp(loginRemoteDataSource: LoginRemoteDataSourceImp(apiServices: ApiServices(dio: Dio())), loginLocalDataSource: LoginLocalDataSourceImp())))),

        BlocProvider(create: (context) => CheckLoginCubit(checkLoginUseCase: CheckLoginUseCase(loginRepository: LoginRepositoryImp(loginRemoteDataSource: LoginRemoteDataSourceImp(apiServices: ApiServices(dio: Dio())), loginLocalDataSource: LoginLocalDataSourceImp())))..checkLogin())
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          textTheme: GoogleFonts.montserratTextTheme()
        ),
      ),
    );
  }
}

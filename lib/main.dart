import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ony_x_delivery_service/features/login/domain/entites/user_entity.dart';
import 'package:ony_x_delivery_service/features/login/presentation/controller/check_login_cubit.dart';
import 'package:ony_x_delivery_service/features/login/presentation/controller/login_cubit.dart';

import 'core/utils/constants.dart';
import 'core/utils/dependancy_injection.dart';
import 'core/utils/router_manager.dart';

void main() async{
  await initAppModule();
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
        BlocProvider(create: (context) => getItInstance<LoginCubit>()),

        BlocProvider(create: (context) => getItInstance<CheckLoginCubit>()..checkLogin())
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

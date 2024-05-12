import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ony_x_delivery_service/core/utils/resources/color_manager.dart';
import 'package:ony_x_delivery_service/core/utils/resources/values_manager.dart';
import 'package:ony_x_delivery_service/features/login/presentation/controller/check_login_cubit.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/utils/router_manager.dart';
import '../../../../gen/assets.gen.dart';
class SplashBodyViewWidget extends StatelessWidget {
  const SplashBodyViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckLoginCubit,CheckLoginState>(
      listener: (BuildContext context, CheckLoginState state) {
        if(state is CheckLoginSuccess){
          navigationTo(AppRouter.homeViewPath,context);
        }
        if(state is CheckLoginFailed){
          navigationTo(AppRouter.loginViewPath,context);
        }
      },
      child: Container(
        color: ColorManager.secondary,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(Assets.images.logo,),
            const SizedBox(height: AppSize.s105,),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SvgPicture.asset(Assets.images.path),
                SvgPicture.asset(Assets.images.manWithMotorcycle),
              ],
            ),
            const SizedBox(height: AppSize.s16,)
          ],
        ),
      ),
    );
  }

  void navigationTo(String path,BuildContext context){
    Future.delayed(const Duration(seconds: 3),(){
      GoRouter.of(context).go(path);
    });
  }
}
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ony_x_delivery_service/core/utils/resources/color_manager.dart';
import 'package:ony_x_delivery_service/core/utils/resources/values_manager.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/utils/router_manager.dart';
import '../../../../gen/assets.gen.dart';
class SplashBodyViewWidget extends StatefulWidget {
  const SplashBodyViewWidget({super.key});

  @override
  State<SplashBodyViewWidget> createState() => _SplashBodyViewWidgetState();
}

class _SplashBodyViewWidgetState extends State<SplashBodyViewWidget> {

  @override
  void initState() {
    super.initState();
    navigationTo();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }


  void navigationTo(){
    Future.delayed(const Duration(seconds: 3),(){
      GoRouter.of(context).go(AppRouter.loginViewPath);
    });
  }

}
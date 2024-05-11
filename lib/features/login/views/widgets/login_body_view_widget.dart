import 'package:flutter/material.dart';
import 'package:ony_x_delivery_service/core/utils/resources/font_manager.dart';
import 'package:ony_x_delivery_service/core/utils/resources/style_manager.dart';
import 'package:ony_x_delivery_service/core/utils/resources/values_manager.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../gen/assets.gen.dart';
import 'form_widget.dart';
import 'logo_language_widget.dart';

class LoginBodyViewWidget extends StatelessWidget {
  const LoginBodyViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Stack(
            alignment: Alignment.topRight,
            children:[
              SvgPicture.asset(Assets.images.circle,),
              const Column(
                children: [
                  SizedBox(height: AppSize.s56,),
                  LogoLanguageWidget(),
                ],
              ),
            ] ,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Welcome Back!',style: FontStyles.getSemiBoldStyle(fontSize: FontSize.s29),),
              const SizedBox(height: AppSize.s16,),
              Text('Log back into your account',style: FontStyles.getMediumStyle()),
              const SizedBox(height: AppSize.s44,),
              const FormWidget(),
              SvgPicture.asset(Assets.images.delivery,),
              const SizedBox(height: AppSize.s27,),
            ],
          ),
        )
      ],
    );
  }
}

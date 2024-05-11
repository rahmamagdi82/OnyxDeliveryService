import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/utils/resources/color_manager.dart';
import '../../../../core/utils/resources/font_manager.dart';
import '../../../../core/utils/resources/style_manager.dart';
import '../../../../core/utils/resources/values_manager.dart';
import '../../../../gen/assets.gen.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: AppSize.s127,
          width: double.infinity,
          color: ColorManager.red,
          child: SvgPicture.asset(Assets.images.primaryColorCircle,alignment: Alignment.topRight,),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ahmed',style: FontStyles.getMediumStyle(fontSize: FontSize.s25).copyWith(color: ColorManager.white),),
                  Text('Othman',style: FontStyles.getBoldStyle(fontSize: FontSize.s25).copyWith(color: ColorManager.white),),
                ],
              ),
              Image.asset(Assets.images.deliveryman.path,),
              Container(
                height: AppSize.s24,
                width: AppSize.s24,
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(AppSize.s5),
                ),
                child: IconButton(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.zero,
                    onPressed: (){}, icon: Icon(Icons.language,color: ColorManager.primary,)),
              )
            ],
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utils/resources/color_manager.dart';
import '../../../../../core/utils/resources/font_manager.dart';
import '../../../../../core/utils/resources/style_manager.dart';
import '../../../../../core/utils/resources/values_manager.dart';
import '../../../../../gen/assets.gen.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(Assets.images.emptyOrder),
        const SizedBox(height: AppSize.s44,),
        Text('No orders yet',
          style: FontStyles.getSemiBoldStyle(fontSize: FontSize.s23).copyWith(color: ColorManager.black),
        ),
        const SizedBox(height: AppSize.s16,),
        Text("You don't have any orders in your history.",
          style: FontStyles.getRegularStyle(fontSize: FontSize.s16).copyWith(color: ColorManager.black),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../core/utils/resources/color_manager.dart';
import '../../../../../core/utils/resources/font_manager.dart';
import '../../../../../core/utils/resources/style_manager.dart';
import '../../../../../core/utils/resources/values_manager.dart';


class TitleWithValueWidget extends StatelessWidget {
  const TitleWithValueWidget({Key? key, required this.title, required this.value, required this.color}) : super(key: key);
  final String title;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(title,style: FontStyles.getMediumStyle(fontSize: FontSize.s10).copyWith(color: ColorManager.darkGray),)),
        const SizedBox(height: AppSize.s8,),
        FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(value,style: FontStyles.getSemiBoldStyle(fontSize: FontSize.s16).copyWith(color: color),)),
      ],
    );
  }
}

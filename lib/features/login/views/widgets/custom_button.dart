import 'package:flutter/material.dart';
import 'package:ony_x_delivery_service/core/utils/resources/color_manager.dart';
import 'package:ony_x_delivery_service/core/utils/resources/font_manager.dart';

import '../../../../core/utils/resources/style_manager.dart';
import '../../../../core/utils/resources/values_manager.dart';


class CustomButton extends StatelessWidget{
  const CustomButton({super.key, required this.text,  required this.onPressed, this.borderRadiusGeometry});
  final String text;
  final void Function()? onPressed;
  final BorderRadiusGeometry? borderRadiusGeometry;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s44,
      width: double.infinity,
      child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(ColorManager.primary),
              shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(borderRadius: borderRadiusGeometry??BorderRadius.circular(AppSize.s22))
              )
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: FontStyles.getMediumStyle(fontSize:FontSize.s16).copyWith(color: ColorManager.white),
          )),
    );
  }
}
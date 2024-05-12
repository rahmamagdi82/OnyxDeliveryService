import 'package:flutter/material.dart';

import '../../../../../core/utils/resources/color_manager.dart';
import '../../../../../core/utils/resources/style_manager.dart';
import '../../../../../core/utils/resources/values_manager.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({super.key, required this.hintText, required this.keyboardType, required this.validator, this.isObscureText , required this.textEditingController});

  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool? isObscureText;

  final TextEditingController textEditingController;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isShowPassword = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      controller: widget.textEditingController,
      autofocus: false,
      cursorColor: ColorManager.primary,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      obscureText: widget.isObscureText!=null?!isShowPassword:false,
      decoration: InputDecoration(
        filled: true,
          fillColor: const Color(0xffF1F5FB),
          hintText: widget.hintText,
          hintStyle: FontStyles.getRegularStyle(color: ColorManager.black),
          contentPadding: const EdgeInsets.only(top: AppPadding.p12,bottom: AppPadding.p14),
          enabledBorder: customInputBorder(borderColor: ColorManager.secondary),
          focusedBorder: customInputBorder(borderColor: ColorManager.secondary),
          focusedErrorBorder:customInputBorder(borderColor: ColorManager.red),
          errorBorder: customInputBorder(borderColor: ColorManager.red),
          suffixIcon: widget.isObscureText != null? IconButton(onPressed:(){
            setState(() {
              isShowPassword = !isShowPassword;
            });
          }, icon: isShowPassword?const Icon(Icons.visibility):const Icon(Icons.visibility_off)):null
      ),
    );
  }

  InputBorder customInputBorder({required Color borderColor}){
    return OutlineInputBorder(borderRadius: BorderRadius.circular(AppSize.s22),borderSide: BorderSide(color: borderColor));
  }
}
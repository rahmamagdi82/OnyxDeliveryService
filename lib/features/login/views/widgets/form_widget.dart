import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ony_x_delivery_service/core/utils/resources/style_manager.dart';
import 'package:ony_x_delivery_service/core/utils/resources/values_manager.dart';
import 'package:ony_x_delivery_service/features/login/views/widgets/custom_text_form_field.dart';

import '../../../../core/utils/router_manager.dart';
import 'custom_button.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  var key = GlobalKey<FormState>();
  var userIDController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
        child: Column(
          children: [
            CustomTextFormField(hintText: 'User ID', keyboardType: TextInputType.name, validator: (value ) {  }, textEditingController: userIDController,),
            const SizedBox(height: AppSize.s8,),
            CustomTextFormField(hintText: 'Password', keyboardType: TextInputType.visiblePassword, validator: (value ) {  }, textEditingController: passwordController,),
            const SizedBox(height: AppSize.s27,),
            Align(alignment: Alignment.topRight,child: Text('Show More',style: FontStyles.getSemiBoldStyle(),)),
            const SizedBox(height: AppSize.s24,),
            CustomButton(text: 'Log in', onPressed: () {
              GoRouter.of(context).go(AppRouter.homeViewPath);
            },),
            const SizedBox(height: AppSize.s37,),
          ],
        ),
      ),
    );
  }
}

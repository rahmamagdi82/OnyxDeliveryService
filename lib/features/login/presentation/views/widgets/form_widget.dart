import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:ony_x_delivery_service/core/utils/resources/color_manager.dart';
import 'package:ony_x_delivery_service/core/utils/resources/style_manager.dart';
import 'package:ony_x_delivery_service/core/utils/resources/values_manager.dart';
import 'package:ony_x_delivery_service/features/login/presentation/controller/login_cubit.dart';

import '../../../../../core/utils/router_manager.dart';
import '../../../data/models/login_data_parameters.dart';
import 'custom_button.dart';
import 'custom_text_form_field.dart';

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
            CustomTextFormField(hintText: 'User ID', keyboardType: TextInputType.name, validator: (value ) {
              if(value!.isEmpty){
                return 'User ID Should not be empty';
              }
              else{
                return null;
              }
            }, textEditingController: userIDController,),
            const SizedBox(height: AppSize.s8,),
            CustomTextFormField(hintText: 'Password', keyboardType: TextInputType.visiblePassword, validator: (value ) {
              if(value!.isEmpty){
                return 'User ID Should not be empty';
              }
              else{
                return null;
              }
            }, textEditingController: passwordController,),
            const SizedBox(height: AppSize.s27,),
            Align(alignment: Alignment.topRight,child: Text('Show More',style: FontStyles.getSemiBoldStyle(),)),
            const SizedBox(height: AppSize.s24,),
            BlocConsumer<LoginCubit,LoginState>(
              listener: (BuildContext context, state) {
                if(state is LoginSuccess){
                  GoRouter.of(context).go(AppRouter.homeViewPath,extra: state.user);
                }
                else if(state is LoginFailed){
                  Fluttertoast.showToast(msg: state.message,backgroundColor: ColorManager.red);
                }
              },
              builder: (BuildContext context, Object? state) {
                return CustomButton(
                  isLoading: state is LoginLoading,
                  text: 'Log in',
                  onPressed: () {
                    if(key.currentState!.validate()){
                      BlocProvider.of<LoginCubit>(context).login(
                          LoginDataParameters(userId: userIDController.text, password: passwordController.text)
                      );
                    }
                  },);
              },
            ),
            const SizedBox(height: AppSize.s37,),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ony_x_delivery_service/features/home/presentation/controller/get_bills_cubit.dart';
import 'package:ony_x_delivery_service/features/home/presentation/views/widgets/home_body_view_widget.dart';
import 'package:ony_x_delivery_service/features/login/domain/entites/user_entity.dart';

import '../../../../core/utils/dependancy_injection.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key, required this.user}) : super(key: key);
  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getItInstance<GetBillsCubit>()..getBills(user.userNumber!),
      child: Scaffold(
        body: HomeBodyViewWidget(user: user,),
      ),
    );
  }
}

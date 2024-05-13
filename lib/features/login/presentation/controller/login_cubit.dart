import 'package:bloc/bloc.dart';
import 'package:ony_x_delivery_service/features/login/domain/entites/user_entity.dart';
import 'package:ony_x_delivery_service/features/login/domain/use_cases/login_use_case.dart';

import '../../data/models/login_data_parameters.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginUseCase}) : super(LoginInitial());
  final LoginUseCase loginUseCase;

  Future<void> login(LoginDataParameters dataModel) async{
    emit(LoginLoading());
    final result = await loginUseCase.call(dataModel);
    result.fold(
            (l) {
              emit(LoginFailed(message: l.message));
              },
            (user) {
              emit(LoginSuccess(user: user));
            });
  }
}

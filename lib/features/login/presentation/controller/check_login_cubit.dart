import 'package:bloc/bloc.dart';
import 'package:ony_x_delivery_service/features/login/domain/entites/user_entity.dart';
import 'package:ony_x_delivery_service/features/login/domain/use_cases/check_login_use_case.dart';

part 'check_login_state.dart';

class CheckLoginCubit extends Cubit<CheckLoginState> {
  CheckLoginCubit({required this.checkLoginUseCase}) : super(CheckLoginInitial());
  final CheckLoginUseCase checkLoginUseCase;
  Future<void> checkLogin() async {
    final result = await checkLoginUseCase.call();
    result.fold((l) {
      emit(CheckLoginFailed(message: l.message));
    }, (user) {
      emit(CheckLoginSuccess(user: user));
    });
  }
}

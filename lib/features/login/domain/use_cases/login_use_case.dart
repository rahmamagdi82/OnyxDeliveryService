import 'package:fpdart/fpdart.dart';
import 'package:ony_x_delivery_service/core/errors/failure.dart';
import 'package:ony_x_delivery_service/core/use_cases/use_case.dart';
import 'package:ony_x_delivery_service/features/login/domain/entites/user_entity.dart';
import 'package:ony_x_delivery_service/features/login/domain/repository/login_repository.dart';

import '../../data/models/login_data_parameters.dart';


class LoginUseCase extends UseCase<UserEntity,LoginDataParameters>{
  final LoginRepository loginRepository;

  LoginUseCase({required this.loginRepository});
  @override
  Future<Either<Failure, UserEntity>> call([LoginDataParameters? params]) {
    return loginRepository.login(params!);
  }
}
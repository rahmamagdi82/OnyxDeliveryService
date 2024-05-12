import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entites/user_entity.dart';
import '../repository/login_repository.dart';

class CheckLoginUseCase extends UseCase<UserEntity,void>{
  final LoginRepository loginRepository;

  CheckLoginUseCase({required this.loginRepository});
  @override
  Future<Either<Failure, UserEntity>> call([params]) {
    return loginRepository.checkLogin();
  }
}
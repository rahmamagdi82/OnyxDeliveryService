import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/login_data_parameters.dart';
import '../entites/user_entity.dart';

abstract class LoginRepository{
  Future<Either<Failure,UserEntity>> login(LoginDataParameters dataModel);
  Future<Either<Failure,UserEntity>> checkLogin();

}
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ony_x_delivery_service/core/errors/failure.dart';
import 'package:ony_x_delivery_service/features/login/data/data_source/remote_data_source.dart';
import 'package:ony_x_delivery_service/features/login/domain/entites/user_entity.dart';
import 'package:ony_x_delivery_service/features/login/domain/repository/login_repository.dart';

import '../models/login_data_parameters.dart';
import '../models/login_model.dart';

class LoginRepositoryImp extends LoginRepository{
  final LoginRemoteDataSource loginRemoteDataSource;

  LoginRepositoryImp({required this.loginRemoteDataSource});
  @override
  Future<Either<Failure, UserEntity>> login(LoginDataParameters dataModel) async {
    try{
      final LoginModel result = await loginRemoteDataSource.login(dataModel);
      if(result.result.errNo != 0){
        return Left(ServerFailure(message: result.result.errMsg,));
      }
      else{
        final UserEntity user = result.data;
        return right(user);
      }
    }
    catch(e){
      if(e is DioException){
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(message: e.toString(), ));
    }
  }
}
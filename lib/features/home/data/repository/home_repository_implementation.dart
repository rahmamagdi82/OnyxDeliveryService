import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ony_x_delivery_service/core/errors/failure.dart';
import 'package:ony_x_delivery_service/features/home/data/data_source/remote_data_source.dart';
import 'package:ony_x_delivery_service/features/home/domain/entities/bill_entity.dart';
import 'package:ony_x_delivery_service/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImp extends HomeRepository{
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImp({required this.homeRemoteDataSource,});

  @override
  Future<Either<Failure, List<BillEntity>>> getBills(String userNumber) async{
    try{
      final List<BillEntity> bills = await homeRemoteDataSource.getBills(userNumber);
      return right(bills);
    }
    catch(e){
      print(e.toString());

      if(e is DioException){
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(message: e.toString(), ));
    }
  }

}
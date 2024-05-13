import 'package:fpdart/fpdart.dart';
import 'package:ony_x_delivery_service/core/errors/failure.dart';
import 'package:ony_x_delivery_service/features/home/domain/repository/home_repository.dart';

import '../../../../core/use_cases/use_case.dart';
import '../entities/bill_entity.dart';

class HomeUseCase extends UseCase<List<BillEntity>,String>{
  final HomeRepository homeRepository;

  HomeUseCase({required this.homeRepository});

  @override
  Future<Either<Failure, List<BillEntity>>> call([String? params]) async{
    return await homeRepository.getBills(params!);
  }
}
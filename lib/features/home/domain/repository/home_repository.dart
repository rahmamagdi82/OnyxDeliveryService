import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../entities/bill_entity.dart';

abstract class HomeRepository{
  Future<Either<Failure,List<BillEntity>>> getBills(String userNumber);
}
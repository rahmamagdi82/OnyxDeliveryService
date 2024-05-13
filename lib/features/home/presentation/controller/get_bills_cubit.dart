import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/bill_entity.dart';
import '../../domain/use_cases/home_use_case.dart';

part 'get_bills_state.dart';

class GetBillsCubit extends Cubit<GetBillsState> {
  GetBillsCubit({required this.homeUseCase}) : super(GetBillsInitial());
  final HomeUseCase homeUseCase;

  Future<void> getBills(String userNumber) async{
    emit(GetBillsLoading());
    final result = await homeUseCase.call(userNumber);
    result.fold((l) {
      emit(GetBillsFailed(message: l.message));
    }, (bills) {
      emit(GetBillsSuccess(bills: bills));
    });
  }
}

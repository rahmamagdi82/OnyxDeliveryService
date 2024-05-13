part of 'get_bills_cubit.dart';

@immutable
abstract class GetBillsState {}

class GetBillsInitial extends GetBillsState {}
class GetBillsLoading extends GetBillsState {}
class GetBillsSuccess extends GetBillsState {
  final List<BillEntity> bills;

  GetBillsSuccess({required this.bills});
}
class GetBillsFailed extends GetBillsState {
  final String message;

  GetBillsFailed({required this.message});

}
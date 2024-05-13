class BillEntity{
  final String billId;
  final String billStatus;
  final String billDate;
  final String taxAmount;
  final String deliveryAmount;

  BillEntity({required this.billId, required this.billStatus, required this.billDate, required this.taxAmount, required this.deliveryAmount});
}
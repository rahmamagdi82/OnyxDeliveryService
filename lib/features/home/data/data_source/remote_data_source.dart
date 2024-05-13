import '../../../../core/utils/api_services.dart';
import '../models/bill_model.dart';

abstract class HomeRemoteDataSource{
  Future<List<BillModel>> getBills(String userNumber);
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource{
  final ApiServices apiServices;

  HomeRemoteDataSourceImp({required this.apiServices});

  final String getOrdersEndPoint = 'GetDeliveryBillsItems';

  @override
  Future<List<BillModel>> getBills(String userNumber) async {
    final result = await apiServices.post(endPoint: getOrdersEndPoint, data: {
      "Value": {
        "P_DLVRY_NO": userNumber,
        "P_LANG_NO": "1",
        "P_BILL_SRL": "",
        "P_PRCSSD_FLG": ""
      }
    });
    return getOrdersList(result);
  }

  List<BillModel> getOrdersList(Map<String,dynamic> json){
    List<BillModel> orders = [];
    for(var orderMap in json['Data']['DeliveryBills']){
      orders.add(BillModel.fromJson(orderMap));
    }
    return orders;
  }

}
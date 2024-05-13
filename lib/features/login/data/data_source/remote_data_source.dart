import 'package:ony_x_delivery_service/features/login/data/models/login_data_parameters.dart';
import 'package:ony_x_delivery_service/features/login/data/models/login_model.dart';

import '../../../../core/utils/api_services.dart';

abstract class LoginRemoteDataSource{
  Future<LoginModel> login(LoginDataParameters dataModel);
}

class LoginRemoteDataSourceImp extends LoginRemoteDataSource{
  final ApiServices apiServices;

  LoginRemoteDataSourceImp({required this.apiServices});

  final String loginEndPoint = 'CheckDeliveryLogin';
  @override
  Future<LoginModel> login(LoginDataParameters dataModel) async {
     final result = await apiServices.post(endPoint: loginEndPoint, data: {
       "Value": {
         "P_LANG_NO": "1",
         "P_DLVRY_NO": dataModel.userId,
         "P_PSSWRD": dataModel.password
       }
     });

     return LoginModel.fromJson(result);
  }
}
import 'package:dio/dio.dart';

import 'constants.dart';

class ApiServices{

  final Dio dio;

  ApiServices({required this.dio});

  Future<Map<String,dynamic>> post({required String endPoint,required Map<String,dynamic> data}) async {
    final result = await dio.post('${AppConstants.baseUrl}$endPoint',data: data);
    return result.data;
  }

  Future<Map<String,dynamic>> get({required String endPoint,required Map<String,dynamic> data}) async {
    final result = await dio.get('${AppConstants.baseUrl}$endPoint',data: data,options: Options(
      headers: {
        'Content-Type':'application/json-patch+json'
      }
    ));
    return result.data;
  }
}
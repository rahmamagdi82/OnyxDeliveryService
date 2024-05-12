import 'package:dio/dio.dart';

import 'constants.dart';

class ApiServices{

  final Dio dio;

  ApiServices({required this.dio});

  Future<Map<String,dynamic>> post({required String endPoint,required Map<String,dynamic> data}) async {
    final result = await dio.post('${AppConstants.baseUrl}$endPoint',data: data);
    return result.data;
  }
}
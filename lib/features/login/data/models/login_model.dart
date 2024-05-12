/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

import 'package:ony_x_delivery_service/features/login/domain/entites/user_entity.dart';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        required this.data,
        required this.result,
    });

    Data data;
    Result result;

    factory LoginModel.fromJson(Map<dynamic, dynamic> json) => LoginModel(
        data: Data.fromJson(json["Data"]),
        result: Result.fromJson(json["Result"]),
    );

    Map<dynamic, dynamic> toJson() => {
        "Data": data.toJson(),
        "Result": result.toJson(),
    };
}

class Data extends UserEntity{
    Data({
        required this.deliveryName,
    }) : super(userName: deliveryName);

    String deliveryName;

    factory Data.fromJson(Map<dynamic, dynamic> json) => Data(
        deliveryName: (json["DeliveryName"]==null)?'':json["DeliveryName"],
    );

    Map<dynamic, dynamic> toJson() => {
        "DeliveryName": deliveryName,
    };
}

class Result {
    Result({
        required this.errMsg,
        required this.errNo,
    });

    String errMsg;
    int errNo;

    factory Result.fromJson(Map<dynamic, dynamic> json) => Result(
        errMsg: json["ErrMsg"],
        errNo: json["ErrNo"],
    );

    Map<dynamic, dynamic> toJson() => {
        "ErrMsg": errMsg,
        "ErrNo": errNo,
    };
}

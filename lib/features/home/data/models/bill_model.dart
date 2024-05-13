/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

import '../../domain/entities/bill_entity.dart';

BillModel orderModelFromJson(String str) => BillModel.fromJson(json.decode(str));

String orderModelToJson(BillModel data) => json.encode(data.toJson());

class BillModel extends BillEntity{
    BillModel({
        required this.dlvryAmt,
        required this.billTime,
        required this.cstmrAprtmntNo,
        required this.longitude,
        required this.cstmrFloorNo,
        required this.cstmrAddrss,
        required this.taxAmt,
        required this.cstmrBuildNo,
        required this.billAmt,
        required this.mobileNo,
        required this.billType,
        required this.billSrl,
        required this.billDate,
        required this.billNo,
        required this.cstmrNm,
        required this.dlvryStatusFlg,
        required this.latitude,
        required this.rgnNm,
    }) : super(billId: billNo, billStatus: dlvryStatusFlg, billDate: billDate, taxAmount: taxAmt, deliveryAmount: dlvryAmt);

    String dlvryAmt;
    String billTime;
    String cstmrAprtmntNo;
    String longitude;
    String cstmrFloorNo;
    String cstmrAddrss;
    String taxAmt;
    String cstmrBuildNo;
    String billAmt;
    String mobileNo;
    String billType;
    String billSrl;
    String billDate;
    String billNo;
    String cstmrNm;
    String dlvryStatusFlg;
    String latitude;
    String rgnNm;

    factory BillModel.fromJson(Map<dynamic, dynamic> json) => BillModel(
        dlvryAmt: json["DLVRY_AMT"],
        billTime: json["BILL_TIME"],
        cstmrAprtmntNo: json["CSTMR_APRTMNT_NO"],
        longitude: json["LONGITUDE"],
        cstmrFloorNo: json["CSTMR_FLOOR_NO"],
        cstmrAddrss: json["CSTMR_ADDRSS"],
        taxAmt: json["TAX_AMT"],
        cstmrBuildNo: json["CSTMR_BUILD_NO"],
        billAmt: json["BILL_AMT"],
        mobileNo: json["MOBILE_NO"],
        billType: json["BILL_TYPE"],
        billSrl: json["BILL_SRL"],
        billDate: json["BILL_DATE"],
        billNo: json["BILL_NO"],
        cstmrNm: json["CSTMR_NM"],
        dlvryStatusFlg: json["DLVRY_STATUS_FLG"],
        latitude: json["LATITUDE"],
        rgnNm: json["RGN_NM"],
    );

    Map<dynamic, dynamic> toJson() => {
        "DLVRY_AMT": dlvryAmt,
        "BILL_TIME": billTime,
        "CSTMR_APRTMNT_NO": cstmrAprtmntNo,
        "LONGITUDE": longitude,
        "CSTMR_FLOOR_NO": cstmrFloorNo,
        "CSTMR_ADDRSS": cstmrAddrss,
        "TAX_AMT": taxAmt,
        "CSTMR_BUILD_NO": cstmrBuildNo,
        "BILL_AMT": billAmt,
        "MOBILE_NO": mobileNo,
        "BILL_TYPE": billType,
        "BILL_SRL": billSrl,
        "BILL_DATE": billDate,
        "BILL_NO": billNo,
        "CSTMR_NM": cstmrNm,
        "DLVRY_STATUS_FLG": dlvryStatusFlg,
        "LATITUDE": latitude,
        "RGN_NM": rgnNm,
    };
}

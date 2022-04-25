// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

HalaPaymentModel halaPaymentModelFromJson(String str) => HalaPaymentModel.fromJson(json.decode(str));

String halaPaymentModelToJson(HalaPaymentModel data) => json.encode(data.toJson());

class HalaPaymentModel {
  HalaPaymentModel({
    this.pageNumber,
    this.pageSize,
    this.firstPage,
    this.lastPage,
    this.totalPages,
    this.totalRecords,
    this.nextPage,
    this.previousPage,
    this.data,
    this.succeeded,
    this.errors,
    this.message,
  });

  int? pageNumber;
  int? pageSize;
  String? firstPage;
  String? lastPage;
  int? totalPages;
  int? totalRecords;
  String? nextPage;
  String? previousPage;
  List<PaymentItemModel>? data;
  bool? succeeded;
  String? errors;
  String? message;

  factory HalaPaymentModel.fromJson(Map<String, dynamic> json) => HalaPaymentModel(
    pageNumber: json["pageNumber"],
    pageSize:  json["pageSize"],
    firstPage:  json["firstPage"],
    lastPage: json["lastPage"],
    totalPages:  json["totalPages"],
    totalRecords:  json["totalRecords"],
    nextPage:  json["nextPage"],
    previousPage: json["previousPage"],
    data: json["data"] == null ? [] : List<PaymentItemModel>.from(json["data"].map((x) => PaymentItemModel.fromJson(x))),
    succeeded: json["succeeded"],
    errors: json["errors"].toString(),
    message: json["message"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "pageNumber":  pageNumber,
    "pageSize": pageSize,
    "firstPage":  firstPage,
    "lastPage": lastPage,
    "totalPages": totalPages,
    "totalRecords":  totalRecords,
    "nextPage":  nextPage,
    "previousPage": previousPage,
    "data":  List<dynamic>.from(data!.map((x) => x.toJson())),
    "succeeded":  succeeded,
    "errors": errors,
    "message": message,
  };
}

class PaymentItemModel {
  PaymentItemModel({
    this.trxRef,
    this.userId,
    this.amount,
    this.trxDate,
    this.mobileNumber,
    this.fullNameAr,
    this.fullNameEn,
    this.thurayaNumber,
  });

  String? trxRef;
  String? userId;
  double? amount;
  String? trxDate;
  String? mobileNumber;
  String? fullNameAr;
  String? fullNameEn;
  String? thurayaNumber;

  factory PaymentItemModel.fromJson(Map<String, dynamic> json) => PaymentItemModel(
    trxRef: json["trxRef"],
    userId:  json["userId"],
    amount:double.parse(json["amount"].toString()),
    trxDate:  json["trxDate"],
    mobileNumber:  json["mobileNumber"],
    fullNameAr: json["fullNameAR"],
    fullNameEn: json["fullNameEN"],
    thurayaNumber: json["thurayaNumber"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "trxRef":  trxRef,
    "userId":  userId,
    "amount":  amount,
    "trxDate":  trxDate,
    "mobileNumber": mobileNumber,
    "fullNameAR":  fullNameAr,
    "fullNameEN": fullNameEn,
    "thurayaNumber": thurayaNumber,
  };
}

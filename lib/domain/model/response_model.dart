
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ResponseModel responseModelFromJson(String str) => ResponseModel.fromJson(json.decode(str));

class ResponseModel {
  ResponseModel({
   required this.responseCode,
   required this.responseMessage,
    this.dateSet,
  });

  int responseCode;
  String responseMessage;
  String? dateSet;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
    responseCode: json["responseCode"] ?? '',
    responseMessage: json["responseMessage"] ?? '',
    dateSet: json["dateSet"] ??'',
  );


}



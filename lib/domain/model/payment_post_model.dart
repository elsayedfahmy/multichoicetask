
import 'dart:convert';

String paymentPostModelToJson(PaymentPostModel data) => json.encode(data.toJson());

class PaymentPostModel {
  PaymentPostModel({
   required this.fromDate,
   required this.toDate,
   required this.filter,
  });

  String fromDate;
  String toDate;
  Filter filter;

  Map<String, dynamic> toJson() => {
    "FromDate":fromDate,
    "ToDate": toDate,
    "filter": filter.toJson(),
  };
}

class Filter {
  Filter({
   required this.pageNumber,
   required this.pageSize,
  });

  int pageNumber;
  int pageSize;


  Map<String, dynamic> toJson() => {
    "PageNumber":  pageNumber,
    "PageSize":  pageSize,
  };
}

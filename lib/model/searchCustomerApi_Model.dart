// To parse this JSON data, do
//
//     final searchCustomerApi = searchCustomerApiFromJson(jsonString);

import 'dart:convert';

SearchCustomerApi searchCustomerApiFromJson(String str) =>
    SearchCustomerApi.fromJson(json.decode(str));

String searchCustomerApiToJson(SearchCustomerApi data) =>
    json.encode(data.toJson());

class SearchCustomerApi {
  SearchCustomerApi({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  String message;
  int statusCode;
  List<Datum> data;

  factory SearchCustomerApi.fromJson(Map<String, dynamic> json) =>
      SearchCustomerApi(
        message: json["message"],
        statusCode: json["StatusCode"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "StatusCode": statusCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.customerNo,
    required this.name,
    required this.address,
    required this.phoneNo,
    required this.licenseNo,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String customerNo;
  String name;
  String address;
  String phoneNo;
  String licenseNo;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        customerNo: json["customerNo"],
        name: json["name"],
        address: json["address"],
        phoneNo: json["phoneNo"],
        licenseNo: json["licenseNo"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customerNo": customerNo,
        "name": name,
        "address": address,
        "phoneNo": phoneNo,
        "licenseNo": licenseNo,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

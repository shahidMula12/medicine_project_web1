// To parse this JSON data, do
//
//     final searchGetProducts = searchGetProductsFromJson(jsonString);

import 'dart:convert';

SearchGetProducts searchGetProductsFromJson(String str) =>
    SearchGetProducts.fromJson(json.decode(str));

String searchGetProductsToJson(SearchGetProducts data) =>
    json.encode(data.toJson());

class SearchGetProducts {
  SearchGetProducts({
    required this.data,
    required this.message,
    required this.statusCode,
  });

  List<Datum> data;
  String message;
  int statusCode;

  factory SearchGetProducts.fromJson(Map<String, dynamic> json) =>
      SearchGetProducts(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
        statusCode: json["StatusCode"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "StatusCode": statusCode,
      };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

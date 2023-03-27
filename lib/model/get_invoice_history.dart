class GetInvoiceHistoryModel {
  String? message;
  int? statusCode;
  List<Data>? data;

  GetInvoiceHistoryModel({this.message, this.statusCode, this.data});

  GetInvoiceHistoryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['StatusCode'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['StatusCode'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? data;
  int? grandTotal;
  String? status;
  String? userId;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.data,
      this.grandTotal,
      this.status,
      this.userId,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    data = json['data'];
    grandTotal = json['grandTotal'];
    status = json['status'];
    userId = json['userId'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['data'] = this.data;
    data['grandTotal'] = this.grandTotal;
    data['status'] = this.status;
    data['userId'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

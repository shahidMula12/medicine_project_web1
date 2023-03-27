class GetCustomerModel {
  String? message;
  int? statusCode;
  Data? data;

  GetCustomerModel({this.message, this.statusCode, this.data});

  GetCustomerModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['StatusCode'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['StatusCode'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<CustomerRecord>? customerRecord;
  int? totalCustomers;

  Data({this.customerRecord, this.totalCustomers});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['customerRecord'] != null) {
      customerRecord = <CustomerRecord>[];
      json['customerRecord'].forEach((v) {
        customerRecord!.add(new CustomerRecord.fromJson(v));
      });
    }
    totalCustomers = json['totalCustomers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customerRecord != null) {
      data['customerRecord'] =
          this.customerRecord!.map((v) => v.toJson()).toList();
    }
    data['totalCustomers'] = this.totalCustomers;
    return data;
  }
}

class CustomerRecord {
  String? id;
  String? customerNo;
  String? name;
  String? address;
  String? phoneNo;
  String? licenseNo;
  String? createdAt;
  String? updatedAt;

  CustomerRecord(
      {this.id,
      this.customerNo,
      this.name,
      this.address,
      this.phoneNo,
      this.licenseNo,
      this.createdAt,
      this.updatedAt});

  CustomerRecord.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerNo = json['customerNo'];
    name = json['name'];
    address = json['address'];
    phoneNo = json['phoneNo'];
    licenseNo = json['licenseNo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customerNo'] = this.customerNo;
    data['name'] = this.name;
    data['address'] = this.address;
    data['phoneNo'] = this.phoneNo;
    data['licenseNo'] = this.licenseNo;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

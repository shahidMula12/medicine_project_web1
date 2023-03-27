class AllStockModel {
  String? message;
  int? statusCode;
  Data? data;

  AllStockModel({this.message, this.statusCode, this.data});

  AllStockModel.fromJson(Map<String, dynamic> json) {
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
  List<StocksList>? stocksList;
  int? totalStocks;

  Data({this.stocksList, this.totalStocks});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['stocksList'] != null) {
      stocksList = <StocksList>[];
      json['stocksList'].forEach((v) {
        stocksList!.add(new StocksList.fromJson(v));
      });
    }
    totalStocks = json['totalStocks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.stocksList != null) {
      data['stocksList'] = this.stocksList!.map((v) => v.toJson()).toList();
    }
    data['totalStocks'] = this.totalStocks;
    return data;
  }
}

class StocksList {
  String? id;
  String? batchNo;
  int? quantity;
  int? costPrice;
  int? salePrice;
  String? description;
  String? expiryDate;
  String? createdAt;
  String? updatedAt;
  Product? product;

  StocksList(
      {this.id,
      this.batchNo,
      this.quantity,
      this.costPrice,
      this.salePrice,
      this.description,
      this.expiryDate,
      this.createdAt,
      this.updatedAt,
      this.product});

  StocksList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    batchNo = json['batchNo'];
    quantity = json['quantity'];
    costPrice = json['costPrice'];
    salePrice = json['salePrice'];
    description = json['description'];
    expiryDate = json['expiryDate'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['batchNo'] = this.batchNo;
    data['quantity'] = this.quantity;
    data['costPrice'] = this.costPrice;
    data['salePrice'] = this.salePrice;
    data['description'] = this.description;
    data['expiryDate'] = this.expiryDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  String? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  Product({this.id, this.name, this.createdAt, this.updatedAt});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

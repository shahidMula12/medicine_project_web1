import 'package:medicine_project/controller/api_manager.dart';
import 'package:medicine_project/model/all_stock_model.dart';
import 'package:medicine_project/model/get_customer.dart';
import 'package:medicine_project/model/get_invoice_history.dart';
import 'package:medicine_project/utils/dialogue_box.dart';

import '../model/searchCustomerApi_Model.dart';
import '../model/search_getproducts.dart';

getAllStocks(context) async {
  var data = await ApiManager.getAllStocks();
  // print("${data} 888888888888888888888888888888");

  if (data['StatusCode'] == 200 || data['statusCode'] == 200) {
    var finalData = AllStockModel.fromJson(data);
    print(finalData);
    return finalData;
  } else {
    validationAlert(context, title: data['message']);
  }
}

getCustomer(context) async {
  var data = await ApiManager.getCustomer();
  // print("${data} 888888888888888888888888888888");
  if (data['statusCode'] == 200 || data['StatusCode'] == 200) {
    var finalData = GetCustomerModel.fromJson(data);
    print(finalData);
    return finalData;
  } else {
    validationAlert(context, title: data['message']);
  }
}

getInvoiceHistory1(context) async {
  var data = await ApiManager.getInvoiceHistory();
  // print("${data} 777777777777777777777");
  if (data['statusCode'] == 200 || data['StatusCode'] == 200) {
    var finalData = GetInvoiceHistoryModel.fromJson(data);
    print(finalData);
    return finalData;
  } else {
    validationAlert(context, title: data['message']);
  }
}

getsearchProducts(context) async {
  var data = await ApiManager.searchGetProducts();
  print("${data},this is the search if getALLProducts");
  if (data['statusCode'] == 200 || data['StatusCode'] == 200) {
    var finalData = SearchGetProducts.fromJson(data);
    print(finalData);
    return finalData;
  } else {
    validationAlert(context, title: data['message']);
  }
}

getSearchCustomerListApi(context) async {
  var data = await ApiManager.searchCustomerListApi();
  print("${data},this search is for customer list Search");
  if (data['statuscode'] == 200 || data['StatusCode'] == 200) {
    var finalData = SearchCustomerApi.fromJson(data);
    print(finalData);
    return finalData;
  } else {
    validationAlert(context, title: data['message']);
  }
}

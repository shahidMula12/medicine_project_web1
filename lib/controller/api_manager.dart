import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:medicine_project/view/update_stock.dart';

final String BaseURL = "http://medical.devsinntechnologies.com";


class ApiManager {
  static searchGetProducts({body, name}) async {
    try {
      var response = await http
          .get(Uri.parse("$BaseURL/stocks/searchProduct?$name=product"));
      var finalResponse = jsonDecode(response.body);
      // print(finalResponse);
      return finalResponse;
    } catch (e) {
      print(e);
    }
  }


static invoiceSection({body})async{
  try {
     var response = await http.post(Uri.parse("$BaseURL/invoice/addInvoice"), body: body);
   var finalResponse = jsonDecode(response.body);
        print("${finalResponse } 99999999999999999999999999999999999999999999999999");

   return finalResponse;
  } catch (e) {
    print(e);
  }
}



  static searchCustomerListApi({name, body}) async {
    try {
      var response = await http
          .get(Uri.parse("$BaseURL/customer/searchCustomer?$name=test"));
      var finalresponse = jsonDecode(response.body);
      return finalresponse;
    } catch (e) {
      print(e);
    }
  }

  static addStock({body}) async {
    try {
      var response =
          await http.post(Uri.parse("$BaseURL/stocks/addStock"), body: body);
      var finalResponse = jsonDecode(response.body);
      // print(finalResponse);
        print("${finalResponse } 5555555555555555555555555555555555555555555");
      return finalResponse;
    } catch (e) {
      print(e);
    }
  }

  static addCustomer({body}) async {
    try {
      var response = await http.post(Uri.parse("$BaseURL/customer/addCustomer"),
          body: body);
      var finalResponse = jsonDecode(response.body);
      // print(finalResponse);
      return finalResponse;
    } catch (e) {
      print(e);
    }
  }

  static updateStock({body}) async {
    try {
      var response = await http.patch(
          Uri.parse(
              "$BaseURL/stocks/updateStock/86bf74c191c783a48027c455251b5657"),
          body: body);
      var finalResponse = jsonDecode(response.body);
      // print(finalResponse);
      return finalResponse;
    } catch (e) {
      print(e);
    }
  }

  static getAllStocks({pageNo = 1, pageSize = 10}) async {
    try {
      var response = await http.get(
        Uri.parse(
            "$BaseURL/stocks/getStocksList?pageNo=$pageNo&pageSize=$pageSize"),
      );
      var finalResponse = jsonDecode(response.body);
      // print("${finalResponse } 6666666666666666666666666666666666666666666666");
      return finalResponse;
    } catch (e) {
      print(e);
    }
  }

  static deleteStock({id}) async {
    try {
      var response = await http.delete(
        Uri.parse("$BaseURL/stocks/deleteStock/$id"),
      );
      var finalResponse = jsonDecode(response.body);
      // print("$finalResponse 777777777777777777777");
      return finalResponse;
    } catch (e) {
      print(e);
    }
  }

  static getCustomer({pageNo = 1, pageSize = 10}) async {
    try {
      var response = await http.get(Uri.parse(
          "$BaseURL/customer/getCustomers?pageNo=$pageNo&pageSize=$pageSize"));
      var finalResponse = jsonDecode(response.body);
      // print(finalResponse);
      return finalResponse;
    } catch (e) {
      print(e);
    }
  }

  static deleteCustomer({id}) async {
    try {
      var response =
          await http.delete(Uri.parse("$BaseURL/customer/deleteCustomer/$id"));
      var finalResponse = jsonDecode(response.body);
      // print(finalResponse);
      return finalResponse;
    } catch (e) {}
  }

  static getInvoiceHistory() async {
    try {
      var response = await http.get(Uri.parse("$BaseURL/invoice/getInvoice"));
      var finalResponse = jsonDecode(response.body);
      // print("$finalResponse 777777777777777777");
      return finalResponse;
    } catch (e) {
      print(e);
    }
  }

 
  static getSignUp({body}) async {
    try {
      var response =
          await http.post(Uri.parse("$BaseURL/auth/signup"), body: body);
      var finalResponse = jsonDecode(response.body);
      // print("$finalResponse 111111111111111111");
      return finalResponse;
    } catch (e) {
      print(e);
    }
  }

  static getLogIn({body}) async {
    try {
      var response =
          await http.post(Uri.parse("$BaseURL/auth/signin"), body: body);
      var finalResponse = jsonDecode(response.body);
      // print("$finalResponse 2222222222222222222");
      // print("")
      return finalResponse;
    } catch (e) {
      print(e);
    }
    
  }
}

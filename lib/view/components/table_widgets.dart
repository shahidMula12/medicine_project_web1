import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:medicine_project/controller/api_manager.dart';
import 'package:medicine_project/controller/global_state.dart';
import 'package:medicine_project/model/all_stock_model.dart';
import 'package:medicine_project/model/get_invoice_history.dart';
import 'package:medicine_project/utils/api_handler.dart';
import 'package:medicine_project/utils/loader/loading.dart';
import 'package:medicine_project/view/update_customer.dart';
import 'package:provider/provider.dart';
import '../../model/get_customer.dart';
import '../../model/searchCustomerApi_Model.dart';
import '../../model/search_getproducts.dart';
import '../../provider/provider_class.dart';
import '../../utils/screen_names.dart';
import '/utils/heading.dart';

import '../../utils/break_points.dart';
import '../../utils/constants.dart';
import '../../utils/dialogue_box.dart';
import '../widgets.dart';

class CustomTable extends StatefulWidget {
  final size, isOpen;
  CustomTable({this.size, this.isOpen});
  @override
  State<CustomTable> createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable> {
//  List <AllStockModel>?
  SearchCustomerApi? customerSearchBar;
  SearchGetProducts? search;
  AllStockModel? stocks;
  @override
  void initState() {
    super.initState();
    searchAllProductsStock();
    getStock();
    customerSearchBarList();
  }

  customerSearchBarList() async {
    customerSearchBar = await getSearchCustomerListApi(context);
    // print(customerSearchBar);
    setState(() {});
  }

  searchAllProductsStock() async {
    search = await getsearchProducts(context);
    print(search);
    setState(() {});
  }

  getStock() async {
    // Loader.show(context);
    // setState(() {
    //   GlobalState.isLoading = true;
    // });
    stocks = await getAllStocks(context);

    print(stocks);
    setState(() {});
    // Navigator.pop(context);
    // setState(() {
    //   GlobalState.isLoading = false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProviderClass>(context, listen: false);
    var size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  size.width < 674
                      ? Row(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              widthFactor: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: CustomText(
                                    fontFamily: "interMedium",
                                    color: primaryColor,
                                    words: "Stock",
                                    fontsize: 38,
                                    fontweight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 25,
                              ),
                              decoration: BoxDecoration(
                                  color: mostColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100))),
                            ),
                          ],
                        )
                      : Align(
                          alignment: Alignment.center,
                          widthFactor: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: CustomText(
                                fontFamily: "interMedium",
                                color: primaryColor,
                                words: "Stock",
                                fontsize: 38,
                                fontweight: FontWeight.w700),
                          ),
                        ),
                  SizedBox(height: 15),
                  CustomTextField2(context),
                ],
              ),
              size.width < 674
                  ? Container()
                  : Container(
                      height: 40,
                      width: 40,
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 25,
                      ),
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                    ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          // Divider(
          //   color: Color(0xffE4E4E4),
          //   thickness: 1,
          //   height: 2,
          // ),
          Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: stocks == null
                    ? CircularProgressIndicator.adaptive(
                      
                    )
                    : DataTable(
                        headingRowColor: MaterialStateProperty.all(primaryColor),
                        dividerThickness: 0,
                        columnSpacing:142,
                        columns: [
                            for (var i = 0; i < stockHeading.length; i++)
                              DataColumn(
                                  label: Expanded(
                                child: Text(
                                  "${stockHeading[i]}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      // fontWeight: FontWeight.bold
                                      ),
                                  textAlign: TextAlign.start,
                                ),
                              ))
                          ],
                        rows: [
                            // for (var data in stocks!.data!.stocksList!)
                                      for (var i = 0; i < stocks!.data!.stocksList!.length; i++)

                              // for (var i = 0 ; i<stocks![i].stocks!.data!.length;i++)
                              DataRow(cells: [
                                // for (var i = 0; i < dummyText.length; i++)
                                
                                DataCell(
                                  Container(
                                    alignment: AlignmentDirectional.centerStart,
                                    child: Text(
                                      // "${stocks![i].stocks!.data![i].quantity}",
                                      "${i + 1}",
                                      style: TextStyle(fontSize: 16),
                                      // textScaleFactor: 1.5,
                                    ),
                                  ),
                                ),
                                DataCell(Container(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Text(
                                    "${stocks!.data!.stocksList![i].product!.name}",
                                    style: TextStyle(fontSize: 16),
                                    // textScaleFactor: 1.5,
                                  ),
                                )),
                                DataCell(Container(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Text(
                                    // "${stocks![i].stocks!.data![i].expiryDate}",
                                    "${stocks!.data!.stocksList![i].batchNo}",
                                    style: TextStyle(fontSize: 16),
                                    // textScaleFactor: 1.5,
                                  ),
                                )),
                                DataCell(Container(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Text(
                                                                    "${stocks!.data!.stocksList![i].expiryDate}",

                                    style: TextStyle(fontSize: 16),
                                    // textScaleFactor: 1.5,
                                  ),
                                )),
                                DataCell(Container(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Text(
                                    // "${stocks![i].stocks!.data![i].batchNo}",
                                                                       "${stocks!.data!.stocksList![i].salePrice}",

                                    style: TextStyle(fontSize: 16),
                                    // textScaleFactor: 1.5,
                                  ),
                                )),
                                DataCell(Container(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Text(
                                    // "${stocks![i].stocks!.data![i].salePrice}",
                                                                       "${stocks!.data!.stocksList![i].costPrice}",

                                    style: TextStyle(fontSize: 16),
                                    // textScaleFactor: 1.5,
                                  ),
                                )),
                                DataCell(Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      color: editColor,
                                      icon: Icon(
                                        size: 23,
                                        Icons.edit,
                                        color: Color(0xff32409A),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        provider.changeScreen(VIEWSTOCK);
                                      },
                                      icon: Icon(Icons.remove_red_eye),
                                      color: Color(0xff000000),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        showAlertDialog(context,
                                            onTap: () async {
                                          var response =
                                              await ApiManager.deleteStock(
                                                  id: stocks!.data!.stocksList![i].id);
                                          print(response);
                                          Navigator.pop(context);
                                          if (response['statusCode'] == 200 ||
                                              response['StatusCode'] == 200) {
                                            getStock();
                                            validationAlert(context,
                                                title: response['message'],
                                                isShow: false);
                                          } else {
                                            validationAlert(context,
                                                title: response['message'],
                                                isShow: false);
                                          }
                                        });
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        size: 28,
                                        color: redColor,
                                      ),
                                    ),
                                  ],
                                )),
                              ]),
                          ]),
              )),
          SizedBox(height: 4),
          Divider(
            color: Color(0xffE4E4E4),
            thickness: 1,
            height: 2,
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                CustomText(
                    words: "1 Total",
                    color: primaryColor,
                    fontsize: 22,
                    fontweight: FontWeight.bold),
                Spacer(
                  flex: 1,
                ),
                CustomText(
                    words: "more...",
                    color: primaryColor,
                    fontsize: 19,
                    fontweight: FontWeight.bold),
              ],
            ),
          )
        ],
      ),
    );
  }
}
Widget CustomerListTable(
  size,
  context, {
  GetCustomerModel? customer,
  columnspacing
}) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: customer == null
        ? CircularProgressIndicator.adaptive()
        : DataTable(
                        headingRowColor: MaterialStateProperty.all(primaryColor),
          dividerThickness: 0, columnSpacing:  columnspacing, columns: [
            for (var i = 0; i < customerHeading.length; i++)
              DataColumn(
                  label: Expanded(
                child: Text(
                  "${customerHeading[i]}",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      // fontWeight: FontWeight.bold
                      ),
                  textAlign: TextAlign.start,
                ),
              ))
          ], rows: [
            for (var i = 0; i < customer.data!.customerRecord!.length; i++)
              // for(var data in stocks!.stocks!.data!)
              // for (var i = 0 ; i<stocks![i].stocks!.data!.length;i++)
              DataRow(cells: [
                // for (var i = 0; i < dummyText.length; i++)
                DataCell(
                  Container(
                    alignment: AlignmentDirectional.centerStart,
                  
                    child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 30),
                  child: Text(
                      // "${stocks![i].stocks!.data![i].quantity}",
                      "${i + 1}",
                      style: TextStyle(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                      // textScaleFactor: 1.5,
                    ),
                  )
                  ),
                ),
                DataCell(Container(
                  // width: 130,
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    " ${customer.data!.customerRecord![i].id}",
                    style: TextStyle(fontSize: 16),
                    // overflow: TextOverflow.ellipsis,
                    // textScaleFactor: 1.5,
                  )
                )),
                DataCell(Container(
                  width: 130,
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    // "${stocks![i].stocks!.data![i].expiryDate}",
                    "${customer.data!.customerRecord![i].name}",
                    style: TextStyle(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    // textScaleFactor: 1.5,
                  )
                )),
                DataCell(Container(
                  
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "${customer.data!.customerRecord![i].address}",
                    style: TextStyle(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    // textScaleFactor: 1.5,
                  ),
                )),
                DataCell(Container(
                  
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    // "${stocks![i].stocks!.data![i].batchNo}",
                    "${customer.data!.customerRecord![i].phoneNo}",
                    style: TextStyle(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    // textScaleFactor: 1.5,
                  ),
                )),

                DataCell(Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        // setState(() {
                        //         GlobalState.selectedFragment = "customerlisthistory";
                        //       });
                      },
                      color: editColor,
                      icon: Icon(
                        size: 23,
                        Icons.edit,
                        color: mostColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // setState(() {
                        //         GlobalState.selectedFragment = "customerlisthistory";
                        //       });
                      },
                      icon: Icon(Icons.history),
                      color: mostColor,
                    ),
                    IconButton(
                      onPressed: () {
                        print(customer.data!.customerRecord![i].toJson());
                        showAlertDialog(context, onTap: () async {
                          var response = await ApiManager.deleteCustomer(
                              id: customer.data!.customerRecord![i].id);
                          print(response);
                          Navigator.pop(context);
                          if (response['statusCode'] == 200 ||
                              response['StatusCode'] == 200) {
                            getCustomer(context);
                            validationAlert(context,
                                title: response['message'], isShow: false);
                          } else {
                            validationAlert(context,
                                title: response['message'], isShow: false);
                          }
                        });
                      },
                      icon: Icon(
                        Icons.delete,
                        size: 28,
                        color: redColor,
                      ),
                    ),
                  ],
                )),
              ])
          ]),
  );
  
}
Widget PaymentListTable(
  size,
  context, {
  GetCustomerModel? customer,
}) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: customer == null
        ? CircularProgressIndicator.adaptive()
        : DataTable(dividerThickness: 0, columnSpacing: 100, columns: [
            for (var i = 0; i < customerHeading.length; i++)
              DataColumn(
                  label: Expanded(
                child: Text(
                  "${customerHeading[i]}",
                  style: TextStyle(
                      fontSize: 20,
                      color: mostColor,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ))
          ], rows: [
            for (var i = 0; i < customer.data!.customerRecord!.length; i++)
              // for(var data in stocks!.stocks!.data!)
              // for (var i = 0 ; i<stocks![i].stocks!.data!.length;i++)
              DataRow(cells: [
                // for (var i = 0; i < dummyText.length; i++)
                DataCell(
                  Container(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      // "${stocks![i].stocks!.data![i].quantity}",
                      "${i + 1}",
                      style: TextStyle(fontSize: 16),
                      // textScaleFactor: 1.5,
                    ),
                  ),
                ),
                DataCell(Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    " ${customer.data!.customerRecord![i].id}",
                    style: TextStyle(fontSize: 16),
                    // textScaleFactor: 1.5,
                  ),
                )),
                DataCell(Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    // "${stocks![i].stocks!.data![i].expiryDate}",
                    "${customer.data!.customerRecord![i].name}",
                    style: TextStyle(fontSize: 16),
                    // textScaleFactor: 1.5,
                  ),
                )),
                DataCell(Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "${customer.data!.customerRecord![i].address}",
                    style: TextStyle(fontSize: 16),
                    // textScaleFactor: 1.5,
                  ),
                )),
                DataCell(Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    // "${stocks![i].stocks!.data![i].batchNo}",
                    "${customer.data!.customerRecord![i].phoneNo}",
                    style: TextStyle(fontSize: 16),
                    // textScaleFactor: 1.5,
                  ),
                )),

                DataCell(Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        // setState(() {
                        //         GlobalState.selectedFragment = "customerlisthistory";
                        //       });
                      },
                      color: editColor,
                      icon: Icon(
                        size: 23,
                        Icons.edit,
                        color: mostColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // setState(() {
                        //         GlobalState.selectedFragment = "customerlisthistory";
                        //       });
                      },
                      icon: Icon(Icons.history),
                      color: mostColor,
                    ),
                    IconButton(
                      onPressed: () {
                        print(customer.data!.customerRecord![i].toJson());
                        showAlertDialog(context, onTap: () async {
                          var response = await ApiManager.deleteCustomer(
                              id: customer.data!.customerRecord![i].id);
                          print(response);
                          Navigator.pop(context);
                          if (response['statusCode'] == 200 ||
                              response['StatusCode'] == 200) {
                            getCustomer(context);
                            validationAlert(context,
                                title: response['message'], isShow: false);
                          } else {
                            validationAlert(context,
                                title: response['message'], isShow: false);
                          }
                        });
                      },
                      icon: Icon(
                        Icons.delete,
                        size: 28,
                        color: redColor,
                      ),
                    ),
                  ],
                )),
              ])
          ]),
  );
  
}

Widget InvoiceStatusTable(size, context,
    {GetInvoiceHistoryModel? invoiceHistory}) {
  return Padding(
    padding: const EdgeInsets.only(top: 25, bottom: 25),
    child: Table(
      // defaultColumnWidth: FixedColumnWidth(size.width*0.15),
      columnWidths: {
        0: FlexColumnWidth(size.width * 0.0014),
        1: FlexColumnWidth(size.width * 0.0017),
        2: FlexColumnWidth(size.width * 0.0025),
        3: FlexColumnWidth(size.width * 0.0024),
        4: FlexColumnWidth(size.width * 0.0017),
      },
      children: [
        TableRow(children: [
          // ?for/
          CustomText(
            words: "Sr",
            fontweight: FontWeight.bold,
            fontsize: 17,
          ),
          CustomText(
              words: "Medicine name",
              fontweight: FontWeight.bold,
              fontsize: 17),
          CustomText(
              words: "Batch no#", fontweight: FontWeight.bold, fontsize: 17),
          CustomText(
              words: "Phone no", fontweight: FontWeight.bold, fontsize: 17),
          CustomText(words: "Rate", fontweight: FontWeight.bold, fontsize: 17),
          CustomText(
              words: "Discount", fontweight: FontWeight.bold, fontsize: 17)
        ]),
        for (int i = 0; i < invoiceHistory!.data!.length; i++)
          TableRow(children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CustomText(words: "${i + 1} ", fontsize: 17),
            ),
            //  " ${customer.data![i].id}",

            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CustomText(
                  words: "${invoiceHistory.data![i].userId}", fontsize: 17),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CustomText(
                  words: "${invoiceHistory.data![i].id}", fontsize: 17),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CustomText(
                  words: "${invoiceHistory.data![i].grandTotal}", fontsize: 17),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CustomText(
                  words: "${invoiceHistory.data![i].grandTotal}", fontsize: 17),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {},
                  color: editColor,
                  icon: Icon(size: 23, Icons.edit),
                ),
                IconButton(
                  onPressed: () {
                    showAlertDialog(context, onTap: () async {
                      var response = await ApiManager.deleteStock(
                          id: invoiceHistory.data![i].id);
                      print(response);
                      Navigator.pop(context);
                      if (response['statusCode'] == 200 ||
                          response['StatusCode'] == 200) {
                        getCustomer(context);
                        validationAlert(context,
                            title: response['message'], isShow: false);
                      } else {
                        validationAlert(context,
                            title: response['message'], isShow: false);
                      }
                    });
                  },
                  icon: Icon(
                    Icons.delete,
                    size: 28,
                    color: redColor,
                  ),
                ),
              ],
            )
      
          ]),
      ],
    ),
  );
}

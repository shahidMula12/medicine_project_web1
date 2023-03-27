import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medicine_project/controller/api_manager.dart';
// import 'package:invoice/controller/api_manager.dart';
// import 'package:invoice/view/widgets.dart';
import 'package:medicine_project/utils/break_points.dart';
import 'package:medicine_project/utils/constants.dart';
import 'package:medicine_project/utils/dialogue_box.dart';
import 'package:medicine_project/utils/loader/loading.dart';
import 'package:medicine_project/view/widgets.dart';

// import '../controller/alert_box.dart';
// import 'breakpoints.dart';
// import 'checkbox_widget.dart';

class invoice extends StatefulWidget {
  final isOpen;
  const invoice({super.key, this.isOpen});

  @override
  State<invoice> createState() => _UpdateStockState();
}

class _UpdateStockState extends State<invoice> {
  bool isAdded = false;
  var selectedDate;
  final medicineNameController = TextEditingController();
  final quantityController = TextEditingController();
  final batchNoController = TextEditingController();
  final rateController = TextEditingController();
  final saleTaxController = TextEditingController();
  final discountController = TextEditingController();
  final totalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: !widget.isOpen ? size.width - 60 : size.width - (drawerWidth + 60),
      height: size.height * 0.89,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: SafeArea(
        maintainBottomViewPadding: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                        words: "Invoice Section",
                        fontweight: FontWeight.bold,
                        fontsize: 24,
                        color: primaryColor),
                  ],
                ),
                SizedBox(height: 15),
                size.width <= 1260
                    ? Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customColumn(
                            // textFeildcontroller: medicineNameController,
                            heading: "Select Customer",
                            sizeboxheight: size.height * 0.007,
                            textfieldheight: size.height * 0.06,
                            // textfieldwidth: size.width * 0.4
                          ),
                          customColumn(
                            heading: "Date",
                            keyboard: TextInputType.number,
                            hint: selectedDate != null
                                ? selectedDate
                                : "DD/MM/YYYY",
                            sizeboxheight: size.height * 0.007,
                            textfieldheight: size.height * 0.06,

                            // textfieldwidth: size.width * 0.4,
                            onpress: () async {
                              DateTime? pickdate = await showDatePicker(
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                          colorScheme: ColorScheme.light(
                                              primary:
                                                  primaryColor, // <-- SEE HERE
                                              onPrimary:
                                                  Colors.white, // <-- SEE HERE
                                              onSurface: primaryColor)),
                                      child: child!,
                                    );
                                  },
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2200));
                              if (pickdate != null) {
                                print(pickdate);
                                setState(() {
                                  selectedDate =
                                      DateFormat("DD/MM/yyyy").format(pickdate);
                                });
                              }
                            },
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customColumn(
                              // textFeildcontroller: medicineNameController,
                              heading: "Select Customer",
                              sizeboxheight: size.height * 0.007,
                              textfieldheight: size.height * 0.06,
                              textfieldwidth: size.width * 0.37),
                          customColumn(
                            heading: "Date",
                            keyboard: TextInputType.number,
                            hint: selectedDate != null
                                ? selectedDate
                                : "DD/MM/YYYY",
                            sizeboxheight: size.height * 0.007,
                            textfieldheight: size.height * 0.06,
                            textfieldwidth: size.width * 0.37,
                            onpress: () async {
                              DateTime? pickdate = await showDatePicker(
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                          colorScheme: ColorScheme.light(
                                              primary:
                                                  primaryColor, // <-- SEE HERE
                                              onPrimary:
                                                  Colors.white, // <-- SEE HERE
                                              onSurface: primaryColor)),
                                      child: child!,
                                    );
                                  },
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2200));
                              if (pickdate != null) {
                                print(pickdate);
                                setState(() {
                                  selectedDate =
                                      DateFormat("DD/MM/yyyy").format(pickdate);
                                });
                              }
                            },
                          ),
                        ],
                      ),
                SizedBox(height: size.height * 0.04),
                size.width <= 1260
                    ? Column(
                        children: [
                          customColumn(
                            textFeildcontroller: medicineNameController,
                            heading: "Medicine Name",
                            hint: "i.e panadol",
                            sizeboxheight: size.height * 0.007,
                            textfieldheight: size.height * 0.06,
                            // textfieldwidth: size.width * 0.4
                          ),
                          SizedBox(height: size.height * 0.02),
                          customColumn(
                            textFeildcontroller: quantityController,
                            heading: "Quantity",
                            keyboard: TextInputType.number,
                            hint: "i.e 10",
                            sizeboxheight: size.height * 0.007,
                            textfieldheight: size.height * 0.06,
                            // textfieldwidth: size.width * 0.4
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customColumn(
                              textFeildcontroller: medicineNameController,
                              heading: "Medicine Name",
                              hint: "i.e panadol",
                              sizeboxheight: size.height * 0.007,
                              textfieldheight: size.height * 0.06,
                              textfieldwidth: size.width * 0.37),
                          customColumn(
                              textFeildcontroller: quantityController,
                              heading: "Quantity",
                              keyboard: TextInputType.number,
                              hint: "i.e 10",
                              sizeboxheight: size.height * 0.007,
                              textfieldheight: size.height * 0.06,
                              textfieldwidth: size.width * 0.37),
                        ],
                      ),
                SizedBox(height: size.height * 0.02),
                size.width <= 1260
                    ? Column(children: [
                        customColumn(
                            textFeildcontroller: batchNoController,
                            heading: "Batch no",
                            // suffixicons: IconButton(
                            //     onPressed: () {},
                            //     icon: Icon(Icons.keyboard_arrow_down)),
                            sizeboxheight: size.height * 0.007,
                            textfieldheight: size.height * 0.06,
                            // textfieldwidth: size.width * 0.37,
                            size: size),
                        SizedBox(height: size.height * 0.02),
                        customColumn(
                          textFeildcontroller: rateController,
                          heading: "Rate",
                          keyboard: TextInputType.number,
                          sizeboxheight: size.height * 0.007,
                          textfieldheight: size.height * 0.06,
                          // textfieldwidth: size.width * 0.37,
                        ),
                      ])
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customColumn(
                              textFeildcontroller: batchNoController,
                              heading: "Batch no",
                              // suffixicons: IconButton(
                              //     onPressed: () {},
                              //     icon: Icon(Icons.keyboard_arrow_down)),
                              sizeboxheight: size.height * 0.007,
                              textfieldheight: size.height * 0.06,
                              textfieldwidth: size.width * 0.37,
                              size: size),
                          customColumn(
                            textFeildcontroller: rateController,
                            keyboard: TextInputType.number,
                            heading: "Rate",
                            sizeboxheight: size.height * 0.007,
                            textfieldheight: size.height * 0.06,
                            textfieldwidth: size.width * 0.37,
                          ),
                        ],
                      ),
                SizedBox(height: size.height * 0.02),
                size.width <= 1260
                    ? Column(
                        children: [
                          customColumn(
                            textFeildcontroller: saleTaxController,
                            heading: "Sale tax @17%",
                            sizeboxheight: size.height * 0.007,
                            textfieldheight: size.height * 0.06,
                            // textfieldwidth: size.width * 0.37
                          ),
                          SizedBox(height: size.height * 0.02),
                          customColumn(
                            textFeildcontroller: discountController,
                            keyboard: TextInputType.number,
                            heading: "Discount",
                            sizeboxheight: size.height * 0.007,
                            textfieldheight: size.height * 0.06,
                            // textfieldwidth: size.width * 0.37
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customColumn(
                              textFeildcontroller: saleTaxController,
                              heading: "Sale tax @17%",
                              sizeboxheight: size.height * 0.007,
                              textfieldheight: size.height * 0.06,
                              textfieldwidth: size.width * 0.37),
                          customColumn(
                              textFeildcontroller: discountController,
                              keyboard: TextInputType.number,
                              heading: "Discount",
                              sizeboxheight: size.height * 0.007,
                              textfieldheight: size.height * 0.06,
                              textfieldwidth: size.width * 0.37),
                        ],
                      ),
                SizedBox(height: size.height * 0.03),
                size.width <= 1260
                    ? Column(
                        children: [
                          customColumn(
                            textFeildcontroller: totalController,
                            heading: "Total",
                            sizeboxheight: size.height * 0.007,
                            textfieldheight: size.height * 0.06,
                            // textfieldwidth: size.width * 0.37
                          ),
                          SizedBox(height: 10),
                          MaterialButton(
                              onPressed: () {},
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: primaryColor,
                                  ),
                                  height: 41,
                                  width: 120,
                                  child: Center(
                                    child: CustomText(
                                        fontsize: 18,
                                        words: "Add",
                                        color: Colors.white),
                                  )))
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customColumn(
                              textFeildcontroller: totalController,
                              heading: "Total",
                              sizeboxheight: size.height * 0.007,
                              textfieldheight: size.height * 0.06,
                              textfieldwidth: size.width * 0.37),
                          InkWell(
                              onTap: () async {
                                if (medicineNameController.text.isEmpty) {
                                  validationAlert(context,
                                      title: "Medicine name");
                                } else if (quantityController.text.isEmpty) {
                                  validationAlert(context, title: "Quantity");
                                } else if (batchNoController.text.isEmpty) {
                                  validationAlert(context, title: "Batch no!");
                                } else if (rateController.text.isEmpty) {
                                  validationAlert(context, title: "Rate");
                                } else if (saleTaxController.text.isEmpty) {
                                  validationAlert(context, title: "Sale tax");
                                } else if (discountController.text.isEmpty) {
                                  validationAlert(context, title: "Discount");
                                } else if (totalController.text.isEmpty) {
                                  validationAlert(context, title: "Total");
                                } else {
                                  validationAlert(context,
                                      title: "Successfully Added",
                                      isShow: false);
                                  var data = {
                                    "data": [
                                      {
                                        "name": medicineNameController.text,
                                        "batchNo": batchNoController.text,
                                        "quantity": quantityController.text,
                                        "price": rateController.text,
                                        "discount": discountController.text
                                      }
                                    ],
                                    "date": "23-01-2023",
                                    "userId": "d8582fc82a2b8a59b113439cd3d9d6e4"
                                  };
                                  // var data = {
                                  //   "data": [
                                  //     {
                                  //       "name": "${medicineNameController.text}",
                                  //       "batchNo": "${batchNoController.text}",
                                  //       "quantity": "${quantityController.text}",
                                  //       "price": "${rateController.text}",
                                  //       "discount": "${discountController.text}"
                                  //     }
                                  //   ],
                                  //   "userId": "12e26ebfecc28bd3875e29e98efbe7bf"
                                  // };
                                  Loader.AnimationLoader(context);
                                  var response =
                                      await ApiManager.invoiceSection(
                                          body: data);
                                  Navigator.pop(context);
                                  // if (response ['StatusCode'] == 200 || response ['statusCode'] == 200) {
                                  //   validationAlert(context,title: response['message'],isShow: false);
                                  //   medicineNameController.clear();
                                  //   batchNoController.clear();
                                  //   quantityController.clear();

                                  //   rateController.clear();
                                  //   discountController.clear();
                                  // }else{
                                  //   validationAlert(context,title: response['message']);
                                  // }
                                }
                                // ApiManager.invoiceSection(body: data);
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: primaryColor,
                                  ),
                                  height: 41,
                                  width: 120,
                                  child: Center(
                                    child: CustomText(
                                        fontsize: 18,
                                        words: "Add",
                                        color: Colors.white),
                                  )))
                        ],
                      ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                      headingRowColor: MaterialStateProperty.all(primaryColor),
                      columnSpacing: !widget.isOpen ? 156 : 118,
                      columns: [
                        DataColumn(
                            label: CustomText(
                                words: "Sr.",
                                color: Colors.white,
                                fontsize: 16)),
                        DataColumn(
                            label: CustomText(
                                words: "Medicine Name",
                                color: Colors.white,
                                fontsize: 16)),
                        DataColumn(
                            label: CustomText(
                                words: "Batch no.",
                                color: Colors.white,
                                fontsize: 16)),
                        DataColumn(
                            label: CustomText(
                                words: "Qty",
                                color: Colors.white,
                                fontsize: 16)),
                        DataColumn(
                            label: CustomText(
                                words: "Rate",
                                color: Colors.white,
                                fontsize: 16)),
                        DataColumn(
                            label: CustomText(
                                words: "Discount",
                                color: Colors.white,
                                fontsize: 16)),
                        DataColumn(
                            label: CustomText(
                                words: "Actions",
                                color: Colors.white,
                                fontsize: 16)),
                      ],
                      rows: [
                        for (int i = 1; i < 4; i++)
                          DataRow(cells: [
                            DataCell(CustomText(words: "1")),
                            DataCell(CustomText(words: "Panadol")),
                            DataCell(CustomText(words: "21053")),
                            DataCell(CustomText(words: "10")),
                            DataCell(CustomText(words: "22.35")),
                            DataCell(CustomText(words: "10%")),
                            DataCell(IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.delete,
                                    color: Color(0xffFF0000)))),
                          ])
                      ]),
                ),
                SizedBox(height: 10),
                Container(
                  height: 1,
                  color: Color(0xff808080),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                        onTap: () {},
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: primaryColor,
                            ),
                            height: 41,
                            width: 120,
                            child: Center(
                              child: CustomText(
                                  fontsize: 18,
                                  words: "Proceed",
                                  color: Colors.white),
                            ))),
                            SizedBox(width: 10,),
                    InkWell(
                        onTap: () {},
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: primaryColor,
                            ),
                            height: 45,
                            width: 110,
                            child: Center(
                              child: CustomText(
                                  fontsize: 18,
                                  words: "Cancel",
                                  color: Colors.white),
                            ))),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

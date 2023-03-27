import 'package:flutter/material.dart';
import 'package:medicine_project/utils/constants.dart';
import 'package:medicine_project/view/widgets.dart';
// import 'package:review_screen/controller/breakpointData.dart';
// import 'package:review_screen/controller/custom_widgets.dart';

class customerHistory extends StatefulWidget {
  const customerHistory({super.key});

  @override
  State<customerHistory> createState() => _customerHistoryState();
}

class _customerHistoryState extends State<customerHistory> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 15, left: 90, right: 70),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                            words: "Customer History",
                            fontsize: 26,
                            fontweight: FontWeight.bold,
                            color: primaryColor),
                        SizedBox(height: 30),
                        Column(children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CustomText(
                                      words: "Name:",
                                      fontsize: 20,
                                      fontweight: FontWeight.bold,
                                      color: primaryColor),
                                  SizedBox(width: size.width * 0.098),
                                  CustomText(
                                      words: "Clinix pharma",
                                      color: Color(0xff9F9F9F)),
                                ],
                              ),
                              SizedBox(width: size.width * 0.34),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      CustomText(
                                          words: "License Number:",
                                          fontsize: 20,
                                          fontweight: FontWeight.bold,
                                          color: primaryColor),
                                      SizedBox(width: size.width * 0.05),
                                      CustomText(
                                          words: "546321",
                                          color: Color(0xff9F9F9F)),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CustomText(
                                      words: "Address",
                                      fontsize: 20,
                                      fontweight: FontWeight.bold,
                                      color: primaryColor),
                                  SizedBox(width: size.width * 0.08),
                                  CustomText(
                                      words: "Samnabad Lahore",
                                      color: Color(0xff9F9F9F)),
                                ],
                              ),
                              SizedBox(width: size.width * 0.328),
                              Row(
                                children: [
                                  CustomText(
                                      words: "Phone No.",
                                      fontsize: 20,
                                      fontweight: FontWeight.bold,
                                      color: primaryColor),
                                  SizedBox(width: size.width * 0.057),
                                  CustomText(
                                      words: "+92316546321",
                                      color: Color(0xff9F9F9F)),
                                ],
                              )
                            ],
                          ),
                        ]),
                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                  dividerThickness: 0.0,
                                  // headingRowColor:
                                  //     MaterialStateProperty.all(primaryColor),
                                  columnSpacing: 148,
                                  columns: [
                                    DataColumn(
                                      label: Padding(
                                          padding: EdgeInsets.only(bottom: 15),
                                          child: CustomText(
                                              fontweight: FontWeight.bold,
                                              words: "Sr",
                                              color: primaryColor)),
                                    ),
                                    DataColumn(
                                      label: Padding(
                                          padding: EdgeInsets.only(bottom: 15),
                                          child: CustomText(
                                              fontweight: FontWeight.bold,
                                              words: "Date",
                                              color: primaryColor)),
                                    ),
                                    DataColumn(
                                      label: Padding(
                                          padding: EdgeInsets.only(bottom: 15),
                                          child: CustomText(
                                              fontweight: FontWeight.bold,
                                              words: "Invoice no#",
                                              color: primaryColor)),
                                    ),
                                    DataColumn(
                                      label: Padding(
                                          padding: EdgeInsets.only(bottom: 15),
                                          child: CustomText(
                                              fontweight: FontWeight.bold,
                                              words: "Gross Total",
                                              color: primaryColor)),
                                    ),
                                    DataColumn(
                                      label: Padding(
                                          padding: EdgeInsets.only(bottom: 15),
                                          child: CustomText(
                                              fontweight: FontWeight.bold,
                                              words: "Status",
                                              color: primaryColor)),
                                    ),
                                    DataColumn(
                                      label: Padding(
                                          padding: EdgeInsets.only(bottom: 15),
                                          child: CustomText(
                                              fontweight: FontWeight.bold,
                                              words: "Actions",
                                              color: primaryColor)),
                                    ),
                                  ],
                                  rows: [
                                    for (int i = 1; i < 8; i++)
                                      DataRow(cells: [
                                        DataCell(CustomText(words: "1")),
                                        DataCell(
                                            CustomText(words: "22-02-2023")),
                                        DataCell(CustomText(words: "21053")),
                                        DataCell(CustomText(words: "10000")),
                                        DataCell(Container(
                                            height: 17,
                                            width: 48,
                                            decoration: BoxDecoration(
                                              color: Color(0xff0FA958),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: Center(
                                              child: CustomText(
                                                  words: "Accepted",
                                                  color: Colors.white,
                                                  fontsize: 10),
                                            ))),
                                        DataCell(Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(Icons.visibility,
                                                      color: primaryColor)),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.download_for_offline,
                                                    color: primaryColor,
                                                  )),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.delete,
                                                    color: Color(0xff960000),
                                                  )),
                                            ])),
                                      ])
                                  ]),
                            ),
                          ],
                        ),
                      ])),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 100, right: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        words: "31 Total",
                        color: primaryColor,
                        fontweight: FontWeight.bold),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.keyboard_double_arrow_left)),
                        CustomText(
                            words: "1",
                            color: primaryColor,
                            fontweight: FontWeight.bold,
                            fontsize: 16),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.keyboard_double_arrow_right)),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

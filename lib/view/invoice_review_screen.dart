import 'package:flutter/material.dart';
import 'package:medicine_project/utils/constants.dart';
import 'package:medicine_project/view/widgets.dart';

import '../utils/break_points.dart';

class InvoiceReviewScreen extends StatefulWidget {
  final isOpen;
  const InvoiceReviewScreen({super.key, this.isOpen});

  @override
  State<InvoiceReviewScreen> createState() => _InvoiceReviewScreenState();
}

class _InvoiceReviewScreenState extends State<InvoiceReviewScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: size.width - (drawerWidth + 60),
        height: size.height * 0.89,
        child: Padding(
            padding:
                const EdgeInsets.only(top: 15, bottom: 8, left: 25, right: 70),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomText(
                  words: "Review",
                  fontsize: 26,
                  fontweight: FontWeight.bold,
                  color: primaryColor),
              SizedBox(height: 20),
              size.width < 700
                  ? customDetailRow()
                  : Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CustomText(
                                  words: "Name",
                                  fontsize: 20,
                                  fontweight: FontWeight.bold,
                                  color: primaryColor),
                              SizedBox(width: size.width * 0.098),
                              CustomText(
                                  words: "Rehan", color: Color(0xff9F9F9F)),
                            ],
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  CustomText(
                                      words: "Date",
                                      fontsize: 20,
                                      fontweight: FontWeight.bold,
                                      color: primaryColor),
                                  SizedBox(width: size.width * 0.15),
                                  CustomText(
                                      words: "DD/MM/YYYY",
                                      color: Color(0xff9F9F9F)),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          Row(
                            children: [
                              CustomText(
                                  words: "License number",
                                  fontsize: 20,
                                  fontweight: FontWeight.bold,
                                  color: primaryColor),
                              SizedBox(width: size.width * 0.1075),
                              CustomText(
                                  words: "546321", color: Color(0xff9F9F9F)),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          CustomText(
                              words: "Phone No.",
                              fontsize: 20,
                              fontweight: FontWeight.bold,
                              color: primaryColor),
                          SizedBox(width: size.width * 0.066),
                          CustomText(
                              words: "+92347494903", color: Color(0xff9F9F9F)),
                        ],
                      ),
                    ]),
              SizedBox(height: 15),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                            headingRowColor:
                                MaterialStateProperty.all(primaryColor),
                            columnSpacing: 148,
                            columns: [
                              DataColumn(
                                  label: CustomText(
                                      words: "Sr.", color: Colors.white)),
                              DataColumn(
                                  label: CustomText(
                                      words: "Medicine Name",
                                      color: Colors.white)),
                              DataColumn(
                                  label: CustomText(
                                      words: "Batch no.", color: Colors.white)),
                              DataColumn(
                                  label: CustomText(
                                      words: "Qty", color: Colors.white)),
                              DataColumn(
                                  label: CustomText(
                                      words: "Rate", color: Colors.white)),
                              DataColumn(
                                  label: CustomText(
                                      words: "Discount", color: Colors.white)),
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
                                ])
                            ]),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: size.width * 0.788,
                    height: 1,
                    color: Color(0xff808080),
                  ),
                  SizedBox(height: 10),
                  size.width < 700
                      ? customButtonsRow()
                      : Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 90, right: 147),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      MaterialButton(
                                          onPressed: () {},
                                          child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: primaryColor,
                                              ),
                                              height: 38,
                                              width: 110,
                                              child: Center(
                                                child: CustomText(
                                                    fontsize: 16,
                                                    words: "Excluding Tax",
                                                    color: Colors.white),
                                              ))),
                                      SizedBox(width: size.width * 0.03),
                                      CustomText(
                                          words: "900",
                                          color: Color(0xff9F9F9F)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      MaterialButton(
                                          onPressed: () {},
                                          child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: primaryColor,
                                              ),
                                              height: 38,
                                              width: 110,
                                              child: Center(
                                                child: CustomText(
                                                    fontsize: 16,
                                                    words: "Discount Rate",
                                                    color: Colors.white),
                                              ))),
                                      SizedBox(width: size.width * 0.03),
                                      CustomText(
                                          words: "15%",
                                          color: Color(0xff9F9F9F)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 15),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 90, right: 140),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      MaterialButton(
                                          onPressed: () {},
                                          child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: primaryColor,
                                              ),
                                              height: 38,
                                              width: 110,
                                              child: Center(
                                                child: CustomText(
                                                    fontsize: 16,
                                                    words: "Including Tax",
                                                    color: Colors.white),
                                              ))),
                                      SizedBox(width: size.width * 0.03),
                                      CustomText(
                                          words: "2560",
                                          color: Color(0xff9F9F9F)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      MaterialButton(
                                          onPressed: () {},
                                          child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: primaryColor,
                                              ),
                                              height: 38,
                                              width: 110,
                                              child: Center(
                                                child: CustomText(
                                                    fontsize: 16,
                                                    words: "Sales Tax",
                                                    color: Colors.white),
                                              ))),
                                      SizedBox(width: size.width * 0.03),
                                      CustomText(
                                          words: "3500",
                                          color: Color(0xff9F9F9F)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 15),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 90, right: 140),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      MaterialButton(
                                          onPressed: () {},
                                          child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: primaryColor,
                                              ),
                                              height: 38,
                                              width: 110,
                                              child: Center(
                                                child: CustomText(
                                                    fontsize: 16,
                                                    words: "Gross Total",
                                                    color: Colors.white),
                                              ))),
                                      SizedBox(width: size.width * 0.03),
                                      CustomText(
                                          words: "5000",
                                          color: Color(0xff9F9F9F)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(right: 82),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  MaterialButton(
                                      onPressed: () {},
                                      child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: primaryColor,
                                          ),
                                          height: 38,
                                          width: 90,
                                          child: Center(
                                            child: CustomText(
                                                fontsize: 16,
                                                words: "Generate",
                                                color: Colors.white),
                                          ))),
                                  SizedBox(width: size.width * 0.03),
                                  MaterialButton(
                                      onPressed: () {},
                                      child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: primaryColor,
                                          ),
                                          height: 38,
                                          width: 90,
                                          child: Center(
                                            child: CustomText(
                                                fontsize: 16,
                                                words: "Cancel",
                                                color: Colors.white),
                                          ))),
                                ],
                              ),
                            )
                          ],
                        )
                ],
              ),
            ])),
      ),
    );
  }
}

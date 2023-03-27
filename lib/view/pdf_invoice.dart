import 'package:flutter/material.dart';
import 'package:medicine_project/utils/heading.dart';
import 'package:medicine_project/view/widgets.dart';

import '../utils/constants.dart';

class pdfView extends StatelessWidget {
  const pdfView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CustomText(
                    words: "NZ Medicine Company",
                    fontFamily: "interSemiBold",
                    fontsize: 25,
                    color: newColor,
                    fontweight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: CustomText(
                words: "Akhri Main Stop, Drogawala, Lahore",
                color: Color(0xff333333),
                fontsize: 13,
                fontFamily: "interSemiBold",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
                child: Container(
                    height: 1, width: size.width * 0.97, color: newColor)),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Row(
                children: [
                  Column(children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      CustomText(
                        words: "Invoice Number:",
                        fontFamily: "interSemiBold",
                        fontsize: 18,
                        fontweight: FontWeight.bold,
                        color: newColor,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CustomText(
                        words: "2256325",
                        fontFamily: "interMedium",
                        fontsize: 18,
                        color: newColor,
                      ),
                    ]),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      CustomText(
                        words: "Date:",
                        fontFamily: "interSemiBold",
                        fontweight: FontWeight.bold,
                        fontsize: 18,
                        color: newColor,
                      ),
                      SizedBox(
                        width: 113,
                      ),
                      CustomText(
                        words: "2256325",
                        fontFamily: "interMedium",
                        fontsize: 18,
                        color: newColor,
                      ),
                    ]),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      CustomText(
                        words: "Customer ID:",
                        fontFamily: "interSemiBold",
                        fontsize: 18,
                        fontweight: FontWeight.bold,
                        color: newColor,
                      ),
                      SizedBox(
                        width: 45,
                      ),
                      CustomText(
                        words: "2256325",
                        fontFamily: "interMedium",
                        fontsize: 18,
                        color: newColor,
                      ),
                    ]),
                  ]),
                  //
                  Spacer(),
                  Column(children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      CustomText(
                        words: "Customer:",
                        fontFamily: "interSemiBold",
                        fontsize: 18,
                        fontweight: FontWeight.bold,
                        color: newColor,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CustomText(
                        words: "Enternal Life Pharmacy",
                        fontFamily: "interMedium",
                        fontsize: 18,
                        color: newColor,
                      ),
                    ]),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      CustomText(
                        words: "Phone no#:",
                        fontFamily: "interSemiBold",
                        fontweight: FontWeight.bold,
                        fontsize: 18,
                        color: newColor,
                      ),
                      SizedBox(
                        width: 90,
                      ),
                      CustomText(
                        words: "3030303033",
                        fontFamily: "interMedium",
                        fontsize: 18,
                        color: newColor,
                      ),
                    ]),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      CustomText(
                        words: "Address:",
                        fontFamily: "interSemiBold",
                        fontsize: 18,
                        fontweight: FontWeight.bold,
                        color: newColor,
                      ),
                      SizedBox(
                        width: 140,
                      ),
                      CustomText(
                        words: "2256325",
                        fontFamily: "interMedium",
                        fontsize: 18,
                        color: newColor,
                      ),
                    ]),
                  ]),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                height: 1,
                width: size.width * 0.97,
                color: Colors.black,
              ),
            ),
            //table
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(dividerThickness: 0, columnSpacing: 125, columns: [
                for (var i = 0; i < pdfHeading.length; i++)
                  DataColumn(
                      label: Expanded(
                    child: Text(
                      "${pdfHeading[i]}",
                      style: TextStyle(
                          color: newColor,
                          fontSize: 15,
                          fontFamily: "interSemiBold",
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ))
              ], rows: [
                //for (var data in stocks!.data!)//
                //for (var i = 0 ; i<stocks![i].stocks!.data!.length;i++)
                for (var i = 0; i < 2; i++)
                  DataRow(cells: [
                    // for (var i = 0; i < dummyText.length; i++)
                    DataCell(
                      Container(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          // "${stocks![i].stocks!.data![i].quantity}",
                          "1",
                          style: TextStyle(fontSize: 16),
                          // textScaleFactor: 1.5,
                        ),
                      ),
                    ),
                    DataCell(Container(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "Mark 20 cab",
                        style: TextStyle(fontSize: 16),
                        // textScaleFactor: 1.5,
                      ),
                    )),
                    DataCell(Container(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        // "${stocks![i].stocks!.data![i].expiryDate}",
                        "12987",
                        style: TextStyle(fontSize: 16),
                        // textScaleFactor: 1.5,
                      ),
                    )),
                    DataCell(Container(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "109",
                        style: TextStyle(fontSize: 16),
                        // textScaleFactor: 1.5,
                      ),
                    )),
                    DataCell(Container(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        // "${stocks![i].stocks!.data![i].batchNo}",
                        "-",
                        style: TextStyle(fontSize: 16),
                        // textScaleFactor: 1.5,
                      ),
                    )),
                    DataCell(Container(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        // "${stocks![i].stocks!.data![i].salePrice}",
                        "10",
                        style: TextStyle(fontSize: 16),
                        // textScaleFactor: 1.5,
                      ),
                    )),
                    DataCell(Container(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        // "${stocks![i].stocks!.data![i].salePrice}",
                        "10%",
                        style: TextStyle(fontSize: 16),
                        // textScaleFactor: 1.5,
                      ),
                    )),
                    DataCell(Container(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        // "${stocks![i].stocks!.data![i].salePrice}",
                        "1090",
                        style: TextStyle(fontSize: 16),
                        // textScaleFactor: 1.5,
                      ),
                    )),
                    DataCell(Container(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        // "${stocks![i].stocks!.data![i].salePrice}",
                        "980",
                        style: TextStyle(fontSize: 16),
                        // textScaleFactor: 1.5,
                      ),
                    )),
                  ]),
              ]),
            ),
      
            Container(
              height: 1,
              width: size.width * 0.97,
              color: Colors.black,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40),
              child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  CustomText(
                    words: "Total Incl Disc:",
                    fontFamily: "interMedium",
                    fontsize: 18,
                    color: newColor,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CustomText(
                    words: "2256325",
                    fontFamily: "interMedium",
                    fontsize: 18,
                    color: newColor,
                  ),
                ]),
                SizedBox(
                  height: 10,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  CustomText(
                    words: "GST@17%:",
                    fontFamily: "interMedium",
                    fontsize: 18,
                    color: newColor,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CustomText(
                    words: "234.00",
                    fontFamily: "interMedium",
                    fontsize: 18,
                    color: newColor,
                  ),
                ]),
                SizedBox(
                  height: 10,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  CustomText(
                    words: "Advance Tax@0.5%:",
                    fontFamily: "interMedium",
                    fontsize: 18,
                    color: newColor,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CustomText(
                    words: "78.00",
                    fontFamily: "interMedium",
                    fontsize: 18,
                    color: newColor,
                  ),
                ]),
                SizedBox(
                  height: 10,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  CustomText(
                    words: "Amount Incl Tax:",
                    fontFamily: "interMedium",
                    fontsize: 18,
                    color: newColor,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CustomText(
                    words: "98721.00",
                    fontFamily: "interMedium",
                    fontsize: 18,
                    color: newColor,
                  ),
                ]),
                SizedBox(
                  height: 10,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  CustomText(
                    words: "Gross Total:",
                    fontFamily: "interMedium",
                    fontsize: 18,
                    color: newColor,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CustomText(
                    words: "98721.00",
                    fontFamily: "interMedium",
                    fontsize: 18,
                    color: newColor,
                  ),
                ]),
              ]),
            ),
      
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  CustomText(
                    words: "Amount in Words:",
                    fontFamily: "interMedium",
                    fontsize: 18,
                    color: newColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CustomText(
                    words: "Ninety-eight thousand seven hundred twenty-one.",
                    fontFamily: "interMedium",
                    fontsize: 14,
                    color: newColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                height: 1,
                width: size.width * 0.97,
                color: newColor,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    words: "Warranty:",
                    fontFamily: "interSemiBold",
                    fontsize: 18,
                    color: newColor,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomText(
                    words:
                        "1, Nazeer Hussain being a resident person in Pakistan.Carring on business at under the name of Nazeer Medicine Company.A distributor agent of a drugs, Akhri Bus Stop,Drogawala described do hereby gives this warranty at the drugs above as solid by the company do not contravene in any way the provision of section 23 of drug Act 1976",
                    fontFamily: "interMedium",
                    fontsize: 14,
                    color: newColor,
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 1,
                            width: 200,
                            color: Colors.black,
                          ),
                          CustomText(
                            words: "NZ Medicine Company",
                            fontFamily: "interSemiBold",
                            fontsize: 18,
                            color: newColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                  CustomText(
                    words: "Note:",
                    fontFamily: "interSemiBold",
                    fontsize: 18,
                    color: newColor,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomText(
                    words:
                        "1. This warranty does not apply to homeopathic,biochemical,herbal and ",
                    fontFamily: "interMedium",
                    fontsize: 14,
                    color: newColor,
                  ),
                  CustomText(
                    words: "Neutrapharma including syringes medical",
                    fontFamily: "interMedium",
                    fontsize: 14,
                    color: newColor,
                  ),
                  CustomText(
                    words: "disposible if any mention in this invoice",
                    fontFamily: "interMedium",
                    fontsize: 14,
                    color: newColor,
                  ),
                  CustomText(
                    words:
                        "2. For Near expiry item we must be inform six month prior to expiry.",
                    fontFamily: "interMedium",
                    fontsize: 14,
                    color: newColor,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

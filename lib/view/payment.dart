import "package:flutter/material.dart";
import 'package:medicine_project/utils/constants.dart';
import 'package:medicine_project/view/widgets.dart';

import '../utils/break_points.dart';
import 'components/table_widgets.dart';
import 'package:intl/intl.dart';
// import 'package:payment/widgets.dart';

class PaymentTable extends StatefulWidget {
  final isOpen, size;
  PaymentTable({this.isOpen, this.size});

  @override
  State<PaymentTable> createState() => _PaymentTableState();
}

class _PaymentTableState extends State<PaymentTable> {
  var selectedDate;
  @override
  // 
  
  Widget build(BuildContext context) {
  var size = MediaQuery.of(context).size;
    return Container(
      width: !widget.isOpen
          ? widget.size.width - 60
          : widget.size.width - (drawerWidth + 60),
      height: widget.size.height - 80,
      // child: CustomTable(),
      // child: PaymentListTable(context, widget.size)
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            
            padding:
                const EdgeInsets.only(top: 15, left: 10, right: 8, bottom: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ 
                    CustomText(
                      words: "Payment Section",
                      fontweight: FontWeight.bold,
                      fontsize: 28,
                      // fontFamily: "roboto",
                      color: primaryColor),
                      Row(children: [CustomTextfield(fillcolor: Color(0xffF7F7F7),
                      filled: true,
                      contentpadding: EdgeInsets.only(left: 10),
                      width: size.width*0.16,
                      hinttext: selectedDate != null ? selectedDate:"dd/mm/yyyy",
                      height: size.height * 0.06,
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
                                    selectedDate = DateFormat("DD/MM/yyyy").format(pickdate);
                                  });
                                }
                              },
                      ),
                      SizedBox(width: size.width*0.013),
                      CustomText(words: "To", fontweight: FontWeight.bold),
                      SizedBox(width: size.width*0.013),
                       CustomTextfield(fillcolor: Color(0xffF7F7F7),
                      contentpadding: EdgeInsets.only(left: 10),
                      filled: true,
                      width: size.width*0.16,
                      hinttext: selectedDate != null ? selectedDate:"dd/mm/yyyy",
                      height: size.height * 0.06,
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
                                    selectedDate = DateFormat("DD/MM/yyyy").format(pickdate);
                                  });
                                }
                              },
                      ),],)
                      ],
                      ),
                  SizedBox(height: 15),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                        headingRowColor: MaterialStateProperty.all(primaryColor),
                        columnSpacing: widget.isOpen? 108: 146,
                        columns: [
                          DataColumn(
                              label:
                                  CustomText(words: "Sr.", color: Colors.white, fontsize: 16)),
                          DataColumn(
                              label: CustomText(
                                  words: "Medicine Name", color: Colors.white, fontsize: 16)),
                          DataColumn(
                              label: CustomText(
                                  words: "Batch no.", color: Colors.white, fontsize: 16)),
                          DataColumn(
                              label:
                                  CustomText(words: "Phone no.", color: Colors.white, fontsize: 16)),
                          DataColumn(
                              label:
                                  CustomText(words: "Rate", color: Colors.white, fontsize: 16)),
                          DataColumn(
                              label: CustomText(
                                  words: "Discount", color: Colors.white, fontsize: 16)),
                          DataColumn(
                              label: CustomText(
                                  words: "Actions", color: Colors.white, fontsize: 16)),
                        ],
                        rows: [
                          for (int i = 1; i < 8; i++)
                            DataRow(cells: [
                              DataCell(CustomText(words: "1")),
                              DataCell(CustomText(words: "Panadol")),
                              DataCell(CustomText(words: "21053")),
                              DataCell(CustomText(words: "+923000000000")),
                              DataCell(CustomText(words: "22.35")),
                              DataCell(CustomText(words: "10%")),
                              DataCell(IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.delete,
                                    color: Color(0xffFF0000)
                                  ))),
                            ])
                        ]),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 1,
                    color: Color(0xff808080),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left:140, right: 140),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Row(children: [
                        CustomText(words: "Total Sale", fontweight: FontWeight.bold),
                        SizedBox(width: size.width*0.01,),
                        CustomText(words: "22.35"),
                       ],),
                       Row(children: [
                        CustomText(words: "Total Sale", fontweight: FontWeight.bold),
                        SizedBox(width: size.width*0.01,),
                        CustomText(words: "22.35"),
                       ],),
                       Row(children: [
                        CustomText(words: "Total Sale", fontweight: FontWeight.bold),
                        SizedBox(width: size.width*0.01,),
                        CustomText(words: "22.35"),
                       ],),
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

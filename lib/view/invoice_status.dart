// import 'package:flutter/material.dart';
// import '/utils/constants.dart';
// import '/view/widgets.dart';

// import '../utils/break_points.dart';
// import '../utils/dialogue_box.dart';
// import 'components/drawer_widgets.dart';
// import 'components/table_widgets.dart';

// class invoiceStatusScreen extends StatefulWidget {
//   final isOpen;
//   const invoiceStatusScreen({this.isOpen});

//   @override
//   State<invoiceStatusScreen> createState() => _invoiceStatusScreenState();
// }

// class _invoiceStatusScreenState extends State<invoiceStatusScreen> {
//   //final person = ["Sr.", "Name", "Batch#", "QTY", "C.P", "S.P", "Actions"];

//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;

//     return Container(
//       width: !widget.isOpen ? size.width : size.width * 0.855,
//       height: size.height * 0.84,
//       decoration: BoxDecoration(color: Color(0xffD2D2D2)),
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(15),
//             child: Container(
//               width: size.width * 0.85,
//               height: size.height * 0.80,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Color(0xffFFFFFF)),
//               child: Padding(
//                 padding: const EdgeInsets.all(30),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         CustomText(
//                             words: "Invoice Status",
//                             color: primaryColor,
//                             fontsize: 35,
//                             fontweight: FontWeight.bold),
//                         Spacer(
//                           flex: 1,
//                         ),
//                         CustomTextfiel(
//                             width: size.width * 0.2,
//                             height: 30,
//                             hinttext: "dd/mm/yy to dd//mm//yy",
//                             hintsize: 12,
//                             filled: true,
//                             fillcolor: Color(0xffD9D9D9)),
//                       ],
//                     ),
//                     // InvoiceStatusTable(size, context),
//                     SizedBox(height: size.height * 0.02),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         CustomText(
//                             words: "Total Customers",
//                             color: primaryColor,
//                             fontsize: 28),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



// // import 'package:flutter/material.dart';
// // import '/utils/constants.dart';
// // import '/view/widgets.dart';

// // import '../utils/dialogue_box.dart';

// // class customerscreen extends StatefulWidget {
// //   const customerscreen({super.key});

// //   @override
// //   State<customerscreen> createState() => _customerscreenState();
// // }

// // class _customerscreenState extends State<customerscreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     var size = MediaQuery.of(context).size;
// //     return Scaffold(
// //       body: Container(
// //         child: Padding(
// //           padding:
// //               const EdgeInsets.only(left: 30, right: 30, top: 22, bottom: 22),
// //           child: Column(
// //             children: [
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   Row(
// //                     children: [
// //                       CustomText(
// //                           words: "Customer List",
// //                           fontsize: 16,
// //                           fontweight: FontWeight.w400),
// //                       SizedBox(width: size.width * 0.013),
// //                       CustomTextfield(
// //                           width: size.width * 0.2,
// //                           height: 30,
// //                           icon: Icon(Icons.search),
// //                           hinttext: "Search by Name",
// //                           hintsize: 12,
// //                           filled: true,
// //                           fillcolor: Color(0xffD9D9D9)),
// //                     ],
// //                   ),
// //                   Row(
// //                     children: [
// //                       CircleAvatar(
// //                         radius: 12,
// //                         backgroundColor: primaryColor,
// //                         child: Center(
// //                           child: Icon(
// //                             Icons.add,
// //                             size: 21,
// //                             color: Colors.white,
// //                           ),
// //                         ),
// //                       ),
// //                       MaterialButton(
// //                         onPressed: () {},
// //                         child: Card(
// //                           elevation: 7,
// //                           child: Container(
// //                             height: 30,
// //                             width: 55,
// //                             child: Center(
// //                                 child: CustomText(
// //                               words: "History",
// //                               fontsize: 13,
// //                             )),
// //                             decoration: BoxDecoration(
// //                               borderRadius: BorderRadius.circular(4),
// //                               color: Color(0xffDADADA),
// //                             ),
// //                           ),
// //                         ),
// //                       )
// //                     ],
// //                   )
// //                 ],
// //               ),
// //               SizedBox(height: size.height * 0.04),
// //               Padding(
// //                 padding: const EdgeInsets.only(left: 15),
// //                 child: Table(
// //                   // defaultColumnWidth: FixedColumnWidth(size.width*0.15),
// //                   columnWidths: {
// //                     0: FlexColumnWidth(size.width * 0.0017),
// //                     1: FlexColumnWidth(size.width * 0.0019),
// //                     2: FlexColumnWidth(size.width * 0.0025),
// //                     3: FlexColumnWidth(size.width * 0.0024),
// //                     4: FlexColumnWidth(size.width * 0.0025),
// //                   },
// //                   children: [
// //                     TableRow(children: [
// //                       Padding(
// //                         padding: EdgeInsets.only(bottom: 33),
// //                         child: CustomText(
// //                             words: "Sr", fontweight: FontWeight.bold),
// //                       ),
// //                       CustomText(words: "User ID", fontweight: FontWeight.bold),
// //                       CustomText(words: "Name", fontweight: FontWeight.bold),
// //                       CustomText(words: "Address", fontweight: FontWeight.bold),
// //                       CustomText(
// //                           words: "Phone no.", fontweight: FontWeight.bold),
// //                       Padding(
// //                           padding: EdgeInsets.only(left: 20),
// //                           child: CustomText(
// //                               words: "Actions", fontweight: FontWeight.bold))
// //                     ]),
// //                     for (int i = 1; i <= 10; i++)
// //                       TableRow(children: [
// //                         CustomText(words: "1"),
// //                         CustomText(words: "1"),
// //                         CustomText(words: "pharmaplus"),
// //                         CustomText(words: "Samnabad"),
// //                         CustomText(words: "+923000000000"),
// //                         Row(
// //                           children: [
// //                             IconButton(
// //                                 onPressed: () {},
// //                                 icon: Icon(
// //                                   Icons.edit,
// //                                   color: Color(0xff9CEFA0),
// //                                 )),
// //                             // SizedBox(width: size.width*0.01),
// //                             IconButton(
// //                                 onPressed: () {
// //                                   showAlertDialog(context);
// //                                 },
// //                                 icon: Icon(Icons.delete,
// //                                     color: Color(0xff960000)))
// //                           ],
// //                         )
// //                       ]),
// //                   ],
// //                 ),
// //               ),
// //               SizedBox(height: size.height * 0.02),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   CustomText(words: "31 Total"),
// //                   TextButton(
// //                       onPressed: () {},
// //                       child:
// //                           CustomText(words: "See More>>", color: Colors.black))
// //                 ],
// //               )
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

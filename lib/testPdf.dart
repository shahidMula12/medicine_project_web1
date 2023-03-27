// import 'package:flutter/material.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as p;
// // import 'package:printing/printing.dart';
// class MyProfile extends StatelessWidget {
// const MyProfile({super.key});

// @override
// Widget build(BuildContext context) {
// return Scaffold(
//   appBar: AppBar(
//     title: const Text('My Profile'),
//   ),
//   body: Center(
//     child: ElevatedButton(
//       onPressed: () async {
//         //List of pdf widgets
//         List<p.Widget> widgets = [];

//         //Profile image
    

//         //container for profile image decoration
//         final container = p.Center(
//           child: p.Container(
            
//             padding: const p.EdgeInsets.all(5),
//             decoration: p.BoxDecoration(
//               shape: p.BoxShape.circle,
//               border: p.Border.all(
//                 color: PdfColors.blue,
//                 width: 10,
//               ),
//             ),
//           ),
//         );
        
//         //add decorated image container to widgets list
//         widgets.add(container);
//         widgets.add(p.SizedBox(height: 20));//some space beneath image

//         //add all other data which may be in the form of list
//         //use a loop to create pdf widget and add it to list
//         //one by one
//         for (int i = 0; i < 4; i++) {
//           widgets.add(
//             p.Text(
//               'Heading',
//               style: p.TextStyle(
//                 fontSize: 25,
//                 fontWeight: p.FontWeight.bold,
//               ),
//             ),
//           );
//           widgets.add(p.SizedBox(height: 5));
//           widgets.add(
//             p.Text(
//               'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed accumsan augue, ut tincidunt lectus. Vestibulum venenatis euismod eros suscipit rhoncus. Sed vulputate congue turpis ut cursus. Proin sollicitudin nulla vel nisi vulputate sagittis. Morbi neque mauris, auctor id posuere eu, egestas porttitor justo. Donec tempus egestas lorem in convallis. Quisque fermentum, augue ut facilisis pretium, risus dolor viverra est, ac consequat tellus risus vitae sapien. ',
//               style: const p.TextStyle(color: PdfColors.grey),
//             ),
//           );
//           widgets.add(p.SizedBox(height: 10));
//         }

//         //pdf document
//         final pdf = p.Document();
//         pdf.addPage(
//           p.MultiPage(
//             pageFormat: PdfPageFormat.a4,
//             build: (context) => widgets,//here goes the widgets list
//           ),
//         );
//         // Printing.layoutPdf(
//         //   onLayout: (PdfPageFormat format) async => pdf.save(),
//         // );
//       },
//       child: const Text('Print'),
//     ),
//   ),
// );
// }
// }




import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:typed_data';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'dart:html' as html;
import 'package:http/http.dart' as http;

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final pdf = pw.Document();
  var anchor;

  

  savePDF() async {
    Uint8List pdfInBytes = await pdf.save();
    final blob = html.Blob([pdfInBytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..style.display = 'none'
      ..download = 'pdf.pdf';
    // html.document.body.children.add(anchor);
  }
String imageStored="asset/images/signat.png";

  createPDF() async {

    // FOR IMAGE THESE TWO LINES WITH HTTP PAKG ALSO IMPORT AS http
        http.Response response = await http.get(Uri.parse(imageStored));
    final image = pw.MemoryImage(response.bodyBytes);
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => 
        pw.Column(children: [
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
            pw.Padding(
                padding: pw.EdgeInsets.all(0),
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Text('NZ Medicine Company',
                          style: pw.TextStyle(fontSize: 25)),
                    ])),
            pw.SizedBox(
              height: 5,
            ),
            pw.Center(
                child: pw.Text("Akhri Main Stop, Drogawala, Lahore",
                    style: pw.TextStyle(fontSize: 13))),
            pw.SizedBox(
              height: 10,
            ),
            pw.Divider(
              thickness: 1,
            ),
            pw.SizedBox(height: 7),
            // pw.Center(
            //     child: pw.Container(
            //         height: 1, width: 970, color: PdfColor)),
            pw.Padding(
              padding: const pw.EdgeInsets.all(0),
              child: pw.Row(
                children: [
                  pw.Column(children: [
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Invoice Number:",
                              style: pw.TextStyle(
                                  fontSize: 12,
                                  fontWeight: pw.FontWeight.bold)),
                          // CustomText(
                          //   words: "Invoice Number:",
                          //   fontFamily: "interSemiBold",
                          //   fontsize: 12,
                          //   fontweight: FontWeight.bold,
                          //   color: newColor,
                          // ),
                          pw.SizedBox(
                            width: 20,
                          ),
                          pw.Text("2256325",
                              style: pw.TextStyle(
                                fontSize: 12,
                              )),
                          // CustomText(
                          //   words: "2256325",
                          //   fontFamily: "interMedium",
                          //   fontsize: 12,
                          //   color: newColor,
                          // ),
                        ]),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Date:",
                              style: pw.TextStyle(
                                  fontSize: 12,
                                  fontWeight: pw.FontWeight.bold)),
                          // CustomText(
                          //   words: "Date:",
                          //   fontFamily: "interSemiBold",
                          //   fontweight: FontWeight.bold,
                          //   fontsize: 12,
                          //   color: newColor,
                          // ),
                          pw.SizedBox(
                            width: 85,
                          ),
                          pw.Text("2256325",
                              style: pw.TextStyle(
                                fontSize: 12,
                              )),
                          // CustomText(
                          //   words: "2256325",
                          //   fontFamily: "interMedium",
                          //   fontsize: 12,
                          //   color: newColor,
                          // ),
                        ]),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Customer ID:",
                              style: pw.TextStyle(
                                  fontSize: 12,
                                  fontWeight: pw.FontWeight.bold)),
                          // CustomText(
                          //   words: "Customer ID:",
                          //   fontFamily: "interSemiBold",
                          //   fontsize: 12,
                          //   fontweight: FontWeight.bold,
                          //   color: newColor,
                          // ),
                          pw.SizedBox(
                            width: 40,
                          ),
                          pw.Text("2256325",
                              style: pw.TextStyle(
                                fontSize: 12,
                              )),
                          // CustomText(
                          //   words: "2256325",
                          //   fontFamily: "interMedium",
                          //   fontsize: 12,
                          //   color: newColor,
                          // ),
                        ]),
                  ]),
                  //
                  pw.Spacer(),
                  pw.Column(children: [
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Customer:",
                              style: pw.TextStyle(
                                  fontSize: 12,
                                  fontWeight: pw.FontWeight.bold)),
                          // CustomText(
                          //   words: "Customer:",
                          //   fontFamily: "interSemiBold",
                          //   fontsize: 12,
                          //   fontweight: FontWeight.bold,
                          //   color: newColor,
                          // ),
                          pw.SizedBox(
                            width: 20,
                          ),
                          pw.Text("Enternal Life Pharmacy",
                              style: pw.TextStyle(
                                fontSize: 12,
                              )),
                          // CustomText(
                          //   words: "Enternal Life Pharmacy",
                          //   fontFamily: "interMedium",
                          //   fontsize: 12,
                          //   color: newColor,
                          // ),
                        ]),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Phone no#",
                              style: pw.TextStyle(
                                  fontSize: 12,
                                  fontWeight: pw.FontWeight.bold)),
                          // CustomText(
                          //   words: "Phone no#:",
                          //   fontFamily: "interSemiBold",
                          //   fontweight: FontWeight.bold,
                          //   fontsize: 12,
                          //   color: newColor,
                          // ),
                          pw.SizedBox(
                            width: 68,
                          ),
                          pw.Text("03030303333",
                              style: pw.TextStyle(
                                fontSize: 12,
                              )),
                          // CustomText(
                          //   words: "3030303033",
                          //   fontFamily: "interMedium",
                          //   fontsize: 12,
                          //   color: newColor,
                          // ),
                        ]),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Address:",
                              style: pw.TextStyle(
                                  fontSize: 12,
                                  fontWeight: pw.FontWeight.bold)),
                          // CustomText(
                          //   words: "Address:",
                          //   fontFamily: "interSemiBold",
                          //   fontsize: 12,
                          //   fontweight: FontWeight.bold,
                          //   color: newColor,
                          // ),
                          pw.SizedBox(
                            width: 103,
                          ),
                          pw.Text("2256325",
                              style: pw.TextStyle(
                                fontSize: 12,
                              )),
                          // CustomText(
                          //   words: "2256325",
                          //   fontFamily: "interMedium",
                          //   fontsize: 12,
                          //   color: newColor,
                          // ),
                        ]),
                  ]),
                ],
              ),
            ),
            pw.SizedBox(
              height: 6,
            ),
            pw.Divider(thickness: 1),
            // pw.Center(
            //   child: pw.Container(
            //     height: 1,
            //     width: 970,
            //     // color: Colors.black,
            //   ),
            // ),
            pw.Table(
                //  defaultColumnWidth: pw.FixedColumnWidth(0.003),
                children: [
                  pw.TableRow(children: [
                    pw.Text(
                      "Sr",
                      style: pw.TextStyle(
                          fontSize: 12.0, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.SizedBox(width: 7),
                    pw.Text(
                      "Prdoduct Name",
                      style: pw.TextStyle(
                          fontSize: 12.0, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.SizedBox(width: 7),
                    pw.Text(
                      "Batch no.",
                      style: pw.TextStyle(
                          fontSize: 12.0, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.SizedBox(width: 5),
                    pw.Text(
                      "Unit Price",
                      style: pw.TextStyle(
                          fontSize: 12.0, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.SizedBox(width: 7),
                    pw.Text(
                      "Bonus",
                      style: pw.TextStyle(
                          fontSize: 12.0, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.SizedBox(width: 7),
                    pw.Text(
                      "Qty",
                      style: pw.TextStyle(
                          fontSize: 12.0, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.SizedBox(width: 7),
                    pw.Text(
                      "Disc%",
                      style: pw.TextStyle(
                          fontSize: 12.0, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.SizedBox(width: 7),
                    pw.Text(
                      "Excl Disc",
                      style: pw.TextStyle(
                          fontSize: 12.0, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.SizedBox(width: 7),
                    pw.Text(
                      "Incl Disk",
                      style: pw.TextStyle(
                          fontSize: 12.0, fontWeight: pw.FontWeight.bold),
                    ),
                  ]),

                  // 2nd Row
                  for(int i=1; i<7;i++)
                   pw.TableRow(children: [
                   pw.Padding(padding: pw.EdgeInsets.only(top: 7), child:  pw.Text(
                      "1",
                      style: pw.TextStyle(
                          fontSize: 12.0, ),
                    ),),
                    pw.SizedBox(width: 7),
                   pw.Padding(padding: pw.EdgeInsets.only(top: 7), child:  pw.Text(
                      "Mark 20 cab",
                      style: pw.TextStyle(
                          fontSize: 12.0, ),
                    ),),
                    pw.SizedBox(width: 7),
                   pw.Padding(padding: pw.EdgeInsets.only(top: 7), child:  pw.Text(
                      "12987",
                      style: pw.TextStyle(
                          fontSize: 12.0, ),
                    ),),
                    pw.SizedBox(width: 5),
                   pw.Padding(padding: pw.EdgeInsets.only(top: 7), child:  pw.Text(
                      "109",
                      style: pw.TextStyle(
                          fontSize: 12.0, ),
                    ),),
                    pw.SizedBox(width: 7),
                   pw.Padding(padding: pw.EdgeInsets.only(top: 7), child:  pw.Text(
                      "-",
                      style: pw.TextStyle(
                          fontSize: 12.0, ),
                    ),),
                    pw.SizedBox(width: 7),
                   pw.Padding(padding: pw.EdgeInsets.only(top: 7), child:  pw.Text(
                      "10",
                      style: pw.TextStyle(
                          fontSize: 12.0, ),
                    ),),
                    pw.SizedBox(width: 7),
                   pw.Padding(padding: pw.EdgeInsets.only(top: 7), child:  pw.Text(
                      "10%",
                      style: pw.TextStyle(
                          fontSize: 12.0, ),
                    ),),
                    pw.SizedBox(width: 7),
                   pw.Padding(padding: pw.EdgeInsets.only(top: 7), child:  pw.Text(
                      "1090",
                      style: pw.TextStyle(
                          fontSize: 12.0, ),
                    ),),
                    pw.SizedBox(width: 7),
                  pw.Padding(padding: pw.EdgeInsets.only(top: 7), child:  pw.Text(
                      "980",
                      style: pw.TextStyle(
                          fontSize: 12.0, ),
                    ),),
                  ])
                ]),
                pw.SizedBox(height: 45),
                pw.Divider(thickness: 1),
                pw.SizedBox(height: 8),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.end,
                  children: [
                  pw.Text(
                      "Total Incl disc:",
                      style: pw.TextStyle(
                          fontSize: 12.0,
                          fontWeight: pw.FontWeight.bold ),
                    ),
                    pw.SizedBox(width: 78),
                     pw.Text(
                      "98721.00",
                      style: pw.TextStyle(
                          fontSize: 12.0,
                          ),
                    )
                ],),
                pw.SizedBox(height: 9),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.end,
                  children: [
                  pw.Text(
                      "GST @17%:",
                      style: pw.TextStyle(
                          fontSize: 12.0,
                          fontWeight: pw.FontWeight.bold ),
                    ),
                    pw.SizedBox(width: 108),
                     pw.Text(
                      "234.00",
                      style: pw.TextStyle(
                          fontSize: 12.0,
                          ),
                    )
                ],),
                pw.SizedBox(height: 9),pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.end,
                  children: [
                  pw.Text(
                      "Advance Tax @0.5%:",
                      style: pw.TextStyle(
                          fontSize: 12.0,
                          fontWeight: pw.FontWeight.bold ),
                    ),
                    pw.SizedBox(width: 62),
                     pw.Text(
                      "78.00",
                      style: pw.TextStyle(
                          fontSize: 12.0,
                          ),
                    )
                ],),
                pw.SizedBox(height: 9),pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.end,
                  children: [
                  pw.Text(
                      "Amount Incl Tax:",
                      style: pw.TextStyle(
                          fontSize: 12.0,
                          fontWeight: pw.FontWeight.bold ),
                    ),
                    pw.SizedBox(width: 64),
                     pw.Text(
                      "98721.00",
                      style: pw.TextStyle(
                          fontSize: 12.0,
                          ),
                    )
                ],),
                pw.SizedBox(height: 9),pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.end,
                  children: [
                  pw.Text(
                      "Gross Total:",
                      style: pw.TextStyle(
                          fontSize: 12.0,
                          fontWeight: pw.FontWeight.bold ),
                    ),
                    pw.SizedBox(width: 91),
                     pw.Text(
                      "98721.00",
                      style: pw.TextStyle(
                          fontSize: 12.0,
                          ),
                    )
                ],),
                pw.SizedBox(height: 11),
                pw.Row(
                  // mainAxisAlignment: pw.MainAxisAlignment.end,
                  children: [
                  pw.Text(
                      "Amount in Words:",
                      style: pw.TextStyle(
                          fontSize: 12.0,
                          fontWeight: pw.FontWeight.bold ),
                    ),
                    pw.SizedBox(width: 25),
                     pw.Text(
                      "Ninety-eight thousand seven hundred twenty-one.",
                      style: pw.TextStyle(
                          fontSize: 12.0,
                          ),
                    )
                ],),
                pw.SizedBox(height: 11),
                pw.Divider(thickness: 1),
                pw.SizedBox(height: 11),
               pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      "Warranty:",
                      style: pw.TextStyle(
                          fontSize: 12.0,
                          fontWeight: pw.FontWeight.bold
                          ),
                    ),
                pw.SizedBox(height: 11),
                 pw.Text(
                      "I, Nazeer Hussain being a resident person in Pakistan.",
                      style: pw.TextStyle(
                          fontSize: 12.0,
                          ),),
                           pw.Text(
                      "Carrying on business at under the name of Nazeer Medicine",
                      style: pw.TextStyle(
                          fontSize: 12.0,
                          ),),
                           pw.Text(
                      "Company.A distributor agent of drugs, Akhri bus stop.",
                      style: pw.TextStyle(
                          fontSize: 12.0,
                          ),),
                           pw.Text(
                      "Give this Warrnty at the drug as sold by the company,",
                      style: pw.TextStyle(
                          fontSize: 12.0,
                          ),),
                        
                             pw.Text(
                      "NZ Medicine Company",
                      style: pw.TextStyle(
                          fontSize: 8.0,
                          ),),
                          
                          pw.SizedBox(height: 13),
                           pw.Text(
                      "Note:",
                      style: pw.TextStyle(
                        decoration: pw.TextDecoration.underline,
                          fontSize: 12.0,
                          fontWeight: pw.FontWeight.bold
                          ),
                    ),
                pw.SizedBox(height: 7),
                 pw.Text(
                      "1. This warranty does not belong to homeopathic, biochemical,",
                      style: pw.TextStyle(
                          fontSize: 12.0,
                          ),),
                           pw.Text(
                      "herbal and Neutrapharma including syringes medical",
                      style: pw.TextStyle(
                          fontSize: 12.0,
                          ),),
                           pw.Text(
                      "disposible if any mention in this voice.",
                      style: pw.TextStyle(
                          fontSize: 12.0,
                          ),),
                           pw.Text(
                      "2. For near expiry item we must be inform six month prior to expiry.",
                      style: pw.TextStyle(
                          fontSize: 12.0,
                          ),),
                ],),


                
                // 2nd column for pic
              pw.Container(height: 180, child:   pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                     pw.Container(
                        height: 30,
                        width: 60,
                        decoration: pw.BoxDecoration(
                            borderRadius: pw.BorderRadius.circular(10),
                            image: pw.DecorationImage(
                                image: pw.MemoryImage(image.bytes))),
                      ),
                     pw.Container(width: 120,child:  pw.Divider(thickness: 1,),),
                      pw.Text(
                      "NZ Medicine Company",
                      style: pw.TextStyle(
                          fontSize: 8.0,
                          ),)
                ]))
               ],)
          ]),
        ]),
      ),
    );

    // pdf.addPage(
    //   pw.Page(
    //     build: (pw.Context context) => 
    //     pw.Text("ok", style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold))
    //   ));

    savePDF();
  }

  @override
  void initState() {
    super.initState();
    createPDF();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('PDF Creator'),
        ),
        body: Center(
            child: ElevatedButton(
          child: Text('Press'),
          onPressed: () {
            anchor.click();
            Navigator.pop(context);
            createPDF();
          },
        )));
  }
}
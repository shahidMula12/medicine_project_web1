import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:typed_data';
import 'dart:html' as html;

class PDFSave extends StatefulWidget {
  @override
  _PDFSaveState createState() => _PDFSaveState();
}

class _PDFSaveState extends State<PDFSave> {
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
  }

  createPDF() async {
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          children: [
            pw.Text('Hello World', style: pw.TextStyle(fontSize: 40)),
          ],
        ),
      ),
    );
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
          },
        )));
  }
}

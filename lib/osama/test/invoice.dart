import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

// import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;



class Invoice {
  final String id,
      paymentAddress,
      paymentName,
      paymentPhone,
      shippingAddress,
      shippingName,
      shippingPhone,
      time,
      shippingNote;
  final List<Product> _products;

  final String footerNote =
      'if you have any questions about this invoice, please call us: 0111 812 7345';
  final double shippingCost = 50;
  double total = 0;

  static const pw.BoxDecoration containerDecoration = pw.BoxDecoration(
      border: pw.BoxBorder(
          top: true,
          left: true,
          right: true,
          bottom: true,
          color: PdfColors.black));

  Invoice(
      {@required products,
      @required this.id,
      @required this.time,
      @required this.paymentAddress,
      @required this.paymentName,
      @required this.paymentPhone,
      @required this.shippingAddress,
      @required this.shippingName,
      @required this.shippingPhone,
      @required this.shippingNote})
      : _products = products;

  pw.Widget _buildHeader(pw.Context context) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.center,
      children: [
        pw.Flexible(child: pw.Image(_logo), flex: 4),
        pw.SizedBox(width: 20.0),
        pw.Flexible(
            flex: 6,
            child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                children: [
                  pw.Row(children: [
                    headerContainer('Invoice #', context, background: true),
                    headerContainer('Date', context, background: true),
                  ]),
                  pw.Row(children: [
                    headerContainer(id, context, isBold: false),
                    headerContainer(time, context, isBold: false)
                  ])
                ]))
      ],
    );
  }

  pw.Widget _buildBody(pw.Context context) {
    return pw.Padding(
        padding: const pw.EdgeInsets.symmetric(vertical: 20.0),
        child: pw.Row(
          children: [
            pw.Expanded(
                child: pw.Container(
                    padding:
                        const pw.EdgeInsets.only(top: 8, bottom: 8, left: 8),
                    decoration: containerDecoration,
                    child: pw.Column(
                      children: [
                        pw.Center(
                          child: pw.Text('PAYMENT ADDRESS',
                              style: pw.TextStyle(
                                  fontSize: 12,
                                  fontWeight: pw.FontWeight.bold)),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Row(children: [
                          pw.Flexible(
                              child: pw.Column(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.SizedBox(height: 10),
                                pw.Text('NAME:'),
                                pw.SizedBox(
                                    height: 130.0, child: pw.Text('ADDRESS:')),
                                pw.Text('PHONE NUMBER:'),
                                    pw.SizedBox(height: 15),
                              ])),
                          pw.SizedBox(width: 10),
                          pw.Flexible(
                              flex: 3,
                              child: pw.Column(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.center,
                                  children: [
                                    pw.Center(child: pw.Text(paymentName,textDirection: pw.TextDirection.rtl)),
                                    pw.Container(
                                        decoration: containerDecoration,
                                        height: 120,
                                        width: double.infinity,
                                        child: pw.Padding(
                                                padding:
                                                    const pw.EdgeInsets.all(4),
                                                child:
                                                    pw.Text(paymentAddress,textDirection: pw.TextDirection.rtl))),
                                    pw.Text(paymentPhone),
                                  ]))
                        ]),
                      ],
                    ))),
            ////////////////
            pw.Expanded(
                child: pw.Container(
                    padding:
                        const pw.EdgeInsets.only(top: 8, bottom: 8, left: 8),
                    decoration: containerDecoration,
                    child: pw.Column(
                      children: [
                        pw.Center(
                          child: pw.Text('SHIPPING ADDRESS',
                              style: pw.TextStyle(
                                  fontSize: 12,
                                  fontWeight: pw.FontWeight.bold)),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Row(children: [
                          pw.Flexible(
                              child: pw.Column(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.SizedBox(height: 10),
                                pw.Text('NAME:'),
                                pw.SizedBox(
                                    height: 130, child: pw.Text('ADDRESS:')),
                                pw.Text('PHONE NUMBER:'),
                                    pw.Text('NOTE:'),
                              ])),
                          pw.SizedBox(width: 10),
                          pw.Flexible(
                              flex: 3,
                              child: pw.Column(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.center,
                                  children: [
                                    pw.Center(child: pw.Text(shippingName,textDirection: pw.TextDirection.rtl)),
                                    pw.Container(
                                        decoration: containerDecoration,
                                        height: 120,
                                        width: double.infinity,
                                        child: pw.Padding(
                                                padding:
                                                    const pw.EdgeInsets.all(4),
                                                child:
                                                    pw.Text(shippingAddress,textDirection: pw.TextDirection.rtl))),
                                    pw.Text(shippingPhone),
                                    pw.Text(shippingNote,textDirection: pw.TextDirection.rtl),
                                  ]))
                        ]),
                      ],
                    ))),
          ],
        ));
  }

  pw.Widget _buildFooter(pw.Context context) {
    return pw.Center(child: pw.Text(footerNote));
  }

  pw.Widget _contentTable(pw.Context context) {
    const tableHeaders = [
      'QTY',
      'DESCRIPTION',
      'UNIT PRICE',
      'AMOUNT',
    ];

    int totalQty = 0 ; _products.forEach((element) => totalQty += element.qty);
    _products.forEach((element)=> total+= (element.amount) );

    return pw.Table.fromTextArray(
      border: pw.TableBorder(
        top: true,
        left: true,
        right: true,
        bottom: true,
        color: PdfColors.black,
      ),
      cellAlignment: pw.Alignment.center,
      headerDecoration: pw.BoxDecoration(
        color: PdfColors.grey300,
      ),
      headerHeight: 25,
      cellHeight: 30,
      // cellAlignments: {
      //   0: pw.Alignment.centerLeft,
      //   1: pw.Alignment.centerLeft,
      //   2: pw.Alignment.centerRight,
      //   3: pw.Alignment.center,
      // },
      headerStyle: pw.TextStyle(
        color: PdfColors.black,
        fontSize: 10,
        fontWeight: pw.FontWeight.bold,
      ),
      cellStyle: const pw.TextStyle(
        color: PdfColors.black,
        fontSize: 10,
      ),
      rowDecoration: pw.BoxDecoration(
        border: pw.BoxBorder(
          right: true,
          width: 0.5,
        ),
      ),
      headers: List<String>.generate(
        tableHeaders.length,
        (col) => tableHeaders[col],
      ),
      data: List<List<String>>.generate(
        _products.length,
        (row) => List<String>.generate(
          tableHeaders.length,
          (col) => _products[row].getIndex(col),
        ),
      )..add(['','SHIPPING', '','$shippingCost'])..add(['$totalQty','TOTAL', '','${(total+shippingCost)}']),
    );
  }

  pw.Widget buildTotal(pw.Context context){
    int totalQty = 0 ; _products.forEach((element) => totalQty += element.qty);
    _products.forEach((element)=> total+= (element.amount) );
    return pw.Expanded(child: pw.Container(height: 30,decoration: containerDecoration, child: pw.Row(children: [
      pw.Expanded(child: pw.Container(decoration: pw.BoxDecoration(border: pw.BoxBorder(right: true, width: 1)), child: pw.Center(child: pw.Text('$totalQty')))),
      pw.Expanded(child: pw.Container(decoration: pw.BoxDecoration(border: pw.BoxBorder(right: true, width: 1)), child: pw.Center(child: pw.Text('Total')))),
      pw.Expanded(child: pw.Container(decoration: pw.BoxDecoration(border: pw.BoxBorder(right: true, width: 1)), child: pw.Center(child: pw.Text('')))),
      pw.Expanded(child: pw.Container(decoration: pw.BoxDecoration(border: pw.BoxBorder(right: true, width: 1)), child: pw.Center(child: pw.Text('$total')))),
    ])));
  }

  pw.Widget headerContainer(String title, pw.Context context,
      {fontSize = 12.0, bool background = false, isBold = true}) {
    return pw.Expanded(
        child: pw.Container(
            // color: background ? PdfColors.grey300 : null,
            decoration: pw.BoxDecoration(
                color: background ? PdfColors.grey300 : PdfColors.white,
                border: pw.BoxBorder(
                    top: true,
                    left: true,
                    right: true,
                    bottom: true,
                    color: PdfColors.black)),
            child: pw.Center(
                child: pw.Text(title,
                    style: pw.TextStyle(
                        color: PdfColors.black,
                        fontSize: fontSize,
                        fontWeight: isBold
                            ? pw.FontWeight.bold
                            : pw.FontWeight.normal)))));
  }

  pw.PageTheme _buildTheme(
      PdfPageFormat pageFormat, pw.Font base, pw.Font bold, pw.Font italic) {
    return pw.PageTheme(
      pageFormat: pageFormat,
      theme: pw.ThemeData.withFont(
        base: base,
        bold: bold,
        italic: italic,
      ),
    );
  }

  PdfImage _logo;

  Future<Uint8List> buildPdf(PdfPageFormat pageFormat) async {
    // Create a PDF document.
    final doc = pw.Document();

    final font1 = await rootBundle.load('assets/fonts/ArialUnicodeMS.ttf');
    final font2 = await rootBundle.load('assets/fonts/Amiri/Amiri-Bold.ttf');
    final font3 = await rootBundle.load('assets/fonts/Amiri/Amiri-Italic.ttf');

    _logo = PdfImage.file(
      doc.document,
      bytes: (await rootBundle.load('assets/images/logo.png'))
          .buffer
          .asUint8List(),
    );

    // Add page to the PDF
    doc.addPage(
      pw.MultiPage(
        pageTheme: _buildTheme(
          pageFormat,
          font1 != null ? pw.Font.ttf(font1) : null,
          font2 != null ? pw.Font.ttf(font2) : null,
          font3 != null ? pw.Font.ttf(font3) : null,
        ),
        header: _buildHeader,
         footer: _buildFooter,
        build: (context) => [
          _buildBody(context),
          _contentTable(context),
          // buildTotal(context),
          //   _contentHeader(context),
          //   _contentTable(context),
          //   pw.SizedBox(height: 20),
          //   _contentFooter(context),
          //   pw.SizedBox(height: 20),
          //   _termsAndConditions(context),
        ],
      ),
    );

    // Return the PDF file content
    return doc.save();
  }
}

class Product {
  final int qty;

  final String name;
  final double price, amount;

  Product(
      {@required this.qty,
      @required this.name,
      @required this.price,
      @required this.amount});

  String getIndex(int index) {
    switch (index) {
      case 0:
        return '$qty';
      case 1:
        return name;
      case 2:
        return price.toStringAsFixed(2);
      case 3:
        return amount.toStringAsFixed(2);
    }
    return '';
  }
}

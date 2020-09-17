import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:url_launcher/url_launcher.dart' as ul;

import 'invoice.dart';
// import 'ptint_invoice.dart';

class TestInvoice extends StatefulWidget {
  final String paymentName,
      shippingName,
      shippingAddress,
      paymentAddress,
      paymentPhone,
      id,
      shippingNote,
      shippingPhone,
      time;

  final List<Product> _products;

  const TestInvoice({
    @required this.paymentName,
    @required this.shippingName,
    @required this.shippingAddress,
    @required this.paymentAddress,
    @required this.paymentPhone,
    @required this.id,
    @required this.shippingNote,
    @required this.shippingPhone,
    @required this.time,
    @required products,
  }) : _products = products;

  Future<Uint8List> generateInvoice(PdfPageFormat pageFormat) async {
    final invoice = Invoice(
      paymentName: paymentName,
      shippingName: shippingName,
      shippingAddress: shippingAddress,
      paymentAddress: paymentAddress,
      products: _products,
      paymentPhone: paymentPhone,
      id: id,
      shippingNote: shippingNote,
      shippingPhone: shippingPhone,
      time: time,
    );

    return await invoice.buildPdf(pageFormat);
  }

  @override
  TestInvoiceState createState() {
    return TestInvoiceState();
  }
}

class TestInvoiceState extends State<TestInvoice>
    with SingleTickerProviderStateMixin {
  PrintingInfo printingInfo;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final PrintingInfo info = await Printing.info();
    setState(() {
      printingInfo = info;
    });
  }

  void _showPrintedToast(BuildContext context) {
    final ScaffoldState scaffold = Scaffold.of(context);

    scaffold.showSnackBar(
      const SnackBar(
        content: Text('Document printed successfully'),
      ),
    );
  }

  void _showSharedToast(BuildContext context) {
    final ScaffoldState scaffold = Scaffold.of(context);

    scaffold.showSnackBar(
      const SnackBar(
        content: Text('Document shared successfully'),
      ),
    );
  }

  Future<void> _saveAsFile(
    BuildContext context,
    LayoutCallback build,
    PdfPageFormat pageFormat,
  ) async {
    final Uint8List bytes = await build(pageFormat);

    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String appDocPath = appDocDir.path;
    final File file = File(appDocPath + '/' + 'document.pdf');
    print('Save as file ${file.path} ...');
    await file.writeAsBytes(bytes);
    OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    pw.RichText.debug = true;

    // if (_tabController == null) {
    //   return const Center(child: CircularProgressIndicator());
    // }

    final actions = <PdfPreviewAction>[
      if (!kIsWeb)
        PdfPreviewAction(
          icon: const Icon(Icons.save),
          onPressed: _saveAsFile,
        )
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          title: const Text(
            'Invoice view',
            style: TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 7,
          centerTitle: true,
        ),
      ),
      body: PdfPreview(
        maxPageWidth: 700,
        build: widget.generateInvoice,
        actions: actions,
        onPrinted: _showPrintedToast,
        onShared: _showSharedToast,
      ),
    );
  }
}

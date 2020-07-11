import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

enum PaymentType { Cash, Credit, CashAndCredit }

class AddExpense extends StatefulWidget {
  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final suplierNameController = TextEditingController();
  List<File> attachments = [];
  final amountController = TextEditingController();
  PaymentType type = PaymentType.Cash;
  final userName = 'Ahmed Amr';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          elevation: 10,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Image.asset(
            'assets/images/logo.png',
            width: 150,
          ),
        ),
        body: Container(
          width: size.width,
          height: size.height / 1.2,
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                  color: Colors.white,
                  child: ListTile(
                    title: Text(
                      'Add New Expenses',
                      style: TextStyle(
                          color: Color.fromRGBO(170, 44, 94, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  )),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                padding: EdgeInsets.only(left: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'User Name',
                      style: TextStyle(
                          color: Color.fromRGBO(
                              96, 125, 130, 1), //rgb(96, 125, 130)
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Text(
                      'Date: 18/5/2020',
                      style: TextStyle(
                          color: Color.fromRGBO(96, 125, 130, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 2,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Supplier Name',
                      style: TextStyle(
                          color: Color.fromRGBO(
                              170, 44, 94, 1), //rgb(96, 125, 130)
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                      child: Divider(
                        color: Colors.black,
                        thickness: 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: Colors.grey[400].withOpacity(0.9)),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller: suplierNameController,
                          decoration: InputDecoration(
                              hintText: 'Write here',
                              contentPadding: EdgeInsets.only(left: 10),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 2,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Attachment',
                          style: TextStyle(
                              color: Color.fromRGBO(
                                  170, 44, 94, 1), //rgb(96, 125, 130)
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        InkWell(
                          onTap: () async {
                            print('Select Source');
                            final type = await showDialog(
                                context: context,
                                child: AlertDialog(
                                  title: Text('Select Source'),
                                  actions: <Widget>[
                                    FlatButton.icon(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(ImageSource.gallery);
                                      },
                                      icon: Icon(Icons.filter),
                                      label: Text('Gallery'),
                                    ),
                                    FlatButton.icon(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(ImageSource.camera);
                                      },
                                      icon: Icon(Icons.camera_alt),
                                      label: Text('Camera'),
                                    ),
                                  ],
                                ));
                            PickedFile image =
                                await ImagePicker().getImage(source: type);
                            final file = File(image.path);
                            attachments.add(file);
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.grey[400], width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.add,
                                size: 25,
                                color: Color.fromRGBO(96, 125, 129, 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                      child: Divider(
                        color: Colors.black,
                        thickness: 2,
                      ),
                    ),
                    /*Expanded(
                        child: ListView.builder(
                      itemBuilder: (ctx, index) {
                        return Text('${attachments[index].path}');
                      },
                      itemCount: attachments.length,
                    ))*/
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 2,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Amount',
                      style: TextStyle(
                          color: Color.fromRGBO(
                              170, 44, 94, 1), //rgb(96, 125, 130)
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                      child: Divider(
                        color: Colors.black,
                        thickness: 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: Colors.grey[400].withOpacity(0.9)),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller: amountController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: 'Write here',
                              contentPadding: EdgeInsets.only(left: 10),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey[400], width: 2),
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.all(12),
                child: Column(
                  children: [
                    CheckboxListTile(
                      value: type == PaymentType.Cash,
                      onChanged: (v) {
                        setState(() {
                          if (v) type = PaymentType.Cash;
                        });
                      },
                      title: Text("Cash"),
                      activeColor: Colors.orange,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 18,
                      ),
                      child: Divider(
                        color: Colors.black,
                        thickness: 2,
                      ),
                    ),
                    CheckboxListTile(
                      value: type == PaymentType.Credit,
                      onChanged: (v) {
                        setState(() {
                          if (v) type = PaymentType.Credit;
                        });
                      },
                      title: Text("Credit"),
                      activeColor: Colors.orange,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 18,
                      ),
                      child: Divider(
                        color: Colors.black,
                        thickness: 2,
                      ),
                    ),
                    CheckboxListTile(
                      value: type == PaymentType.CashAndCredit,
                      onChanged: (v) {
                        if (v) type = PaymentType.CashAndCredit;
                      },
                      title: Text("Cash and Credit"),
                      activeColor: Colors.orange,
                    ),
                  ],
                ),
              ),
              loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : InkWell(
                      onTap: () async {
                        print(attachments);
                        print(suplierNameController.text);
                        print(amountController.value.text);
                        if (suplierNameController.text.isEmpty ||
                            amountController.value.text.isEmpty) {
                          print('Complete all filed');
                          return;
                        }
                        setState(() {
                          loading = true;
                        });
                        StorageReference reference = FirebaseStorage().ref();
                        List<String> imageUrls = [];
                        attachments.forEach((element) async {
                          final task = reference.child('images').putFile(element);
                          final storage = await task.onComplete;
                          final url = await storage.ref.getDownloadURL();
                          imageUrls.add(url);
                        });
                        final date = DateFormat.yMd().format(DateTime.now());
                        final int amount = int.parse(amountController.text);
                        final document = {
                          'userName': userName,
                          'date': date,
                          'supplier': suplierNameController.text,
                          'amount': amount,
                          'attachments': imageUrls,
                          'approved':false,
                        };
                        await Firestore.instance
                            .collection('expenses')
                            .add(document);
                        await showDialog(
                          context: context,
                          child: AlertDialog(
                            title: Text('Task Complete'),
                            content: Text(
                                'The Expenses has been added successfully'),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'OK',
                                ),
                              )
                            ],
                          ),
                        );
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        color: Color.fromRGBO(170, 44, 94, 1),
                        width: size.width,
                        height: 50,
                        child: Center(
                          child: Text(
                            'ADD',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ));
  }
}

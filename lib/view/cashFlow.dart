import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CashFlow extends StatefulWidget {
  @override
  _CashFlowState createState() => _CashFlowState();
}

class _CashFlowState extends State<CashFlow> {
  double cashOut = 0;
  double cashIn = 0;
  double net = 3000;
  TextEditingController collectedAmount = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection('expenses')
            .where('approved', isEqualTo: false)
            .snapshots(),
        builder: (context, expensesSnapshot) {
          expensesSnapshot.data.documents.forEach((element) {
            cashOut += double.parse(element.data['amount']);
          });
          return StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance
                .collection('routes')
                .where('status', isEqualTo: 'cashed')
                .snapshots(),
            builder: (context, routesSnapshot) {
              routesSnapshot.data.documents.forEach((element) {
                cashIn += (element.data['totalAmount'] - element.data['fees']);
              });
              print('in:$cashIn');
              print('out$cashOut');
              //net = cashIn - cashOut;
              return Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.white,
                    child: ListTile(
                      title: Text(
                        'Cash Flow',
                        style: TextStyle(
                            color: Color.fromRGBO(170, 44, 94, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(170, 44, 94, 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                "Cash In\n${cashIn.round()} EGP",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                "Cash Out\n${cashOut.round()} EGP",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                "NET\n${(net).round()} EGP",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: expensesSnapshot.data.documents.length +
                                routesSnapshot.data.documents.length ==
                            0
                        ? Center(
                            child: Text(
                            'No Cash Flow Exist!!',
                            style: TextStyle(
                                color: Color.fromRGBO(170, 44, 94, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 26),
                          ))
                        : ListView.builder(
                            itemBuilder: (ctx, index) {
                              final userName = routesSnapshot
                                  .data.documents[index].data['name'];
                              final supplier = 'Distribution Route';
                              final date = routesSnapshot
                                  .data.documents[index].data['date'];
                              final amount = routesSnapshot.data
                                      .documents[index].data['totalAmount'] -
                                  routesSnapshot
                                      .data.documents[index].data['fees'];
                              return revenueCashFlowTile(
                                userName: userName,
                                suplierName: supplier,
                                date: date,
                                amount: amount,
                                fee: (routesSnapshot
                                        .data.documents[index].data['fees'])
                                    .roundToDouble(),
                                total: (routesSnapshot.data.documents[index]
                                        .data['totalAmount'])
                                    .roundToDouble(),
                                documentId: routesSnapshot
                                    .data.documents[index].documentID,
                              );
                              /*} else {
                                      final userName = expensesSnapshot.data
                                          .documents[index].data['userName'];
                                      final supplier = expensesSnapshot.data
                                          .documents[index].data['supplier'];
                                      final date = expensesSnapshot
                                          .data.documents[index].data['date'];
                                      final amount = expensesSnapshot
                                          .data.documents[index].data['amount'];
                                      return expensesCashFlowTile(
                                        userName: userName,
                                        suplierName: supplier,
                                        date: date,
                                        amount: amount,
                                        documentId: expensesSnapshot
                                            .data.documents[index].documentID,
                                      );
                                    }*/
                            },
                            itemCount: expensesSnapshot.data.documents.length +
                                routesSnapshot.data.documents.length,
                          ),
                  ),
                  InkWell(
                    onTap: () async {
                      final amountCollected = await showDialog<double>(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Collected Amount?'),
                            content: TextField(
                              controller: collectedAmount,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1.5),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  labelText: 'Collected:'),
                            ),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  collectedAmount.clear();
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              FlatButton(
                                  onPressed: () async {
                                    final collected =
                                        double.parse(collectedAmount.text);
                                    collectedAmount.clear();
                                    Navigator.of(context).pop(collected);

                                  },
                                  child: Text(
                                    'Send',
                                    style: TextStyle(color: Colors.green),
                                  ))
                            ],
                          );
                        },
                      );
                      if (amountCollected == null) {
                        print('not clear');

                        return;
                      }
                      if (amountCollected == net) {
                        print('clear');
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Successed'),
                            content:
                                Text('The Cashes were collected Succefuly'),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  collectedAmount.clear();
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Ok',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        );
                        return;
                      } else {
                        print('fucked');

                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Fiscal deficit'),
                            content:
                                Text('There is a loan has to be determined'),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed('/addLoans', arguments: {
                                    'money': '${net - amountCollected}',
                                  });
                                },
                                child: Text(
                                  'Ok',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: Container(
                      color: Color.fromRGBO(170, 44, 94, 1),
                      width: double.infinity,
                      height: 50,
                      child: Center(
                        child: Text(
                          'Collect',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }

  expensesCashFlowTile(
      {String suplierName,
      String userName,
      String date,
      double amount,
      String documentId}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: 2.5,
            color: Colors.black,
          ),
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: RichText(
                      text: TextSpan(
                    text: "${suplierName}\n",
                    children: [
                      TextSpan(
                        text: '${userName}\n',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: '${date}',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ],
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          '${amount} EGP',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Color.fromRGBO(170, 44, 94, 1),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () async {
                        await Firestore.instance
                            .collection('expenses')
                            .document(documentId)
                            .updateData({
                          'approved': true,
                        });
                        await showDialog(
                            context: context,
                            child: AlertDialog(
                              title: Text('Confirmed'),
                              content: Text('This item has been confirmed'),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('Ok'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            ));
                      },
                      child: Container(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "ADD",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(170, 44, 94, 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  revenueCashFlowTile({
    String suplierName,
    String userName,
    String date,
    double amount,
    double fee,
    double total,
    String documentId,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: 2.5,
            color: Color.fromRGBO(170, 44, 94, 1),
          ),
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: RichText(
                      text: TextSpan(
                    text: "${suplierName}\n",
                    children: [
                      TextSpan(
                        text: '${userName}\n',
                        style: TextStyle(
                          color: Color.fromRGBO(96, 125, 129, 1),
                        ),
                      ),
                      TextSpan(
                        text: '${date}',
                        style: TextStyle(
                            color: Color.fromRGBO(96, 125, 129, 1),
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ],
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(170, 44, 94, 1)),
                  )),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          '${amount} EGP',
                          style: TextStyle(
                              color: Color.fromRGBO(170, 44, 94, 1),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Color.fromRGBO(170, 44, 94, 1),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () async {
                        await Firestore.instance
                            .collection('routes')
                            .document(documentId)
                            .updateData({
                          'status': 'collected',
                        });
                        final expensesDocument = {
                          'userName': userName,
                          'date': date,
                          'supplier': 'Distribution',
                          'amount': fee,
                          'approved': true,
                        };

                        final revenueDocument = {
                          'userName': userName,
                          'date': date,
                          'source': 'Distribution',
                          'amount': total,
                          'approved': true,
                        };

                        await Firestore.instance
                            .collection('expenses')
                            .add(expensesDocument);
                        print('expeses are added');
                        await Firestore.instance
                            .collection('revenue')
                            .add(revenueDocument);
                        print('revenue are added');
                        await showDialog(
                            context: context,
                            child: AlertDialog(
                              title: Text('Confirmed'),
                              content: Text('This item has been confirmed'),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('Ok'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            ));
                      },
                      child: Container(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "ADD",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(170, 44, 94, 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maglis_app/controllers/userProvider.dart';
import 'package:maglis_app/widgets/bottomNavigator.dart';
import 'package:provider/provider.dart';

class ExpensesNotApprovedDetails extends StatefulWidget {
  @override
  _ApprovedDetailsState createState() => _ApprovedDetailsState();
}

class _ApprovedDetailsState extends State<ExpensesNotApprovedDetails> {
  User user;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final map = ModalRoute.of(context).settings.arguments as Map;
    Stream expenseStream;
    user = Provider.of<UserProvider>(context).user;
    var totalCash = 0.0;
    if (map['type'] == 1) {
      expenseStream = Firestore.instance
          .collection('expenses')
          .where('date', isEqualTo: map['date'])
          .where('status', isEqualTo: 'notApproved')
          .snapshots();
    } else if (map['type'] == 2) {
      expenseStream = Firestore.instance
          .collection('expenses')
          .where('userName', isEqualTo: map['date'])
          .where('status', isEqualTo: 'notApproved')
          .snapshots();
    } else if (map['type'] == 3) {
      expenseStream = Firestore.instance
          .collection('expenses')
          .where('supplier', isEqualTo: map['date'])
          .where('status', isEqualTo: 'notApproved')
          .snapshots();
    } else {
      expenseStream = Firestore.instance
          .collection('expenses')
          .where('status', isEqualTo: 'notApproved')
          .snapshots();
    }
    return StreamBuilder<QuerySnapshot>(
      stream: expenseStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Center(
            child: CircularProgressIndicator(),
          );

        final documents = snapshot.data.documents;
        documents.sort((a, b) => (a.data['time'] as Timestamp)
            .compareTo((b.data['time'] as Timestamp)));
        return Scaffold(
          bottomNavigationBar: BottomNavigator(),
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
            height: size.height,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.white,
                  child: ListTile(
                    title: Text(
                      'Not Approved',
                      style: TextStyle(
                          color: Color.fromRGBO(170, 44, 94, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    trailing:  Text(
                      '$totalCash EGP',
                      style: TextStyle(
                          color: Color.fromRGBO(170, 44, 94, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      final userName = documents[index].data['userName'];
                      final supplier = documents[index].data['supplier'];
                      final date = documents[index].data['date'];
                      final amount = documents[index].data['amount'];
                      return approvedTile(
                        userName: userName,
                        suplierName: supplier,
                        date: date,
                        amount: amount,
                        documentId: documents[index].documentID,
                      );
                    },
                    itemCount: documents.length,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  approvedTile(
      {String suplierName,
      String userName,
      String date,
      amount,
      String documentId}) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed('/expensesDetails', arguments: {'id': documentId}),
      child: Padding(
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
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
                      user != null && user.type == 'admin'
                          ? InkWell(
                              onTap: () async {
                                await Firestore.instance
                                    .collection('expenses')
                                    .document(documentId)
                                    .updateData({
                                  'status': 'cashed',
                                });
                                await showDialog(
                                    context: context,
                                    child: AlertDialog(
                                      title: Text('Confirmed'),
                                      content:
                                          Text('This item has been confirmed'),
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
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            )
                          : SizedBox()
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

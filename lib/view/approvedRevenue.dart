import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ApprovedRevenue extends StatefulWidget {
  @override
  _ApprovedRevenueState createState() => _ApprovedRevenueState();
}

class _ApprovedRevenueState extends State<ApprovedRevenue> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final map = ModalRoute.of(context).settings.arguments as Map;
    Stream revenuetream;

    if (map != null) {
      if (map['type'] == 1) {
        revenuetream = Firestore.instance
            .collection('revenue')
            .where('date', isEqualTo: map['date'])
            .where('approved', isEqualTo: true)
            .snapshots();
      } else if (map['type'] == 2) {
        revenuetream = Firestore.instance
            .collection('revenue')
            .where('userName', isEqualTo: map['date'])
            .where('approved', isEqualTo: true)
            .snapshots();
      } else if (map['type'] == 3) {
        revenuetream = Firestore.instance
            .collection('revenue')
            .where('supplier', isEqualTo: map['date'])
            .where('approved', isEqualTo: true)
            .snapshots();
      } else {
        revenuetream = Firestore.instance
            .collection('revenue')
            .where('approved', isEqualTo: true)
            .snapshots();
      }
    }
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
                  'Approved',
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
              child: StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance
                    .collection('revenue')
                    .where('approved', isEqualTo: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  return ListView.builder(
                    itemBuilder: (ctx, index) {
                      final userName =
                          snapshot.data.documents[index].data['userName'];
                      final supplier =
                          snapshot.data.documents[index].data['source'];
                      final date = snapshot.data.documents[index].data['date'];
                      final amount =
                          snapshot.data.documents[index].data['amount'];
                      return approvedTile(
                        userName: userName,
                        suplierName: supplier,
                        date: date,
                        amount: amount,
                        documentId: snapshot.data.documents[index].documentID,
                      );
                    },
                    itemCount: snapshot.data.documents.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  approvedTile(
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

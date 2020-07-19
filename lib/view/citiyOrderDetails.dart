import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//Screen 39
class CitiyOrderDetails extends StatefulWidget {
  @override
  _CitiyOrderDetailsState createState() => _CitiyOrderDetailsState();
}

class _CitiyOrderDetailsState extends State<CitiyOrderDetails> {
  String docId = '';
  bool showMenu = false;
  bool isCalled = false;
  @override
  Widget build(BuildContext context) {
    final orderData =
        ModalRoute.of(context).settings.arguments as Map<dynamic, dynamic>;

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
        actions: <Widget>[
          showMenu
              ? PopupMenuButton<String>(
                  color: Colors.white,
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.black,
                  ),
                  onSelected: (val) {
                    if (val == 'Cancel') {
                      Firestore.instance
                          .collection('orders')
                          .document(docId)
                          .updateData({'status': 'canceled'}).then(
                              (value) => Navigator.of(context).pop());
                    } else if (val == 'Archive') {
                      Firestore.instance
                          .collection('orders')
                          .document(docId)
                          .updateData({'status': 'archived'}).then(
                              (value) => Navigator.of(context).pop());
                    }
                  },
                  itemBuilder: ((BuildContext context) {
                    return {'Cancel', 'Archive'}.map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice),
                      );
                    }).toList();
                  }),
                )
              : SizedBox()
        ],
      ),
      body: FutureBuilder<DocumentSnapshot>(
          future: Firestore.instance
              .collection('orders')
              .document(orderData['docId'])
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final order = snapshot.data.data;
            docId = snapshot.data.documentID;
            Future.delayed(Duration(milliseconds: 50)).then((value) {
              if (order['status'] == 'noAction' && !isCalled)
                setState(() {
                  showMenu = true;
                });
            });
            return Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.white,
                  child: ListTile(
                    title: Text(
                      '${order['name']}',
                      style: TextStyle(
                          color: Color.fromRGBO(170, 44, 94, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    trailing: Image.asset(
                      'assets/images/noteAdd.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        height: 180,
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
                              'Qty: ${order['quantity']}',
                              style: TextStyle(
                                  color: Color.fromRGBO(
                                      170, 44, 94, 1), //rgb(96, 125, 130)
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Text(
                              'Created Date: ${order['createdAt']}',
                              style: TextStyle(
                                  color: Color.fromRGBO(170, 44, 94, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            /*Text(
                            'Received Date: 18/5/2020',
                            style: TextStyle(
                                color: Color.fromRGBO(170, 44, 94, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),*/
                            Text(
                              'Area: ${order['city']}',
                              style: TextStyle(
                                  color: Color.fromRGBO(170, 44, 94, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Text(
                              'Line: ${order['line']}', //line
                              style: TextStyle(
                                  color: Color.fromRGBO(170, 44, 94, 1),
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
                              'Description',
                              style: TextStyle(
                                  color: Color.fromRGBO(
                                      170, 44, 94, 1), //rgb(96, 125, 130)
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4),
                              child: Divider(
                                color: Colors.grey,
                                thickness: 4,
                              ),
                            ),
                            Text(
                              '${order['description']}', //description
                              style: TextStyle(
                                color: Color.fromRGBO(96, 125, 130, 1),
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 100,
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
                              'Phone number',
                              style: TextStyle(
                                  color: Color.fromRGBO(
                                      170, 44, 94, 1), //rgb(96, 125, 130)
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4),
                              child: Divider(
                                color: Colors.grey,
                                thickness: 4,
                              ),
                            ),
                            Text(
                              '${order['phone']}',
                              style: TextStyle(
                                color: Color.fromRGBO(96, 125, 130, 1),
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 100,
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
                              'Note',
                              style: TextStyle(
                                  color: Color.fromRGBO(
                                      170, 44, 94, 1), //rgb(96, 125, 130)
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4),
                              child: Divider(
                                color: Colors.grey,
                                thickness: 4,
                              ),
                            ),
                            Text(
                              '${order['note']}',
                              style: TextStyle(
                                color: Color.fromRGBO(96, 125, 130, 1),
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 200,
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
                              'Downpayment',
                              style: TextStyle(
                                  color: Color.fromRGBO(
                                      170, 44, 94, 1), //rgb(96, 125, 130)
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4),
                              child: Divider(
                                color: Colors.grey,
                                thickness: 4,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Amount of the invoice',
                                  style: TextStyle(
                                    color: Color.fromRGBO(96, 125, 130, 1),
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  '${order['totalAccount']} EGP',
                                  style: TextStyle(
                                    color: Color.fromRGBO(96, 125, 130, 1),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Amount under the account',
                                  style: TextStyle(
                                    color: Color.fromRGBO(96, 125, 130, 1),
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  '${order['underAccount']} EGP',
                                  style: TextStyle(
                                    color: Color.fromRGBO(96, 125, 130, 1),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4),
                              child: Divider(
                                color: Colors.grey,
                                thickness: 4,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Total after downpayment',
                                  style: TextStyle(
                                      color: Color.fromRGBO(
                                          170, 44, 94, 1), //rgb(96, 125, 130)
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  '${order['totalAccount'] - order['underAccount']} EGP',
                                  style: TextStyle(
                                      color: Color.fromRGBO(
                                          170, 44, 94, 1), //rgb(96, 125, 130)
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 12),
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(child: SizedBox()),
                            order['status'] == 'noAction'
                                ? InkWell(
                                    onTap: () {
                                      Firestore.instance
                                          .collection('orders')
                                          .document(snapshot.data.documentID)
                                          .updateData({
                                        'status': 'shipped',
                                      }).then((value) =>
                                              Navigator.of(context).pop());
                                    },
                                    child: Text(
                                      'Shipped',
                                      style: TextStyle(
                                        color: Color.fromRGBO(96, 125, 130, 1),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                : order['status'] == 'onShipping'
                                    ? InkWell(
                                        onTap: () {
                                          Firestore.instance
                                              .collection('orders')
                                              .document(
                                                  snapshot.data.documentID)
                                              .updateData({
                                            'status': 'canceled',
                                          }).then((value) =>
                                                  Navigator.of(context).pop());
                                        },
                                        child: Text(
                                          'Canceled',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    : order['status'] == 'shipped'
                                        ? InkWell(
                                            onTap: () {
                                              Firestore.instance
                                                  .collection('orders')
                                                  .document(
                                                      snapshot.data.documentID)
                                                  .updateData({
                                                'status': 'cashed',
                                              }).then((value) =>
                                                      Navigator.of(context)
                                                          .pop());
                                            },
                                            child: Text(
                                              'Add to Finance',
                                              style: TextStyle(
                                                color: Colors.green
                                                    .withOpacity(0.7),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )
                                        : order['status'] == 'canceled'
                                            ? Text(
                                                'Canceled',
                                                style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            : order['status'] == 'collected'
                                                ? Text(
                                                    'Collected',
                                                    style: TextStyle(
                                                      color: Colors.green,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )
                                                : Text(
                                                    'Arechived',
                                                    style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          226, 208, 168, 1),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(child: SizedBox()),
                            VerticalDivider(
                              color: Color.fromRGBO(170, 44, 94, 1),
                              thickness: 3,
                            ),
                            Expanded(child: SizedBox()),
                            order['status'] == 'onShipping'
                                ? InkWell(
                                    onTap: () {
                                      Firestore.instance
                                          .collection('orders')
                                          .document(snapshot.data.documentID)
                                          .updateData({
                                        'status': 'shipped',
                                      }).then((value) =>
                                              Navigator.of(context).pop());
                                    },
                                    child: Text(
                                      'Shipped',
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                : Text(
                                    'Call',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                            Expanded(child: SizedBox()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}

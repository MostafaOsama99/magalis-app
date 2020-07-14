import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:maglis_app/widgets/orderTile.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    Stream orderstream;
    final map = ModalRoute.of(context).settings.arguments as Map;
    final title = (map['title'] == null) ? 'All' : map['title'];
    final logo =
        (map['logo'] == null) ? 'assets/images/AllIcon.png' : map['logo'];
    print(map['type']);
    if (map != null) {
      // print(map['date']);
      if (map['type'] == 1) {
        orderstream = Firestore.instance
            .collection('orders')
            .where('area', isEqualTo: map['date'])
            .snapshots();
      } else if (map['type'] == 2) {
        orderstream = Firestore.instance
            .collection('orders')
            .where('createdAt', isEqualTo: map['date'])
            .snapshots();
      } else if (map['type'] == 3) {
        orderstream = Firestore.instance
            .collection('orders')
            .where('line', isEqualTo: map['date'])
            .snapshots();
      } else if (map['type'] == 4) {
        orderstream = Firestore.instance
            .collection('orders')
            .where('status', isEqualTo: 'noAction')
            .snapshots();
        print(orderstream.toString());
      } else {
        orderstream = Firestore.instance.collection('orders').snapshots();
      }
    } else {
      orderstream = Firestore.instance.collection('orders').snapshots();
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
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.white,
            child: ListTile(
              leading: Image.asset(logo),
              title: Text(
                title,
                style: TextStyle(
                    color: Color.fromRGBO(170, 44, 94, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[400], width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Icon(
                        Icons.sort,
                        size: 25,
                        color: Color.fromRGBO(96, 125, 129, 1),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).pushNamed('/addOrder'),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400], width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
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
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: orderstream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return Center(
                      child: CircularProgressIndicator(),
                    );

                  final ordersData = snapshot.data.documents;
                  if (snapshot.data.documents.length <= 0) {
                    return Center(
                      child: Text(
                        'No Orders to Routed',
                        style: TextStyle(
                            color: Color.fromRGBO(170, 44, 94, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () async {
                          if (map['type'] == 4) {
                            final lastOrders = map['lastOrders'] as List;
                            final totalAmount = map['amount'];
                            final ordersId =
                                lastOrders.map((e) => e['docId']).toList();
                            if (!ordersId.contains(map['docId'])) {
                              lastOrders.add({
                                'docId': ordersData[i].documentID,
                                'name': ordersData[i].data['name'],
                                'address': ordersData[i].data['address'],
                                'totalAccount':
                                    ordersData[i].data['totalAccount'],
                              });
                              final orderAmount = totalAmount +
                                  ordersData[i].data['totalAccount'];
                              await Firestore.instance
                                  .collection('routes')
                                  .document(map['routeId'])
                                  .updateData({
                                'orders': lastOrders,
                                'totalAmount': orderAmount
                              });
                              await Firestore.instance
                                  .collection('orders')
                                  .document(ordersData[i].documentID)
                                  .updateData({'status': 'routed'});
                              Navigator.of(context).pushReplacementNamed(
                                  '/routeItemDetails',
                                  arguments: {'docId': map['routeId']});
                            }
                          } else {
                            Navigator.of(context)
                                .pushNamed('/orderDetails', arguments: {
                              'docId': ordersData[i].documentID,
                            });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: orderItem(
                            title: '${ordersData[i].data['name']}',
                            price: ordersData[i].data['totalAccount'],
                            line: '${ordersData[i].data['area']}', //area
                            factoryName: '${ordersData[i].data['line']}',
                            quantity: ordersData[i].data['quantity'],
                            date: '${ordersData[i].data['createdAt']}',
                            description: '${ordersData[i].data['description']}',
                            phone: '${ordersData[i].data['phone']}',
                            underAccount: ordersData[i]
                                .data['underAccount'], //underAccount
                          ),
                        ),
                      );
                    },
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget orderItem(
      {id,
      title,
      price,
      line,
      factoryName,
      quantity,
      date,
      underAccount,
      phone,
      description}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 2,
            color: Colors.grey.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '${title}',
                style: TextStyle(
                    color: Color.fromRGBO(170, 44, 94, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Text(
                '${price} EGP',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '${factoryName}',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              Text(
                'QTY : ${quantity}',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '${line}',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              Text(
                '${date}',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:maglis_app/widgets/orderTile.dart';

class NewRoutes extends StatefulWidget {
  @override
  _NewRoutesState createState() => _NewRoutesState();
}

class _NewRoutesState extends State<NewRoutes> {
  @override
  Widget build(BuildContext context) {
    final map = ModalRoute.of(context).settings.arguments as Map;
    Stream routestream;
    if (map != null) {
      print(map['type']);
      if (map['type'] == 1) {
        routestream = Firestore.instance
            .collection('routes')
            .where('createdAt', isEqualTo: map['date'])
            .where('status', isEqualTo: 'new')
            .snapshots();
      } else if (map['type'] == 7) {
        routestream = Firestore.instance
            .collection('routes')
            .where('name', isEqualTo: map['date'])
            .where('status', isEqualTo: 'new')
            .snapshots();
      } else if (map['type'] == 3) {
        routestream = Firestore.instance
            .collection('routes')
            .where('area', isEqualTo: map['date'])
            .where('status', isEqualTo: 'new')
            .snapshots();
      } else {
        routestream = Firestore.instance
            .collection('routes')
            .where('status', isEqualTo: 'new')
            .snapshots();
      }
    } else {
      routestream = Firestore.instance
          .collection('routes')
          .where('status', isEqualTo: 'new')
          .snapshots();
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
              leading: Image.asset('assets/images/LineIcon.png'),
              title: Text(
                'New Routes',
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
                    onTap: () => Navigator.of(context).pushNamed('/addRoute'),
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
              stream: routestream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Center(
                    child: CircularProgressIndicator(),
                  );

                if (snapshot.data == null) {
                  return Center(
                    child: Text(
                      'No New Routes',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                  );
                }
                final routesData = snapshot.data.documents;
                return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: InkWell(
                        onTap: () async {
                          if (map != null) {
                            if (map['type'] == 2) {
                              final lastroutes =
                                  routesData[i].data['orders'] as List;
                              final routesId =
                                  lastroutes.map((e) => e['docId']).toList();
                              if (!routesId.contains(map['docId'])) {
                                lastroutes.add({
                                  'docId': map['docId'],
                                  'name': map['name'],
                                  'address': map['address'],
                                  'totalAccount': map['totalAccount'],
                                });
                                final totalAmount =
                                    routesData[i].data['totalAmount'] +
                                        map['totalAccount'];
                                await Firestore.instance
                                    .collection('routes')
                                    .document(routesData[i].documentID)
                                    .updateData({
                                  'orders': lastroutes,
                                  'totalAmount': totalAmount,
                                });
                                Navigator.of(context).pushReplacementNamed(
                                  '/distribution',
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    content: Text(
                                        'This item is already exit in this route'),
                                    actions: <Widget>[
                                      FlatButton(
                                          onPressed: () {
                                            Firestore.instance
                                                .collection('orders')
                                                .document(map['docId'])
                                                .updateData({
                                              'status': 'onDistribution'
                                            }).then(
                                              (value) => Navigator.of(context)
                                                  .pushReplacementNamed(
                                                '/distribution',
                                              ),
                                            );
                                          },
                                          child: Text('OK!'))
                                    ],
                                  ),
                                );
                              }
                            } else {
                              Navigator.of(context)
                                  .pushNamed('/routeItemDetails', arguments: {
                                'docId': routesData[i].documentID
                              });
                            }
                          } else {
                            Navigator.of(context).pushNamed('/routeItemDetails',
                                arguments: {'docId': routesData[i].documentID});
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                width: 2,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                              borderRadius: BorderRadius.circular(12)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 18, vertical: 12),
                          margin:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    '${routesData[i].data['name']}',
                                    style: TextStyle(
                                        color: Color.fromRGBO(170, 44, 94, 1),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Icon(
                                    Icons.info,
                                    color: Colors.amber,
                                  )
                                ],
                              ),
                              Text(
                                'Area: ${routesData[i].data['area']}',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              Text(
                                'Date: ${routesData[i].data['date']}', //date
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
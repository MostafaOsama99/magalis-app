//Screen 13
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RouteItemDetails extends StatefulWidget {
  @override
  _RouteItemDetailsState createState() => _RouteItemDetailsState();
}

class _RouteItemDetailsState extends State<RouteItemDetails> {
  @override
  Widget build(BuildContext context) {
    final map = ModalRoute.of(context).settings.arguments as Map;
    final size = MediaQuery.of(context).size;
    bool loading = false;
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
      body: FutureBuilder<DocumentSnapshot>(
        future: Firestore.instance
            .collection('routes')
            .document(map['docId'])
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );
          final routeData = snapshot.data.data;
          final ordersList = routeData['orders'] as List;
          return Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.white,
                child: ListTile(
                  title: Text(
                    '${routeData['name']}',
                    style: TextStyle(
                        color: Color.fromRGBO(170, 44, 94, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  trailing: Icon(
                    Icons.search,
                    size: 30,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                padding: EdgeInsets.only(left: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${routeData['area']}',
                      style: TextStyle(
                          color: Color.fromRGBO(
                              96, 125, 130, 1), //rgb(96, 125, 130)
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Text(
                      'Created By: ${routeData['createdBy']}',
                      style: TextStyle(
                          color: Color.fromRGBO(96, 125, 130, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Text(
                      'Created At : ${routeData['createdAt']}',
                      style: TextStyle(
                          color: Color.fromRGBO(96, 125, 130, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Text(
                      'Orders: ${ordersList.length} Orders',
                      style: TextStyle(
                          color: Color.fromRGBO(96, 125, 130, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Text(
                      'Status: ${routeData['status']}',
                      style: TextStyle(
                          color: Color.fromRGBO(96, 125, 130, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey.withOpacity(0.5), width: 2),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          onTap: () => Navigator.of(context).pushNamed(
                              '/orderRouteDetails',
                              arguments: {'docId': ordersList[index]['docId']}),
                          title: Text(
                            '${ordersList[index]['name']}',
                            style: TextStyle(
                                color: Color.fromRGBO(170, 44, 94, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          subtitle: Text(
                            '${ordersList[index]['address']}',
                            style: TextStyle(
                                color: Color.fromRGBO(96, 125, 130, 1),
                                fontSize: 14),
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '${ordersList[index]['totalAccount']} EGP',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: ordersList.length,
                  ),
                ),
              ),
              loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : InkWell(
                      onTap: () async {
                        setState(() {
                          loading = true;
                        });
                        await Firestore.instance
                            .collection('routes')
                            .document(snapshot.data.documentID)
                            .updateData({'status': 'onDistribution'});
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
                          ),
                        );
                        Navigator.of(context).pushReplacementNamed('/newRoute');
                      },
                      child: Container(
                        color: Color.fromRGBO(170, 44, 94, 1),
                        width: size.width,
                        height: 50,
                        child: Center(
                          child: Text(
                            'Push to On Distribution',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
              SizedBox(
                height: 8,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed('/orders', arguments: {
                    'type': 4,
                    'routeId': snapshot.data.documentID,
                    'lastOrders': ordersList,
                    'logo': 'assets/images/AllIcon.png',
                    'title': 'All'
                  });
                },
                child: Container(
                  color: Color.fromRGBO(170, 44, 94, 1),
                  width: size.width,
                  height: 50,
                  child: Center(
                    child: Text(
                      'ADD Order',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

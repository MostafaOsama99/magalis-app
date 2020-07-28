import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maglis_app/controllers/userProvider.dart';
import 'package:maglis_app/widgets/bottomNavigator.dart';

import 'package:maglis_app/widgets/orderTile.dart';
import 'package:provider/provider.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final searchController = TextEditingController();
  Map filterData;
  bool isSearch = false;
  String selected = '';
  final searchKey = new GlobalKey<AutoCompleteTextFieldState<String>>();
  bool isCalled = false;

  bool searched = false;

  List<String> names = [];
  List<String> address = [];
  List<String> phones = [];

  List<String> recomendations = [];

  Stream orderstream;

  @override
  Widget build(BuildContext context) {
    final map = ModalRoute.of(context).settings.arguments as Map;
    final title = (map == null) ? 'All' : map['title'];
    final logo = (map == null) ? 'assets/images/AllIcon.png' : map['logo'];
    final user = User(type: 'admin');
    bool cancel = false;
    searchController.text = selected;
    if (!searched) {
      if (filterData == null) {
        // print(map['type']);
        if (map != null) {
          // print(map['date']);
          if (map['type'] == 1) {
            orderstream = Firestore.instance
                .collection('orders')
                .where('status', isEqualTo: map['status'])
                .where('area', isEqualTo: map['date'])
                .where('isCairo', isEqualTo: true)
                .where('isCorporate', isEqualTo: false)
                .snapshots();
          } else if (map['type'] == 2) {
            orderstream = Firestore.instance
                .collection('orders')
                .where('status', isEqualTo: map['status'])
                .where('createdAt', isEqualTo: map['date'])
                .where('isCairo', isEqualTo: true)
                .where('isCorporate', isEqualTo: false)
                .snapshots();
          } else if (map['type'] == 3) {
            orderstream = Firestore.instance
                .collection('orders')
                .where('status', isEqualTo: map['status'])
                .where('line', isEqualTo: map['date'])
                .where('isCairo', isEqualTo: true)
                .where('isCorporate', isEqualTo: false)
                .snapshots();
          } else if (map['type'] == 4) {
            orderstream = Firestore.instance
                .collection('orders')
                .where('status', isEqualTo: map['status'])
                .where('isCairo', isEqualTo: true)
                .where('isCorporate', isEqualTo: false)
                .snapshots();
          } else if (map['type'] == 7) {
            orderstream = Firestore.instance
                .collection('orders')
                .where('status', whereIn: map['status'])
                .where('isCairo', isEqualTo: true)
                .where('isCorporate', isEqualTo: false)
                .snapshots();
          } else {
            orderstream = Firestore.instance
                .collection('orders')
                .where('status', isEqualTo: map['status'])
                .where('isCairo', isEqualTo: true)
                .where('isCorporate', isEqualTo: false)
                .snapshots();
          }
        } else {
          orderstream = Firestore.instance
              .collection('orders')
              .where('isCairo', isEqualTo: true)
              .where('isCorporate', isEqualTo: false)
              .snapshots();
        }
      } else {
        List<String> areas = filterData['areas'];
        String date = filterData['date'];

        Query firestoreQuery = Firestore.instance
            .collection('orders')
            .where('isCairo', isEqualTo: true)
            .where('isCorporate', isEqualTo: false);
        if (areas != null && areas.length > 0) {
          firestoreQuery = firestoreQuery.where('area', whereIn: areas);
        }

        if (date != null && date.isNotEmpty) {
          firestoreQuery = firestoreQuery.where('createdAt', isEqualTo: date);
        }
        if (map['status'] != null) {
          firestoreQuery =
              firestoreQuery.where('status', isEqualTo: map['status']);
        }
        orderstream = firestoreQuery.snapshots();
      }
    }
    return FutureBuilder<DocumentSnapshot>(
        future: Firestore.instance.collection('myInfo').document('order').get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting &&
              !isCalled) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!isCalled) {
            recomendations.addAll(
                (snapshot.data.data['name'] as List).map((e) => e.toString()));
            names = (snapshot.data.data['name'] as List)
                .map((e) => e.toString())
                .toList();
            recomendations.addAll((snapshot.data.data['address'] as List)
                .map((e) => e.toString()));
            address = (snapshot.data.data['address'] as List)
                .map((e) => e.toString())
                .toList();
            recomendations.addAll(
                (snapshot.data.data['phone'] as List).map((e) => e.toString()));
            phones = (snapshot.data.data['phone'] as List)
                .map((e) => e.toString())
                .toList();
            isCalled = true;
          }

          return Scaffold(
            bottomNavigationBar: BottomNavigator(),
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
              leading: isSearch ? Container() : BackButton(),
              elevation: 10,
              centerTitle: true,
              backgroundColor: Colors.white,
              title: isSearch
                  ? AutoCompleteTextField<String>(
                      controller: searchController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.5),
                          ),
                          hintText: 'Search Order:',
                          suffixIcon: Icon(Icons.search)),
                      itemSubmitted: (item) {
                        Query orderquery =
                            Firestore.instance.collection('orders');
                        if (names.contains(item)) {
                          orderquery = Firestore.instance
                              .collection('orders')
                              .where('isCairo', isEqualTo: true)
                              .where('isCorporate', isEqualTo: false)
                              .where('name', isEqualTo: item);
                        }
                        if (address.contains(item)) {
                          orderquery = Firestore.instance
                              .collection('orders')
                              .where('isCairo', isEqualTo: true)
                              .where('isCorporate', isEqualTo: false)
                              .where('address', isEqualTo: item);
                        }
                        if (phones.contains(item)) {
                          orderquery = Firestore.instance
                              .collection('orders')
                              .where('isCairo', isEqualTo: true)
                              .where('isCorporate', isEqualTo: false)
                              .where('phone', isEqualTo: item);
                        }
                        if (map['status'] != null) {
                          orderquery = orderquery.where('status',
                              isEqualTo: map['status']);
                        }
                        orderstream = orderquery.snapshots();
                        isSearch = false;
                        selected = item;

                        setState(() => searched = true);
                      },
                      textSubmitted: (item) {
                        Query orderquery =
                            Firestore.instance.collection('orders');
                        if (names.contains(item)) {
                          orderquery = Firestore.instance
                              .collection('orders')
                              .where('isCairo', isEqualTo: true)
                              .where('isCorporate', isEqualTo: false)
                              .where('name', isEqualTo: item);
                        }
                        if (address.contains(item)) {
                          orderquery = Firestore.instance
                              .collection('orders')
                              .where('isCairo', isEqualTo: true)
                              .where('isCorporate', isEqualTo: false)
                              .where('address', isEqualTo: item);
                        }
                        if (phones.contains(item)) {
                          orderquery = Firestore.instance
                              .collection('orders')
                              .where('isCairo', isEqualTo: true)
                              .where('isCorporate', isEqualTo: false)
                              .where('phone', isEqualTo: item);
                        }
                        if (map['status'] != null) {
                          orderquery = orderquery.where('status',
                              isEqualTo: map['status']);
                        }
                        orderstream = orderquery.snapshots();
                        isSearch = false;
                        selected = item;

                        setState(() => searched = true);
                      },
                      textChanged: (item) {
                        print('itesmss:$item');
                        selected = item;
                      },
                      key: searchKey,
                      suggestions: recomendations,
                      itemBuilder: (context, suggestion) => new Padding(
                          child: new ListTile(
                            title: new Text(suggestion),
                          ),
                          padding: EdgeInsets.all(8.0)),
                      itemFilter: (suggestion, input) => suggestion
                          .toLowerCase()
                          .startsWith(input.toLowerCase()),
                      itemSorter: (a, b) =>
                          a == b ? 0 : a.length > b.length ? -1 : 1,
                    )
                  : Image.asset(
                      'assets/images/logo.png',
                      width: 150,
                    ),
              actions: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[400], width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isSearch = !isSearch;
                          searched = !searched;
                        });
                      },
                      child: Icon(
                        Icons.search,
                        size: 25,
                        color: Color.fromRGBO(96, 125, 129, 1),
                      ),
                    ),
                  ),
                ),
              ],
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
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey[400], width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: InkWell(
                              onTap: () async {
                                filterData = await Navigator.of(context)
                                    .pushNamed('/filter') as Map;
                                print(filterData);
                                setState(() {
                                  searched = false;
                                });
                              },
                              child: Icon(
                                Icons.sort,
                                size: 25,
                                color: Color.fromRGBO(96, 125, 129, 1),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        user.type == 'admin' || user.type == 'sales'
                            ? InkWell(
                                onTap: () => Navigator.of(context)
                                    .pushNamed('/addOrder'),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey[400], width: 2),
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
                              )
                            : SizedBox(),
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
                        if (filterData != null &&
                            (filterData['lines'] as List) != null &&
                            (filterData['lines'] as List).length > 0) {
                          final lines = filterData['lines'] as List;
                          ordersData.removeWhere((element) =>
                              !lines.contains(element.data['line']));
                        }
                        ordersData.sort((a, b) => (a.data['time'] as Timestamp)
                            .compareTo((b.data['time'] as Timestamp)));
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
                          itemCount: ordersData.length,
                          itemBuilder: (context, i) {
                            final line = ordersData[i].data['area'] == null
                                ? ordersData[i].data['city']
                                : ordersData[i].data['area'];

                            return InkWell(
                              onDoubleTap: () {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: Text('Description:'),
                                    content: Text(
                                        '${ordersData[i].data['description']}'),
                                    actions: <Widget>[
                                      FlatButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('OK!'))
                                    ],
                                  ),
                                );
                              },
                              onTap: () async {
                                if (map['type'] == 4) {
                                  final lastOrders = map['lastOrders'] as List;
                                  final totalAmount = map['amount'];
                                  final ordersId = lastOrders
                                      .map((e) => e['docId'])
                                      .toList();
                                  if (ordersId.contains(map['docId'])) {
                                    return;
                                  }
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
                                  final issuesDocs = await Firestore.instance
                                      .collection('orders')
                                      .document(ordersData[i].documentID)
                                      .collection('issues')
                                      .getDocuments();
                                  issuesDocs.documents.forEach((element) {
                                    Firestore.instance
                                        .collection('orders')
                                        .document(ordersData[i].documentID)
                                        .collection('issues')
                                        .document(element.documentID)
                                        .updateData({'isSolved': true});
                                  });
                                  await Firestore.instance
                                      .collection('orders')
                                      .document(ordersData[i].documentID)
                                      .updateData({'status': 'onDistribution'});

                                  await Navigator.of(context)
                                      .pushReplacementNamed(
                                    '/newRoute',
                                  );
                                } else {
                                  if (ordersData[i].data['isCairo'] &&
                                      !ordersData[i].data['isCorporate']) {
                                    Navigator.of(context)
                                        .pushNamed('/orderDetails', arguments: {
                                      'docId': ordersData[i].documentID,
                                    });
                                  } else if (!ordersData[i].data['isCairo'] &&
                                      !ordersData[i].data['isCorporate']) {
                                    Navigator.of(context).pushNamed(
                                        '/citiyOrderDetails',
                                        arguments: {
                                          'docId': ordersData[i].documentID,
                                        });
                                  } else {
                                    Navigator.of(context).pushNamed(
                                        '/corporateOrderDetails',
                                        arguments: {
                                          'docId': ordersData[i].documentID,
                                        });
                                  }
                                }
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: orderItem(
                                  title: '${ordersData[i].data['name']}',
                                  price: ordersData[i].data['totalAccount'],
                                  line: '${line}', //area
                                  factoryName: '${ordersData[i].data['line']}',
                                  quantity: ordersData[i].data['quantity'],
                                  date: '${ordersData[i].data['createdAt']}',
                                  description:
                                      '${ordersData[i].data['description']}',
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
        });
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maglis_app/widgets/bottomNavigator.dart';
import 'package:maglis_app/widgets/gridItems.dart';

class CorporateHome extends StatefulWidget {
  @override
  _CorporateHomeState createState() => _CorporateHomeState();
}

class _CorporateHomeState extends State<CorporateHome> {
  List<String> dates = [];
  List<String> userName = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              child: ListTile(
                leading: Image.asset('assets/images/OrdersIcon.png'),
                title: Text(
                  'Corporate Orders',
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
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          onTap: () => Navigator.of(context).pushNamed(
                              '/corporateOrders',
                              arguments: {'status': 'noAction'}),
                          child: Container(
                            width: size.width / 2.25,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  width: 2.5, color: Colors.grey[400]),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: Image.asset(
                                      'assets/images/CancelIcon.png'),
                                  width: 75,
                                  height: 75,
                                ),
                                Text(
                                  'New Orders',
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Color.fromRGBO(134, 134, 134, 1),
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context).pushNamed(
                              '/corporateOrders',
                              arguments: {'status': 'collected'}),
                          child: Container(
                              width: size.width / 2.25,
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 2.5, color: Colors.grey[400]),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Image.asset(
                                      'assets/images/PersonCheck.png',
                                    ),
                                    width: 75,
                                    height: 75,
                                  ),
                                  Text(
                                    'Collected',
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Color.fromRGBO(134, 134, 134, 1),
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width / 2.25,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 2.5, color: Colors.grey[400]),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          onTap: () => Navigator.of(context).pushNamed(
                              '/corporateOrders',
                              arguments: {'type': 1}),
                          child: Container(
                            width: 75,
                            height: 75,
                            child: Image.asset(
                              'assets/images/AllIcon.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Text(
                          'All',
                          style: TextStyle(
                              fontSize: 24,
                              color: Color.fromRGBO(134, 134, 134, 1),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

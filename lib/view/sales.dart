import 'package:flutter/material.dart';

import '../widgets/gridItems.dart';

//Screen 36
class Sales extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top;
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
          Icon(
            Icons.notifications_none,
            color: Color.fromRGBO(170, 44, 94, 1),
          )
        ],
      ),
      body: SizedBox(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              child: ListTile(
                leading: Image.asset('assets/images/SalesIcon.png'),
                title: Text(
                  'Sales',
                  style: TextStyle(
                      color: Color.fromRGBO(170, 44, 94, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: size.width / 2.25,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 2.5, color: Colors.grey[400]),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset('assets/images/Orders.png'),
                  ),
                 
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            Material(
              elevation: 20,
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.book,
                        color: Color.fromRGBO(96, 125, 129, 1),
                      ),
                      Icon(
                        Icons.settings,
                        color: Color.fromRGBO(96, 125, 129, 1),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:maglis_app/widgets/gridItems.dart';

class NotApprovedOne extends StatefulWidget {
  @override
  _NotApprovedOneState createState() => _NotApprovedOneState();
}

class _NotApprovedOneState extends State<NotApprovedOne> {
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
      body: Container(
        child: ListView(
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
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GridItems(
              firstItemName: 'Date',
              secondItemName: 'PickUp',
            ),
            SizedBox(
              height: 20,
            ),
            GridItems(
              firstItemName: 'Cairo',
              secondItemName: 'Cities',
            ),
          ],
        ),
      ),
    );
  }
}

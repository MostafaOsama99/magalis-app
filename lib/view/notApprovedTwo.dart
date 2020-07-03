import 'package:flutter/material.dart';
import 'package:maglis_app/widgets/gridItems.dart';


class NotApprovedTwo extends StatefulWidget {
  @override
  _NotApprovedTwoState createState() => _NotApprovedTwoState();
}

class _NotApprovedTwoState extends State<NotApprovedTwo> {
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
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GridItems(
              firstItemName: 'Date',
              secondItemName: 'User',
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        width: 2.5, color: Colors.grey[400].withOpacity(0.9)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.timeline,
                          color: Color.fromRGBO(170, 44, 94, 1),
                          size: 30,
                        ),
                        Text(
                          "Supplier",
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
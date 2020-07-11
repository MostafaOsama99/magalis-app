import 'package:flutter/material.dart';
import 'package:maglis_app/widgets/gridItems.dart';

class NotApprovedOne extends StatefulWidget {
  @override
  _NotApprovedOneState createState() => _NotApprovedOneState();
}

class _NotApprovedOneState extends State<NotApprovedOne> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
            Expanded(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: () =>
                            Navigator.of(context).pushNamed('/notApprovedDate'),
                        child: Container(
                          width: size.width / 2.25,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(width: 2.5, color: Colors.grey[400]),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child:
                                    Image.asset('assets/images/DateIcon.png'),
                                width: 75,
                                height: 75,
                              ),
                              Text(
                                'Date',
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
                        onTap: () =>
                            Navigator.of(context).pushNamed('/notApprovedDetails'),
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
                                    'assets/images/Person.png',
                                  ),
                                  width: 75,
                                  height: 75,
                                ),
                                Text(
                                  'Pickup',
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
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: () =>
                            Navigator.of(context).pushNamed('/cashFlow'),
                        child: Container(
                          width: size.width / 2.25,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(width: 2.5, color: Colors.grey[400]),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 75,
                                height: 75,
                                child:
                                    Image.asset('assets/images/LineIcon.png'),
                              ),
                              Text(
                                'Cairo',
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Color.fromRGBO(134, 134, 134, 1),
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: size.width / 2.25,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(width: 2.5, color: Colors.grey[400]),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: <Widget>[
                            InkWell(
                              onTap: () =>
                                  Navigator.of(context).pushNamed('/loans'),
                              child: Container(
                                width: 75,
                                height: 75,
                                child: Image.asset(
                                  'assets/images/LinesIcon.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Text(
                              'Cities',
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
          ],
        ),
      ),
    );
  }
}
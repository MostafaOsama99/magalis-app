import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DistributionType extends StatefulWidget {
  @override
  _DistributionState createState() => _DistributionState();
}

class _DistributionState extends State<DistributionType> {
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
        body: Column(children: [
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.white,
            child: ListTile(
              leading: Image.asset('assets/images/LinesIcon.png'),
              title: Text(
                'New Routes',
                style: TextStyle(
                    color: Color.fromRGBO(170, 44, 94, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              trailing: InkWell(
                onTap: () => Navigator.of(context).pushNamed('/addRoute'),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.5, color: Colors.grey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    Icons.add,
                    size: 35,
                  ),
                ),
              ),
            ),
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
                        onTap: () {},
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
                                width: 100,
                                height: 100,
                              ),
                              Text(
                                'Date',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromRGBO(134, 134, 134, 1),
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
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
                                child: Image.asset(
                                  'assets/images/Person.png',
                                ),
                                width: 100,
                                height: 100,
                              ),
                              Text(
                                'Person',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromRGBO(134, 134, 134, 1),
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
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
                        onTap: () {},
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
                                    Image.asset('assets/images/LineIcon.png'),
                                width: 100,
                                height: 100,
                              ),
                              Text(
                                'Area',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromRGBO(134, 134, 134, 1),
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () =>
                            Navigator.of(context).pushNamed('/newRoute'),
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
                                child: Image.asset('assets/images/AllIcon.png'),
                                width: 100,
                                height: 100,
                              ),
                              Text(
                                'All',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromRGBO(134, 134, 134, 1),
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
        ]));
  }
}

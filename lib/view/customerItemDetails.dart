//Screen 13
import 'package:flutter/material.dart';

class CustomerItemDetails extends StatelessWidget {
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
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.white,
            child: ListTile(
              title: Text(
                'Mohamed Amr',
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
            height: 120,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            padding: EdgeInsets.only(left: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'New Cairo',
                  style: TextStyle(
                      color:
                          Color.fromRGBO(96, 125, 130, 1), //rgb(96, 125, 130)
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Text(
                  'Created By: Nada Ayman',
                  style: TextStyle(
                      color: Color.fromRGBO(96, 125, 130, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Text(
                  'Created At : 09:15 AM',
                  style: TextStyle(
                      color: Color.fromRGBO(96, 125, 130, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Text(
                  'Orders: 32 Orders',
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
                    title: Text(
                      'Mohamed Amr',
                      style: TextStyle(
                          color: Color.fromRGBO(170, 44, 94, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    subtitle: Text(
                      'New Cairo Narges 2, NO . 41',
                      style: TextStyle(
                          color: Color.fromRGBO(96, 125, 130, 1), fontSize: 14),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '9723 EGP',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: 10,
              reverse: true,
            ),
          ))
        ],
      ),
    );
  }
}

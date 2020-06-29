import 'package:flutter/material.dart';

class OrderTile extends StatelessWidget {
  final String title;
  final String address;
  final String price;
  final String factoryName;
  final String lineName;
  OrderTile(
      {this.title, this.address, this.price, this.factoryName, this.lineName});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(bottom:12,left: 8,right: 8),
      child: Column(
        children: [
          ListTile(
            
            title: Text(
              title,
              style: TextStyle(
                  color: Color.fromRGBO(170, 44, 94, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 17.5),
            ),
            subtitle: Text(
           ""+   address,
              style: TextStyle(
                  color: Color.fromRGBO(96, 125, 129, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 15.5),
            ),
            trailing: Text(
              price,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    factoryName,
                    style: TextStyle(
                      color: Color.fromRGBO(96, 125, 129, 1),
                      fontSize: 14
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Non veniam eu ea anim\noccaecat culpa nisi\ndo veniam aute\nnon irure consequat.'),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(lineName,
                  style: TextStyle(
                    color: Color.fromRGBO(255,171,0,1),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),),
                ),
              ],
            ),
          ),
          Container(child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Container(
              child: Text('Call'),
            ),
            Container(child: Text('Add to distrbute'),)
          ],),)
        ],
      ),
    );
  }
}

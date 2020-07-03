//Screen 10
import 'package:flutter/material.dart';
import 'package:maglis_app/widgets/gridItems.dart';

class CollectedRoutes extends StatelessWidget {
  const CollectedRoutes({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              leading: Image.asset('assets/images/PersonCheck.png',width: 50,height: 50,),
              title: Text(
                'Collected Routes',
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
            secondItemName: 'Person',
          ),
         

        ],
      ),
    );
  }
}

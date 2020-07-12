import 'package:flutter/material.dart';

//Screen 43
class AdminPage extends StatelessWidget {
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
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: () =>
                            Navigator.of(context).pushNamed('/finance'),
                        child: Container(
                          width: size.width / 2.25,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(width: 2.5, color: Colors.grey[400]),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.asset('assets/images/Finance.png'),
                        ),
                      ),
                      InkWell(
                        onTap: () =>
                            Navigator.of(context).pushNamed('/distribution'),
                        child: Container(
                          width: size.width / 2.25,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(width: 2.5, color: Colors.grey[400]),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.asset('assets/images/Distribution.png'),
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
                        onTap: ()=>Navigator.of(context).pushNamed('/orderScreen'),
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
                                    Image.asset('assets/images/OrdersIcon.png'),
                                width: 100,
                                height: 100,
                              ),
                              Text(
                                'Orders',
                                style: TextStyle(
                                    fontSize: 18,
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
                        child: Image.asset('assets/images/Representatives.png'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: size.width / 2.25,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(width: 2.5, color: Colors.grey[400]),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image.asset('assets/images/CustomerService.png'),
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
                        child: Image.asset('assets/images/Reports.png'),
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
        ],
      ),
    );
  }
}

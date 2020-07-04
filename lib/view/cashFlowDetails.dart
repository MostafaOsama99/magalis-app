import 'package:flutter/material.dart';
//Screen 7
class CashFlowDetails extends StatelessWidget {
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
          Container(
            color: Colors.white,
            child: ListTile(
              title: Text(
                'Amr Nasser',
                style: TextStyle(
                    color: Color.fromRGBO(170, 44, 94, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    width: size.width,
                    height: height / 5,
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          width: 2.5, color: Colors.grey[400].withOpacity(0.9)),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Company : Al Ghazl',
                          style: TextStyle(
                              color: Color.fromRGBO(170, 44, 94, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          '21/8/2020',
                          style: TextStyle(
                              color: Color.fromRGBO(96, 125, 130, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ), //rgb(96, 125, 130)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Cash',
                              style: TextStyle(
                                  color: Color.fromRGBO(96, 125, 130, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Text(
                              '2140 EGP',
                              style: TextStyle(
                                  color: Color.fromRGBO(96, 125, 130, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: height * 2 / 5,
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          width: 2.5, color: Colors.grey[400].withOpacity(0.9)),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Image',
                          style: TextStyle(
                              color: Color.fromRGBO(170, 44, 94, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: Divider(
                            color: Colors.grey,
                            thickness: 3,
                          ),
                        ), //rgb(96, 125, 130)
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(224, 224, 224, 1),
                              borderRadius: BorderRadius.circular(10)),
                          //rgb(224, 224, 224)
                          child: ClipRRect(
                            child: Center(
                              child: Icon(
                                Icons.insert_photo,
                                size: 50,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ))
                      ],
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: height * 2 / 5,
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          width: 2.5, color: Colors.grey[400].withOpacity(0.9)),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Note',
                          style: TextStyle(
                              color: Color.fromRGBO(170, 44, 94, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: Divider(
                            color: Colors.grey,
                            thickness: 3,
                          ),
                        ), //rgb(96, 125, 130)
                        Expanded(
                            child: Container(
                              width: double.infinity,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(224, 224, 224, 1),
                              borderRadius: BorderRadius.circular(12)),
                          //rgb(96, 125, 130)
                          child:  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                  'Text',
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Color.fromRGBO(96, 125, 130, 1),
                                  ),
                                ),
                          ),
                            
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

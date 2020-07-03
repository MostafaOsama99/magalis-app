import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
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
        body: SingleChildScrollView(
                  child: Column(children: [
            SizedBox(
              height: 10,
            ),
            Container(
                color: Colors.white,
                child: ListTile(
                  title: Text(
                    'Add New Expenses',
                    style: TextStyle(
                        color: Color.fromRGBO(170, 44, 94, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                )),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              padding: EdgeInsets.only(left: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'User Name',
                    style: TextStyle(
                        color:
                            Color.fromRGBO(96, 125, 130, 1), //rgb(96, 125, 130)
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Text(
                    'Date: 18/5/2020',
                    style: TextStyle(
                        color: Color.fromRGBO(96, 125, 130, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 2,
                  color: Colors.grey.withOpacity(0.5),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Supplier Name',
                    style: TextStyle(
                        color: Color.fromRGBO(170, 44, 94, 1), //rgb(96, 125, 130)
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    child: Divider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: Colors.grey[400].withOpacity(0.9)),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Write here',
                            contentPadding: EdgeInsets.only(left: 10),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 2,
                  color: Colors.grey.withOpacity(0.5),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Attachment',
                        style: TextStyle(
                            color: Color.fromRGBO(
                                170, 44, 94, 1), //rgb(96, 125, 130)
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[400], width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Icon(
                            Icons.add,
                            size: 25,
                            color: Color.fromRGBO(96, 125, 129, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    child: Divider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                  ),
                  Text(
                    'IMG_09_M.jpg',
                  ),
                  Text(
                    'IMG_09_M.jpg',
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 2,
                  color: Colors.grey.withOpacity(0.5),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Amount',
                    style: TextStyle(
                        color: Color.fromRGBO(170, 44, 94, 1), //rgb(96, 125, 130)
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    child: Divider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: Colors.grey[400].withOpacity(0.9)),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: 'Write here',
                            contentPadding: EdgeInsets.only(left: 10),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey[400],
              width: 2),
              borderRadius: BorderRadius.circular(10)
              ),
              margin: EdgeInsets.all(12),
              child: Column(
              children: [
                CheckboxListTile(value: true,  onChanged: (v){},title: Text("Cash"),activeColor: Colors.orange,),
               Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18, ),
                    child: Divider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                  ),  CheckboxListTile(value: true,  onChanged: (v){},title: Text("Credit"),activeColor: Colors.orange,),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18,),
                    child: Divider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                  ), CheckboxListTile(value: true,  onChanged: (v){},title: Text("Cash and Credit"),activeColor: Colors.orange,),
                
              ],
            ),)
          ]),
        ));
  }
}

import 'package:flutter/material.dart';

class CashFlow extends StatefulWidget {
  @override
  _CashFlowState createState() => _CashFlowState();
}

class _CashFlowState extends State<CashFlow> {
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
        body: Column(children: [
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.white,
            child: ListTile(
              title: Text(
                'Cash Flow',
                style: TextStyle(
                    color: Color.fromRGBO(170, 44, 94, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            height: 0,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(170, 44, 94, 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "REVENUE\n14,350 EGP",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "EXPENSE\n4,350 EGP",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "NET\n4,350",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          cashFlowTile(true),
          cashFlowTile(false)
        ]));
  }

  cashFlowTile(revenue) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: 2.5,
            color: revenue == true
                ? Color.fromRGBO(170, 44, 94, 1)
                : Colors.grey[800],
          ),
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: RichText(
                      text: TextSpan(
                    text: "Pocket Money\n",
                    children: [
                      TextSpan(
                        text: 'Amr Nassar\n',
                        style: TextStyle(
                          color: Color.fromRGBO(96, 125, 129, 1),
                        ),
                      ),
                      TextSpan(
                        text: '21/8/2020',
                        style: TextStyle(
                            color: Color.fromRGBO(96, 125, 129, 1),
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: revenue == true
                          ? Color.fromRGBO(170, 44, 94, 1)
                          : Colors.grey[800],
                    ),
                  )),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '2140 EGP',
                      style: TextStyle(
                          color: revenue == true
                              ? Color.fromRGBO(170, 44, 94, 1)
                              : Colors.grey[800],
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "ADD",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: revenue == true
                            ? Color.fromRGBO(170, 44, 94, 1)
                            : Colors.grey[800],
                        borderRadius: BorderRadius.circular(5),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

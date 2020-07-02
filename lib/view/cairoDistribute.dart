import 'package:flutter/material.dart';

class CairoDistribute extends StatefulWidget {
  @override
  _CairoDistributeState createState() => _CairoDistributeState();
}

class _CairoDistributeState extends State<CairoDistribute> {
  List checkedMap = [];
  var expanded = true;
  @override
  Widget build(BuildContext context) {
    // for (var i = 0; i < 4; i++) {
    //   if (days.length  4) {
    //     checkedMap.add({
    //       'value': false,
    //     });

    //     days.add(CheckboxListTile(
    //         title: Text(
    //           'Sunday 13.04.2020',
    //           style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
    //         ),
    //         activeColor: Colors.orange,
    //         autofocus: true,
    //         value: checkedMap[i]['value'],
    //         onChanged: (v) => onChanged(v, i)));
    //   }
    // }

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
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.white,
            child: ListTile(
              title: Text(
                'Cairo',
                style: TextStyle(
                    color: Color.fromRGBO(170, 44, 94, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[400], width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Icon(
                        Icons.sort,
                        size: 25,
                        color: Color.fromRGBO(96, 125, 129, 1),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[400], width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Icon(
                        Icons.add,
                        size: 25,
                        color: Color.fromRGBO(96, 125, 129, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ListTile(
                  onTap: () {
                    if (expanded == true) {
                      setState(() {
                        expanded = false;
                      });
                    } else {
                      setState(() {
                        expanded = true;
                      });
                    }
                  },
                  trailing: Icon(
                    expanded == false ? Icons.expand_more : Icons.expand_less,
                    color: Color.fromRGBO(170, 44, 94, 1),
                  ),
                  title: Text(
                    'Day',
                    style: TextStyle(
                        color: Color.fromRGBO(170, 44, 94, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                expanded == true
                    ? Container(
                        height: double.parse((4 * 55).toString()),
                        child: ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, i) {
                            checkedMap.add({
                              'value': false,
                            });
                            return CheckboxListTile(
                                title: Text(
                                  'Sunday 13.04.2020',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                                activeColor: Colors.orange,              
                                value: checkedMap[i]['value'],
                                onChanged: (v) {
                                  if (checkedMap[i]['value'] == true) {
                                    setState(() {
                                      checkedMap[i]['value'] = false;
                                    });
                                  } else {
                                    setState(() {
                                      checkedMap[i]['value'] = true;
                                    });
                                  }
                                });
                          },
                        ),
                      )
                    : Wrap()
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, i) {
                    return Container(
                      
                      color: Colors.white,

                      child: ListTile(
                        trailing: Icon(Icons.edit,
                        color: Colors.orange,),
                        subtitle: Text(
                          "18.05.2020",
                          style: TextStyle(
                            color: Color.fromRGBO(96, 125, 129, 1),
                            fontSize: 15,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        title: Text(
                          "Mohamed Amr",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}

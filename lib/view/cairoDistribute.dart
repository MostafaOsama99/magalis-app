import 'package:flutter/material.dart';

class CairoDistribution extends StatefulWidget {
  @override
  _CairoDistributionState createState() => _CairoDistributionState();
}

class _CairoDistributionState extends State<CairoDistribution> {
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
                leading: Image.asset('assets/images/CairoIcon.png'),
                title: Text(
                  'Cairo',
                  style: TextStyle(
                      color: Color.fromRGBO(170, 44, 94, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              )),
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
                            Navigator.of(context).pushNamed('/collectedRoutes'),
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
                                child: Image.asset(
                                    'assets/images/PersonCheck.png'),
                                width: 100,
                                height: 100,
                              ),
                              FittedBox(
                                child: Text(
                                  'Collected Routes',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromRGBO(134, 134, 134, 1),
                                      fontWeight: FontWeight.bold),
                                ),
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
                              Container(
                                child: Image.asset(
                                  'assets/images/NotApproved.png',
                                ),
                                width: 150,
                                height: 120,
                              ),
                              FittedBox(
                                child: Text(
                                  'On Distribution Route',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromRGBO(134, 134, 134, 1),
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Image.asset(
                                  'assets/images/PersonCheck.png',
                                ),
                                width: 150,
                                height: 120,
                              ),
                              FittedBox(
                                child: Text(
                                  'New Routes',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromRGBO(134, 134, 134, 1),
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          )),
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

// import 'package:flutter/material.dart';

// class CairoDistribute extends StatefulWidget {
//   @override
//   _CairoDistributeState createState() => _CairoDistributeState();
// }

// class _CairoDistributeState extends State<CairoDistribute> {
//   List checkedMap = [];
//   var expanded = true;
//   @override
//   Widget build(BuildContext context) {
//     // for (var i = 0; i < 4; i++) {
//     //   if (days.length  4) {
//     //     checkedMap.add({
//     //       'value': false,
//     //     });

//     //     days.add(CheckboxListTile(
//     //         title: Text(
//     //           'Sunday 13.04.2020',
//     //           style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
//     //         ),
//     //         activeColor: Colors.orange,
//     //         autofocus: true,
//     //         value: checkedMap[i]['value'],
//     //         onChanged: (v) => onChanged(v, i)));
//     //   }
//     // }

//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       appBar: AppBar(
//         elevation: 10,
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         title: Image.asset(
//           'assets/images/logo.png',
//           width: 150,
//         ),
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 10,
//           ),
//           Container(
//             color: Colors.white,
//             child: ListTile(
//               title: Text(
//                 'Cairo',
//                 style: TextStyle(
//                     color: Color.fromRGBO(170, 44, 94, 1),
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20),
//               ),
//               trailing: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey[400], width: 2),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(6.0),
//                       child: Icon(
//                         Icons.sort,
//                         size: 25,
//                         color: Color.fromRGBO(96, 125, 129, 1),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 15,
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey[400], width: 2),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(6.0),
//                       child: Icon(
//                         Icons.add,
//                         size: 25,
//                         color: Color.fromRGBO(96, 125, 129, 1),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Container(
//             color: Colors.white,
//             child: Column(
//               children: <Widget>[
//                 ListTile(
//                   onTap: () {
//                     if (expanded == true) {
//                       setState(() {
//                         expanded = false;
//                       });
//                     } else {
//                       setState(() {
//                         expanded = true;
//                       });
//                     }
//                   },
//                   trailing: Icon(
//                     expanded == false ? Icons.expand_more : Icons.expand_less,
//                     color: Color.fromRGBO(170, 44, 94, 1),
//                   ),
//                   title: Text(
//                     'Day',
//                     style: TextStyle(
//                         color: Color.fromRGBO(170, 44, 94, 1),
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20),
//                   ),
//                 ),
//                 expanded == true
//                     ? Container(
//                         height: double.parse((4 * 55).toString()),
//                         child: ListView.builder(
//                           itemCount: 4,
//                           itemBuilder: (context, i) {
//                             checkedMap.add({
//                               'value': false,
//                             });
//                             return CheckboxListTile(
//                                 title: Text(
//                                   'Sunday 13.04.2020',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 18),
//                                 ),
//                                 activeColor: Colors.orange,
//                                 autofocus: true,
//                                 value: checkedMap[i]['value'],
//                                 onChanged: (v) {
//                                   if (checkedMap[i]['value'] == true) {
//                                     setState(() {
//                                       checkedMap[i]['value'] = false;
//                                     });
//                                   } else {
//                                     setState(() {
//                                       checkedMap[i]['value'] = true;
//                                     });
//                                   }
//                                 });
//                           },
//                         ),
//                       )
//                     : Wrap()
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Expanded(
//               child: ListView.builder(
//                   itemCount: 5,
//                   itemBuilder: (context, i) {
//                     return Container(

//                       color: Colors.white,

//                       child: ListTile(
//                         trailing: Icon(Icons.edit,
//                         color: Colors.orange,),
//                         subtitle: Text(
//                           "18.05.2020",
//                           style: TextStyle(
//                             color: Color.fromRGBO(96, 125, 129, 1),
//                             fontSize: 15,
//                             fontWeight: FontWeight.w600
//                           ),
//                         ),
//                         title: Text(
//                           "Mohamed Amr",
//                           style: TextStyle(
//                               fontSize: 17, fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                     );
//                   }))
//         ],
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maglis_app/widgets/bottomNavigator.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List suppliers = [];
  bool called = false;
  List<String> areas = [];
  List<String> selectedAreas = [];
  List<String> lines = [
    'Bean Bags',
    'Rattan',
    'Travel accessories',
    'Luxurious chair',
    'Wooden products'
  ];
  List<String> selectedLines = [];
  DateTime date = DateTime.now();
  bool isDate = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FutureBuilder<DocumentSnapshot>(
        future: Firestore.instance.collection('myInfo').document('area').get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting && !called) {
            called = true;
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          areas = (snapshot.data.data['areas'] as List)
              .map((e) => e.toString())
              .toList();
          return Scaffold(
              bottomNavigationBar: BottomNavigator(),
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
              body: Container(
                width: size.width,
                height: size.height,
                child: ListView(
                  children: [
                    Container(
                      color: Colors.white,
                      child: ListTile(
                        leading: Icon(Icons.sort, size: 35),
                        title: Text(
                          'Filter',
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
                    Container(
                      height: size.height / 3,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey[400], width: 2),
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 18.0, left: 18),
                            child: Text(
                              'Area',
                              style: TextStyle(
                                  color: Color.fromRGBO(170, 44, 94, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 4,
                            ),
                            child: Divider(
                              color: Colors.black,
                              thickness: 2,
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemBuilder: (ctx, index) {
                                return Column(
                                  children: <Widget>[
                                    CheckboxListTile(
                                      value:
                                          selectedAreas.contains(areas[index]),
                                      onChanged: (v) {
                                        if (v) {
                                          setState(() {
                                            selectedAreas.add(areas[index]);
                                          });
                                        } else {
                                          setState(() {
                                            selectedAreas.removeWhere(
                                                (element) =>
                                                    element == areas[index]);
                                          });
                                        }
                                      },
                                      title: Text("${areas[index]}"),
                                      activeColor: Colors.orange,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 18,
                                      ),
                                      child: Divider(
                                        color: Colors.black,
                                        thickness: 2,
                                      ),
                                    ),
                                  ],
                                );
                              },
                              itemCount: areas.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: size.height / 3,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey[400], width: 2),
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 18.0, left: 18),
                            child: Text(
                              'Lines',
                              style: TextStyle(
                                  color: Color.fromRGBO(170, 44, 94, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 4,
                            ),
                            child: Divider(
                              color: Colors.black,
                              thickness: 2,
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemBuilder: (ctx, index) {
                                return Column(
                                  children: <Widget>[
                                    CheckboxListTile(
                                      value:
                                          selectedLines.contains(lines[index]),
                                      onChanged: (v) {
                                        if (v) {
                                          setState(() {
                                            selectedLines.add(lines[index]);
                                          });
                                        } else {
                                          setState(() {
                                            selectedLines.removeWhere(
                                                (element) =>
                                                    element == lines[index]);
                                          });
                                        }
                                      },
                                      title: Text("${lines[index]}"),
                                      activeColor: Colors.orange,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 18,
                                      ),
                                      child: Divider(
                                        color: Colors.black,
                                        thickness: 2,
                                      ),
                                    ),
                                  ],
                                );
                              },
                              itemCount: lines.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        final newDate = await showDatePicker(
                          context: context,
                          initialDate: date,
                          firstDate: DateTime(2010),
                          lastDate: DateTime(2030),
                        );
                        if (newDate == null) return;
                        setState(() {
                          date = newDate;
                        });
                      },
                      child: Container(
                        height: size.height / 5.5,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.grey[400], width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 18.0, left: 18),
                              child: Text(
                                'Time',
                                style: TextStyle(
                                    color: Color.fromRGBO(170, 44, 94, 1),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 4,
                              ),
                              child: Divider(
                                color: Colors.black,
                                thickness: 2,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: CheckboxListTile(
                                value: isDate,
                                onChanged: (v) {
                                  if (v) {
                                    setState(() {
                                      isDate = true;
                                    });
                                  } else {
                                    setState(() {
                                      isDate = false;
                                    });
                                  }
                                },
                                title: Text(
                                  '${DateFormat.yMd().format(date)}',
                                  style: TextStyle(
                                      color: Color.fromRGBO(170, 44, 94, 1),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                activeColor: Colors.orange,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        print(selectedAreas);
                        print(selectedLines);
                        if (isDate) {
                          Map filterMap = {
                            'lines': selectedLines,
                            'areas': selectedAreas,
                            'date': DateFormat.yMd().format(date),
                          };
                          print(filterMap);
                          Navigator.of(context).pop(filterMap);
                        } else {
                          Map filterMap = {
                            'lines': selectedLines,
                            'areas': selectedAreas,
                          };

                          print(filterMap);
                          Navigator.of(context).pop(filterMap);
                        }
                      },
                      child: Container(
                        color: Color.fromRGBO(170, 44, 94, 1),
                        width: size.width,
                        height: 50,
                        child: Center(
                          child: Text(
                            'Filter',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        });
  }
}

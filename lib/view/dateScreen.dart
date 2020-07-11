//screen 11
import 'package:flutter/material.dart';

class DateScreen extends StatelessWidget {
  const DateScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context).settings.arguments as Map;
    final List dates = argument['date'];
    final String route = argument['route'];
    final type = argument['type'];
    String logo = '';
    String title=  '';
    if(type == 1){
      logo ='assets/images/DateIcon.png';
      title  = 'Date';
    }else if(type == 2){
      logo ='assets/images/Person.png';
      title  = 'User';
    }else if(type == 3){
      logo ='assets/images/Person.png';
      title  = 'Supplier';
    }
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
              leading: Image.asset(
                logo,
                width: 50,
                height: 50,
              ),
              title: Text(
                title,
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
                    onTap: () =>
                        Navigator.of(context).pushNamed(route,arguments: {'type':type,'date':dates[index]}),
                    title: Text(
                      '${dates[index]}',
                      style: TextStyle(
                          color: Color.fromRGBO(170, 44, 94, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                );
              },
              itemCount: dates.length,
            ),
          ))
        ],
      ),
    );
  }
}
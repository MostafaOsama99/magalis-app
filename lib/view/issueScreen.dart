import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class IssueScreen extends StatelessWidget {
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
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.white,
            child: ListTile(
              leading: Image.asset(
                'assets/images/Report.png',
                width: 50,
                height: 50,
              ),
              title: Text(
                'Issues',
                style: TextStyle(
                    color: Color.fromRGBO(170, 44, 94, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('issues').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                return ListView.builder(
                  itemBuilder: (ctx, index) {
                    return approvedTile(
                      suplierName:
                          snapshot.data.documents[index].data['createdUser'],
                      date: snapshot.data.documents[index].data['createdDate'],
                      userName: (snapshot.data.documents[index].data['isCairo']
                              as bool)
                          ? 'Cairo Route'
                          : 'Cities Routes',
                      context: context,
                      description:
                          snapshot.data.documents[index].data['description'],
                    ); //isCairo
                  },
                  itemCount: snapshot.data.documents.length,
                );
              },
            ),
          )
        ],
      ),
    );
  }

  approvedTile(
      {String suplierName,
      String userName,
      String date,
      description,
      String documentId,
      context}) {
    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          content: Text('$description'),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              width: 2.5,
              color: Colors.black,
            ),
            color: Colors.white,
          ),
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: RichText(
                        text: TextSpan(
                      text: "${suplierName}\n",
                      children: [
                        TextSpan(
                          text: '${userName}\n',
                          style: TextStyle(
                            color: Color.fromRGBO(96, 125, 129, 1),
                          ),
                        ),
                        TextSpan(
                          text: '${date}',
                          style: TextStyle(
                              color: Color.fromRGBO(96, 125, 129, 1),
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ],
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(170, 44, 94, 1)),
                    )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

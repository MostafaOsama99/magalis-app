import 'package:flutter/material.dart';

class GridTileWidget extends StatelessWidget {
  final String route, icon, title;

  const GridTileWidget({this.route, this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: () => Navigator.of(context).pushNamed(route),
        child: Container(
         // padding: EdgeInsets.all(16),
          width: 20,
          height: 130,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1.2, color: Colors.grey[400]),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [ BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.5,
              blurRadius: 2,
              offset: Offset(2, 3), // changes position of shadow
            ),]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                icon,
                width: 60,
                height: 60,
              ),
              //  SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: FittedBox(
                    child: Text(
                  title,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 19,
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

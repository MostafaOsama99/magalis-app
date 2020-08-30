import 'package:flutter/material.dart';


class GridTile extends StatelessWidget {
  final String route ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.of(context).pushNamed('/finance'),
      child: Container(
        width: size.width / 2.25,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              width: 2.5, color: Colors.grey[400]),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.asset('assets/images/Finance.png'),
      ),
    );
  }
}

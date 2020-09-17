import 'package:flutter/material.dart';
import 'package:maglis_app/osama/test/test_main.dart';

import '../test/invoice.dart';
import '../widgets/add_product.dart';

class PrepareToPrint extends StatefulWidget {
  final String orderDescription,
      paymentName,
      shippingName,
      shippingAddress,
      paymentAddress,
      paymentPhone,
      id,
      shippingNote,
      shippingPhone,
      time;

  const PrepareToPrint(
      {@required this.orderDescription,
      @required this.paymentName,
      @required this.shippingName,
      @required this.shippingAddress,
      @required this.paymentAddress,
      @required this.paymentPhone,
      @required this.id,
      @required this.shippingNote,
      @required this.shippingPhone,
      @required this.time});

  @override
  _PrepareToPrintState createState() => _PrepareToPrintState();
}

class _PrepareToPrintState extends State<PrepareToPrint> {
  List<Product> _products = [];

  addProduct(int qty, String description, double price) {
    setState(() {
      _products.add(Product(
          qty: qty, name: description, price: price, amount: price * qty));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 7,
          title: Text(
            'Prepare to print',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(
                  Icons.print,
                  color: Colors.pink.shade600,
                ),
                onPressed: () => _products.length == 0 ? showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Attention'),
                        content: Text('add a product at least'),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('okay'),
                            onPressed: () => Navigator.of(context).pop(),
                          )
                        ],
                      );
                    }) : Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TestInvoice(
                            paymentName: widget.paymentName,
                            shippingName: widget.shippingName,
                            shippingAddress: widget.shippingAddress,
                            paymentAddress: widget.paymentAddress,
                            paymentPhone: widget.paymentPhone,
                            id: widget.id,
                            shippingNote: widget.shippingNote,
                            shippingPhone: widget.shippingPhone,
                            time: widget.time,
                            products: _products))))
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Order description',
                      style: TextStyle(
                          decoration: TextDecoration.underline, fontSize: 17),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                      height: 130,
                      child: TextFormField(
                        readOnly: true,
                        initialValue: widget.orderDescription,
                        enableInteractiveSelection: true,
                        maxLines: null,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      )),
                ],
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Divider(thickness: 1)),
            Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.5,
                    blurRadius: 2,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(children: [
                    Text(
                      'Products',
                      style: TextStyle(fontSize: 17),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.pink.shade500,
                      ),
                      onPressed: () => showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: AddProduct(addProduct),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            );
                          }),
                    ),
                  ]),
                )),
            SizedBox(height: 8),
            Expanded(
              child: _products.length > 0
                  ? ListView.builder(
                      itemCount: _products.length,
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Card(
                              elevation: 3,
                              child: ListTile(
                                leading: Text('${_products[index].qty}'),
                                title: Text('${_products[index].name}'),
                                trailing: Text('${_products[index].price} LE'),
                              ),
                            ),
                          ))
                  : Center(
                      child: Text(
                        'no products added!',
                        style: TextStyle(
                            fontSize: 17, fontStyle: FontStyle.italic),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}

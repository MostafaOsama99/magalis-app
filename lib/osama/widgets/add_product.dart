import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  final Function(int qty, String description, double price) addProduct;

  AddProduct(this.addProduct);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController qtyController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  final TextEditingController priceController = TextEditingController();

  final FocusNode descriptionFocus = FocusNode();

  final FocusNode priceFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    qtyController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    descriptionFocus.dispose();
    priceFocus.dispose();
    super.dispose();
  }

  saveForm() {
    if (!_formKey.currentState.validate()) return;

    widget.addProduct(int.parse(qtyController.text), descriptionController.text,
        double.parse(priceController.text));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 15),
     // decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
                controller: qtyController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(descriptionFocus),
                decoration: InputDecoration(
                    labelText: 'QTY',
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink.shade500))),
                validator: (value) {
                  if (value.isEmpty )
                    return 'this field is required';
                  if(int.tryParse(value) <= 0) return 'invalid value' ;
                  return null;
                }),
            TextFormField(
              controller: descriptionController,
              focusNode: descriptionFocus,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) =>
                  FocusScope.of(context).requestFocus(priceFocus),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: 'Description',
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink.shade500,))),
              validator: (value) {
                if (value.isEmpty) return 'this field is required';
                return null;
              },
            ),
            TextFormField(
                controller: priceController,
                focusNode: priceFocus,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Price',
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink.shade500)),
                ),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).unfocus();
                  saveForm();
                },
                validator: (value) {
                  if (value.isEmpty) return 'please enter the price';
                  if (double.tryParse(value) == null ||
                      double.parse(value) <= 0)
                    return 'please enter a valid number';
                  return null;
                }),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: saveForm,
                      child: Chip(
                        label: Text('add Product', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),),
                        backgroundColor: Colors.pink.shade500,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

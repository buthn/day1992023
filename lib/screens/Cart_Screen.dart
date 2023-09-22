import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/product.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key, required this.producrList});

  List<Product> producrList;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Product> products = [];

  @override
  void initState() {
    _getData();
    super.initState();
  }

  _getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    widget.producrList.forEach((element) {
      if (prefs.containsKey(element.productName!)) {
        products.add(element);
      }
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].productName!),
            subtitle: Text(products[index].Category!),
            leading: Text(products[index].price.toString()),
          );
        },
        itemCount: products.length,
      ),
    );
  }
}

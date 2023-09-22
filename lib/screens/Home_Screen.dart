import 'dart:convert';

import 'package:day1992023/models/product.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Cart_Screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {

    List<Product> producrList = [
      Product(productName: "Pin",Category: "Schools Materials",price: 2.00),
      Product(productName: "Iphone",Category: "Electronic",price: 500.00),
      Product(productName: "AC",Category: "Electronic",price: 300.00),
    ];

    // _getAndPostData()async{
    //   SharedPreferences preferences = await SharedPreferences.getInstance();
    //   Map<String,dynamic> item = {
    //     "productName":producrList[0].productName,
    //     "Category":producrList[0].Category,
    //     "price":producrList[0].price,
    //
    //   };
    //
    //   String data = jsonEncode(item);
    //   var prefData = preferences.setString(producrList[0].productName!, data);
    //
    // }



    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return CartScreen(producrList:producrList);
            }));
          }, icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: ListView.builder(
        itemCount: producrList.length,
        itemBuilder: (context,i){
          return Card(
            child: ListTile(
              title: Text("${producrList[i].productName}"),
              subtitle: Text("${producrList[i].Category}"),
              leading: CircleAvatar(
                backgroundColor: Colors.black26,
              ),
              trailing: IconButton(onPressed: ()async{
                SharedPreferences preferences = await SharedPreferences.getInstance();
                String data = jsonEncode(producrList[i].toMap());
                 preferences.setString(producrList[i].productName!, data);

              },icon: Icon(Icons.shopping_cart)),
            ),
          );
        },
      ),
    );
  }
}

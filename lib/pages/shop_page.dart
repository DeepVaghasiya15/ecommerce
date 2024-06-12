import 'package:ecommerce/components/my_drawer.dart';
import 'package:ecommerce/components/my_product_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    //access products in shop
    final products = context.watch<Shop>().shop;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Shop Page"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () => Navigator.pushNamed(context, '/cartPage'), icon: Icon(Icons.shopping_cart_outlined))
        ],
      ),
      drawer: MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          Center(child: Text("Pick from a selected list of Premium Products",
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),)),
          SizedBox(
            height: 550,
            child: ListView.builder(
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(15),
                itemBuilder: (context, index){
                  final product = products[index];
                  return MyProductTile(product: product);
                }),
          ),
        ]

      ),
    );
  }
}

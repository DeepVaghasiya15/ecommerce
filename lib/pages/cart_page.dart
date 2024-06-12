import 'package:ecommerce/components/my_button.dart';
import 'package:ecommerce/model/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("Remove this item from your cart?"),
              actions: [
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<Shop>().removeFromCart(product);
                  },
                  child: Text("Yes"),
                )
              ],
            ));
  }

  void payButtonPressed(BuildContext context){
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text("User wants to pay! Connect this app to your payment backend"),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Cart'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(child: cart.isEmpty
      ? Center(child: Text("Your cart is empty.."))
          : ListView.builder
            (
            itemCount: cart.length,
              itemBuilder: (context, index) {
            //get individual item in cart
            final item = cart[index];
            //return as a cart tile UI
            return ListTile(
              title: Text(item.name),
              subtitle: Text(item.price),
              trailing: IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () => removeItemFromCart(context, item),
              ),
            );
          })),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(onTap: () => payButtonPressed(context), child: Text("Pay Now")),
          )
        ],
      ),
    );
  }
}

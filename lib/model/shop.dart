import 'package:ecommerce/model/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier{
  //Product for sale
  final List<Product> _shop = [
    //Product 1
    Product(name: "Product 1", price: "₹99.99", description: "Product Description", imagePath: "assets/images/1.webp"),
    //Product 2
    Product(name: "Product 2", price: "₹99.99", description: "Product Description", imagePath: "assets/images/2.jpg"),
    //Product 3
    Product(name: "Product 3", price: "₹99.99", description: "Product Description", imagePath: "assets/images/3.webp"),
    //Product 4
    Product(name: "Product 4", price: "₹99.99", description: "Product Description", imagePath: "assets/images/4.webp"),
  ];
  //user cart
  List<Product> _cart = [];
  //get product list
  List<Product> get shop => _shop;
  //get user cart
  List<Product> get cart => _cart;
  //add item to cart
  void addToCart(Product item){
    _cart.add(item);
    notifyListeners();
  }
  //remove item from cart
  void removeFromCart(Product item){
    _cart.remove(item);
    notifyListeners();
  }
}
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_wiggli_app/models/categorie.dart';
import 'package:test_wiggli_app/models/product.dart';

final productProvider =
    ChangeNotifierProvider<ProductProvider>((ref) => ProductProvider());

class ProductProvider extends ChangeNotifier {
  ProductProvider() {
    initState();
  }
  void initState() {
    getProductsOne();
    getProductsTow();
  }

  List<Product> productsListOne = [];
  List<Product> productsListTow = [];
  List<Product> productsListCart = [];
  List<Product> productsListCartDistinct = [];
  final List<Categorie> categories = [
    Categorie('All', ""),
    Categorie('Gamming', "assets/icons/gaming-pad-01.svg"),
    Categorie('Speaker', "assets/icons/speaker-01.svg"),
    Categorie('Headphones', "assets/icons/headphones-02.svg")
  ];

  Future<void> getProductsOne() async {
    final String response =
        await rootBundle.loadString('assets/json/products_1.json');
    final data = await json.decode(response);

    if (data.isNotEmpty) {
      for (int i = 0; i < data.length; i++) {
        productsListOne.add(Product.fromJson(data[i]));
      }
    }

    notifyListeners();
  }

  Future<void> getProductsTow() async {
    final String response =
        await rootBundle.loadString('assets/json/products_2.json');
    final data = await json.decode(response);

    if (data.isNotEmpty) {
      for (int i = 0; i < data.length; i++) {
        productsListTow.add(Product.fromJson(data[i]));
      }
    }
    notifyListeners();
  }

  void addProductToCart(Product product) {
    productsListCart.add(product);

    if (!productsListCartDistinct.contains(product)) {
      productsListCartDistinct.add(product);
    }

    notifyListeners();
  }

  void removeProductFromCart(Product product) {
    if (productsListCart.contains(product)) {
      productsListCart.remove(product);
    }
    if (productsListCartDistinct.contains(product)) {
      productsListCartDistinct.remove(product);
    }

    notifyListeners();
  }

  int countProduct(Product product) {
    return productsListCart
        .where((productCart) => productCart == product)
        .length;
  }

  double getTotalPrice() {
    double totalPrice = productsListCart.fold(
      0.0,
      (double previousValue, Product product) => previousValue + product.price,
    );

    return totalPrice;
  }

  double getTotalPriceWithDelevryCost() {
    double totalPrice = productsListCart.fold(
      0.0,
      (double previousValue, Product product) => previousValue + product.price,
    );

    if (totalPrice == 0) {
      return totalPrice;
    }

    return totalPrice - 23;
  }
}

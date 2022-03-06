import 'package:flutter/cupertino.dart';
import 'package:riverpod/riverpod.dart';

import '../data/product.dart';

class CartState extends StateNotifier<List<Product>> {
  CartState([List<Product>? productsInCart]) : super(productsInCart ?? []);

  void add(Product product) => state = [...state, product];

  void remove(String name) => state = [
        for (final product in state)
          if (product.name != name) product,
      ];

  get length {
    return state.length;
  }
}

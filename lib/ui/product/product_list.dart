import 'package:flutter/material.dart';
import 'package:food_chain/ui/product/product_item.dart';

import '../../data/product.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 10; i++) {
      products.add(_getProduct());
    }
    return ListView.builder(
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: ((context, index) => Column(children: [
              ProductItem(data: products[index]),
              const SizedBox(
                height: 20,
              )
            ])));
  }

  Product _getProduct() {
    const Product data = Product(
        name: 'Pizza',
        description: 'description',
        thumbnail:
            'https://images.pexels.com/photos/1260968/pexels-photo-1260968.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        rating: 7.6);

    return data;
  }
}

import 'package:flutter/material.dart';
import 'package:food_chain/ui/product/product_list.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        child: const ProductList());
  }
}

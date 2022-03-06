import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_chain/main.dart';
import 'package:food_chain/ui/product/product_item.dart';

class ProductList extends ConsumerWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider);

    return products.when(
        data: (data) => ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: ((context, index) => Column(children: [
                  ProductItem(data: data[index]),
                  const SizedBox(
                    height: 20,
                  )
                ]))),
        error: (err, stack) => Text(err.toString()),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}

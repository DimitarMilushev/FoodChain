import 'package:flutter/material.dart';
import 'package:food_chain/data/product.dart';
import 'package:food_chain/ui/product/rating.dart';

class ProductItem extends StatelessWidget {
  final Product data;
  const ProductItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: NetworkImage(data.thumbnail), fit: BoxFit.cover)));
    // child: ProductLabel(title: data.name, rating: data.rating));
  }
}

class ProductLabel extends StatelessWidget {
  final String title;
  final double rating;
  const ProductLabel({Key? key, required this.title, required this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        height: 50,
        child: ListTile(
          tileColor: Colors.greenAccent,
          leading: const Icon(Icons.fork_left),
          title: Text(title),
          trailing: RatingElement(rating),
        ));
    // return Card(
    //     child: ListTile(
    //   minLeadingWidth: 20,
    //   tileColor: Colors.greenAccent,
    //   leading: const Icon(Icons.fork_left),
    //   title: Text(title),
    //   trailing: RatingElement(rating),
    // ));

    // return Expanded(
    //     child: ListTile(
    //   minLeadingWidth: 20,
    //   tileColor: Colors.white,
    //   leading: const Icon(Icons.fork_left),
    //   title: Text(title),
    //   trailing: RatingElement(rating),
    // ));
  }
}

import 'package:flutter/material.dart';
import 'package:food_chain/data/product.dart';
import 'package:food_chain/ui/product/rating.dart';

class ProductItem extends StatefulWidget {
  final Product data;
  const ProductItem({Key? key, required this.data}) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: _getSelected,
        child: Container(
            constraints: const BoxConstraints(maxWidth: 400, maxHeight: 200),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Expanded(
                    flex: 8,
                    child: ProductLeading(
                      thumbnail: widget.data.thumbnail,
                      isSelected: isSelected,
                    )),
                Expanded(
                    flex: 2,
                    child: ProductLabel(
                        title: widget.data.name, rating: widget.data.rating))
              ],
            )));
  }

  void _getSelected() {
    setState(() {
      isSelected = !isSelected;
    });
  }
}

class ProductLeading extends StatelessWidget {
  final String thumbnail;
  final bool isSelected;
  const ProductLeading(
      {Key? key, required this.thumbnail, required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          flex: 8,
          child: Image.network(
            thumbnail,
            fit: BoxFit.fitWidth,
          )),
      Expanded(flex: 2, child: PurchaseIcon(isSelected: isSelected))
    ]);
  }
}

class PurchaseIcon extends StatelessWidget {
  final bool isSelected;
  const PurchaseIcon({Key? key, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          color: !isSelected ? Colors.transparent : Colors.greenAccent),
      child: !isSelected
          ? const Icon(Icons.shopping_cart)
          : const Icon(Icons.check),
    );
  }
}

class ProductLabel extends StatelessWidget {
  final String title;
  final double rating;
  const ProductLabel({Key? key, required this.title, required this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), RatingElement(rating)]));
  }
}

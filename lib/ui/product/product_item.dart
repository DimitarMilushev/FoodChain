import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_chain/common/constants.dart';
import 'package:food_chain/data/product.dart';
import 'package:food_chain/main.dart';
import 'package:food_chain/state/cart_state.dart';
import 'package:food_chain/ui/product/rating.dart';

class ProductItem extends ConsumerStatefulWidget {
  final Product data;
  const ProductItem({Key? key, required this.data}) : super(key: key);

  @override
  ConsumerState<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends ConsumerState<ProductItem> {
  bool isSelected = false;

  @override
  Widget build(
    BuildContext context,
  ) {
    final cartState = ref.watch(cartProvider.notifier);
    return InkWell(
        onTap: () => _getSelected(cartState),
        child: Container(
            constraints: const BoxConstraints(maxWidth: 400, maxHeight: 200),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: primaryText,
            ),
            child: Row(
              children: [
                Expanded(
                    flex: 8,
                    child: ProductLeading(
                      thumbnail: widget.data.thumbnail,
                      title: widget.data.name,
                      rating: widget.data.rating,
                    )),
                Expanded(flex: 2, child: PurchaseIcon(isSelected: isSelected))
              ],
            )));
  }

  void _getSelected(CartState state) {
    setState(() {
      isSelected = !isSelected;
      // if selected - add item, else remove it
      isSelected ? state.add(widget.data) : state.remove(widget.data.name);
    });
  }
}

class ProductLeading extends StatelessWidget {
  final String thumbnail;
  final String title;
  final double rating;
  const ProductLeading(
      {Key? key,
      required this.thumbnail,
      required this.title,
      required this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          flex: 8,
          child: Image(
            image: NetworkImage(thumbnail),
            fit: BoxFit.fill,
          )),
      Expanded(flex: 2, child: ProductLabel(title: title, rating: rating))
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
      decoration:
          BoxDecoration(color: !isSelected ? primaryText : secondaryBackground),
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
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(color: primaryText),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), RatingElement(rating)]));
  }
}

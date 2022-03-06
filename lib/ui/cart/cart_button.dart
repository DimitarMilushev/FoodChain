import 'package:flutter/material.dart';

class FloatingCartButton extends StatelessWidget {
  final int amount;
  final VoidCallback? onPressed;
  const FloatingCartButton({Key? key, this.onPressed, required this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        onPressed: onPressed,
        icon: const Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
        label: Text(amount.toString()));
  }
}

import 'package:flutter/material.dart';

class RatingElement extends StatelessWidget {
  final double rating;
  const RatingElement(this.rating, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(rating.toString()),
        const SizedBox(width: 3),
        const Icon(Icons.star),
      ],
    );
  }
}

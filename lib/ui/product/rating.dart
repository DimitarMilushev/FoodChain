import 'package:flutter/material.dart';

class RatingElement extends StatelessWidget {
  final double rating;
  const RatingElement(this.rating, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.star),
        const SizedBox(width: 3),
        Text(rating.toString())
      ],
    );
  }
}

import 'package:flutter/material.dart';

class CustomStarItems extends StatelessWidget {
  final double rating;

  CustomStarItems({required this.rating});

  Color getStarColor(int index) {
    double fractionalRating = rating - index;

    if (fractionalRating >= 1) {
      return Colors.orange;
    } else if (fractionalRating >= 0.5) {
      return Colors.orange;
    } else {
      return Colors.grey;
    }
  }
  // if (rating >= index + 1) {
  //   return Colors.orange; // Color for filled star
  // } else if (rating > index && rating < index + 1) {
  //   return Colors.orange; // Color for partially filled star
  // } else {
  //   return Colors.grey; // Color for unfilled star
  // }
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          Icons.star,
          size: 15,
          color: getStarColor(index),
        );
      }),
    );
  }
}

// Example usage:

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/product_model.dart';
import '../../color/color_manager.dart';

class TopProductPageDetails extends StatelessWidget {
  final ProductModel product;
  const TopProductPageDetails({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
          decoration: const BoxDecoration(color: AppColor.secondColor),
        ),
        Positioned(
            top: 30.0,
            right: Get.width / 8,
            left: Get.width / 8,
            child: Hero(
              tag: "${product.id}",
              child: Image.network(
                product.thumbnail,
                height: 200,
                fit: BoxFit.fill,
              ),
            ))
      ],
    );
  }
}

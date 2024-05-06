import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/home_controller/home_controller.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/favorite_controller/favorite_controller.dart';
import '../../color/color_manager.dart';
import 'custom_rateing_color.dart';

class CustomListItems extends GetView<HomeController> {
  final ProductModel itemsModel;
  // final bool active;
  const CustomListItems({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteController());
    return InkWell(
        onTap: () {
          // Get.toNamed(AppRoute.productDetails,
          //     arguments: {"ProductModel": itemsModel});
          controller.goToPageProductDetails(itemsModel);
        },
        child: Card(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Hero(
                        tag: "${itemsModel.id}",
                        child: CachedNetworkImage(
                          imageUrl:
                              // Image.network(
                              itemsModel.thumbnail,
                          height: 100.h,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(itemsModel.title,
                          style: const TextStyle(
                              color: AppColor.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text("Rating : ${itemsModel.rating} ",
                                textAlign: TextAlign.center),
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            height: 22,
                            child: CustomStarItems(rating: itemsModel.rating),
                            // Row(
                            //   children: [
                            //     ...List.generate(
                            //         5,
                            //         (index) => const Icon(
                            //               Icons.star,
                            //               size: 15,
                            //             ))
                            //   ],
                            // ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${itemsModel.price} \$",
                              style: const TextStyle(
                                  color: AppColor.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "sans")),
                          GetBuilder<FavoriteController>(
                              builder: (favoriteController) => IconButton(
                                    onPressed: () {
                                      favoriteController
                                          .addFavorite(itemsModel);
                                      // Update the isFavorite property of itemsModel
                                    },
                                    icon: Icon(
                                      itemsModel.isFavorite == true
                                          ? Icons.favorite
                                          : Icons
                                              .favorite_border_outlined, // Use null-aware operator to handle potential null value
                                      color: AppColor.primaryColor,
                                    ),
                                  ))
                        ],
                      )
                    ]),
              ),
              // if (itemsModel.discountPercentage != "0")
              //   Positioned(
              //       top: 4,
              //       left: 4,
              //       child: Image.asset(
              //         AppImageAsset.saleOne,
              //         width: 40,
              //       ))
            ],
          ),
        ));
  }
}

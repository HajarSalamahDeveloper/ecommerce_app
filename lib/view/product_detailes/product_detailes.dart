import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/product_detail_controller/product_detail_controller.dart';
import '../../res/color/color_manager.dart';
import '../../res/components/product_details_widget/product_price_count.dart';
import '../../res/components/product_details_widget/top_product_details.dart';
import '../../res/routs/route_name.dart';

class ProductDetailesScreen extends StatelessWidget {
  const ProductDetailesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsController controller = Get.put(ProductDetailsController());
    return Scaffold(
        bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 50,
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: AppColor.secondColor,
                onPressed: () {
                  Get.toNamed(AppRoute.cart);
                },
                child: const Text(
                  "Add To Cart",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))),
        body: GetBuilder<ProductDetailsController>(
            builder: (controller) => ListView(children: [
                  TopProductPageDetails(
                    product: controller.product,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${controller.product.title}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    color: AppColor.fourthColor,
                                  )),
                          const SizedBox(height: 10),
                          PriceAndCountItems(
                              onAdd: () {
                                controller.add();
                              },
                              onRemove: () {
                                controller.remove();
                              },
                              price: "${controller.product.price}",
                              count: "${controller.countitems}"),
                          const SizedBox(height: 10),
                          Text("${controller.product.description}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: AppColor.grey2)),
                          const SizedBox(height: 10),
                        ]),
                  )
                ])));
  }
}

import 'package:ecommerce_app/controller/favorite_controller/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/color/color_manager.dart';
import '../../res/components/custom_titile.dart';
import '../../res/components/home/custom_card_list.dart';
import '../home_screen/home_screen_nav.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({Key? key}) : super(key: key);

  final favController = Get.put(FavoriteController());
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(children: [
          Row(
            children: [
              CustomTitle(
                title: 'Favorite Product',
              ),
              Spacer(
                flex: 1,
              ),
              IconButton(
                onPressed: () {
                  // Get.toNamed("home_page");
                  Get.to(HomeScreenBottomNav());
                },
                icon: Icon(Icons.add),
                color: AppColor.primaryColor,
              )
            ],
          ),
          Obx(() {
            return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: favController.favorites.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.7),
                itemBuilder: (BuildContext context, index) {
                  return CustomListItems(
                      itemsModel: favController.favorites[index]);
                });
          })
        ]));
  }
}

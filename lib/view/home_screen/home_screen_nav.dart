import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller/home_bottem_tab_controller.dart';
import '../../res/color/color_manager.dart';
import '../../res/components/home/custom_bottem_bar.dart';
import '../../res/routs/route_name.dart';

class HomeScreenBottomNav extends StatelessWidget {
  const HomeScreenBottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
    return GetBuilder<HomeScreenController>(
        builder: (controller) => Scaffold(
              floatingActionButton: FloatingActionButton(
                  backgroundColor: AppColor.primaryColor,
                  onPressed: () {
                    Get.toNamed(AppRoute.cart);
                  },
                  child: const Icon(Icons.shopping_basket_outlined)),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: const CustomBottomAppBarHome(),
              body: controller.listPage.elementAt(controller.currentpage),
            ));
  }
}

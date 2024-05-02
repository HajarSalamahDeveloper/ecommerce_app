import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller/home_controller.dart';
import '../../res/components/general_exception.dart';
import '../../res/components/home/custom_app_bar.dart';
import '../../res/components/home/custom_card_list.dart';
import '../../res/components/internet_exceptions_widget.dart';
import '../../res/enums/status.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    // Get.put(HomeController());
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(children: [
          CustomAppBar(
            titleappbar: 'Find Product',
            onPressedIconFavorite: () {},
            // mycontroller: controller.,
          ),
          Obx(() {
            switch (homeController.rxRequestStatus.value) {
              case Status.LOADING:
                return const Center(child: CircularProgressIndicator());
              case Status.ERROR:
                if (homeController.error.value == 'No internet') {
                  return InterNetExceptionWidget(
                    onPress: () {
                      homeController.refreshApi();
                    },
                  );
                } else {
                  return GeneralExceptionWidget(onPress: () {
                    homeController.refreshApi();
                    print("hh");
                  });
                }
              case Status.COMPLETED:
                return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: homeController.productListModel.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.7),
                    itemBuilder: (BuildContext context, index) {
                      return CustomListItems(
                          itemsModel: homeController.productListModel[index]);
                    });
            }
          })
        ]));
  }
}
// class HomeView extends StatelessWidget {
//   HomeView({Key? key}) : super(key: key);
//
//   final homeController = Get.put(HomeController());
//   final catgController = Get.put(CategoryController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           //   automaticallyImplyLeading: false,
//           ),
//       body: Obx(() {
//         switch (homeController.rxRequestStatus.value) {
//           case Status.LOADING:
//             return const Center(child: CircularProgressIndicator());
//           case Status.ERROR:
//             if (homeController.error.value == 'No internet') {
//               return InterNetExceptionWidget(
//                 onPress: () {
//                   homeController.refreshApi();
//                 },
//               );
//             } else {
//               return GeneralExceptionWidget(onPress: () {
//                 homeController.refreshApi();
//                 print("hh");
//               });
//             }
//           case Status.COMPLETED:
//             return GridView.builder(
//                           shrinkWrap: true,
//                           physics: const NeverScrollableScrollPhysics(),
//                           itemCount: controller.data.length,
//                           gridDelegate:
//                               const SliverGridDelegateWithFixedCrossAxisCount(
//                                   crossAxisCount: 2, childAspectRatio: 0.7),
//                           itemBuilder: (BuildContext context, index) {
//                             controllerFav.isFavorite[controller.data[index]
//                                     ['items_id']] =
//                                 controller.data[index]['favorite'];
//                             return CustomListItems(
//                                 itemsModel: ItemsModel.fromJson(
//                                     controller.data[index]));
//                           })
//
//
//
//             ListView.builder(
//                 itemCount: homeController.productListModel.length,
//                 itemBuilder: (context, index) {
//                   // print("lengh${homeController.productListModel.length}");
//                   // print("cat ${catgController.categoryList.length}");
//                   final product = homeController.productListModel[index];
//                   // homeController.productList[index].products[index];
//
//                   return Card(
//                     child: ListTile(
//                       title: Text(product.title),
//                       subtitle: Text(product.description),
//                     ),
//                   );
//                 });
//         }
//       }),
//     );
//   }
//

// }

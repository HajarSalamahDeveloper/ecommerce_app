import 'package:get/get.dart';

import '../../model/product_model.dart';

class ProductDetailsController extends GetxController {
  int countitems = 0;
  late final ProductModel product;
  add() {
    countitems++;
    update();
  }

  remove() {
    if (countitems > 0) {
      countitems--;
      update();
    }
  }

  intialData() async {
    product = Get.arguments['itemesmodel'];
    update();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}

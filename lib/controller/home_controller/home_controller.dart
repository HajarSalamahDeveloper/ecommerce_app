import 'package:ecommerce_app/model/product_model.dart';
import 'package:get/get.dart';

import '../../repository/home_repository.dart';
import '../../res/enums/status.dart';

class HomeController extends GetxController {
  final _api = HomeRepository();
  final rxRequestStatus = Status.LOADING.obs;
  // final productList = ProductModel().obs;
  RxList<ProductList> productList = <ProductList>[].obs;
  RxList<ProductModel> productListModel = <ProductModel>[].obs;

  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setProductsList(List<ProductList> _value) => productList.value = _value;
  void setProductsListModel(List<ProductModel> _value) =>
      productListModel.value = _value;

  void setError(String _value) => error.value = _value;

  void getProductsListApi() {
    setRxRequestStatus(Status.LOADING);
    _api.productsApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setProductsList([value]);
      setProductsListModel(value.products);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

  void refreshApi() {
    setRxRequestStatus(Status.LOADING);

    _api.productsApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setProductsList([value]);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

  goToPageProductDetails(ProductModel productModel) {
    Get.toNamed("product_detailes", arguments: {"itemesmodel": productModel});
  }

  @override
  void onInit() {
    getProductsListApi();
    super.onInit();
  }
}

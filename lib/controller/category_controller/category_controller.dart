import 'package:ecommerce_app/model/categories_Model.dart';
import 'package:get/get.dart';

import '../../repository/categories_repository.dart';
import '../../res/enums/status.dart';

class CategoryController extends GetxController {
  final _api = CategoryRepository();
  final rxRequestStatus = Status.LOADING.obs;
  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  RxList<CategoryProducts> categoryProductList = <CategoryProducts>[].obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setCategoryList(List<CategoryModel> _value) =>
      categoryList.value = _value;
  void setCategoryProductListModel(List<CategoryProducts> _value) =>
      categoryProductList.value = _value;

  void setError(String _value) => error.value = _value;

  void getCategoryProductsListApi(String catName) {
    setRxRequestStatus(Status.LOADING);
    _api.categoryProductsApi(catName).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setCategoryProductListModel([value]);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

  void getCategoryListApi() {
    setRxRequestStatus(Status.LOADING);
    _api.categoryApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setCategoryList([value]);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

  @override
  void onInit() {
    getCategoryListApi();
    // getCategoryProductsListApi();
    super.onInit();
  }
}

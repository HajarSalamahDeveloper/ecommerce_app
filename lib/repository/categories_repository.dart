import 'package:ecommerce_app/service/network/api_services.dart';

import '../model/categories_Model.dart';
import '../res/app_url/app_url.dart';

class CategoryRepository {
  final _apiService = ApiNetworkingServices();
  Future<CategoryModel> categoryApi() async {
    print("CAtRepository");
    dynamic response = await _apiService.getApi(AppUrl.allCategories);

    return CategoryModel.fromJson(response);
  }

  ///////////////////////
  Future<CategoryProducts> categoryProductsApi(String catName) async {
    // print("HomeRepository");
    dynamic response =
        await _apiService.getApi("${AppUrl.productsOfCategory}/$catName");

    return CategoryProducts.fromJson(response);
  }
}

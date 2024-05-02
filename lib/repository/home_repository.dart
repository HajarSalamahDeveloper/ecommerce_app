import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/service/network/api_services.dart';

import '../res/app_url/app_url.dart';

class HomeRepository {
  final _apiService = ApiNetworkingServices();
  Future<ProductList> productsApi() async {
    // print("HomeRepository");
    dynamic response = await _apiService.getApi(AppUrl.allProducts);
    return ProductList.fromJson(response);
  }
}

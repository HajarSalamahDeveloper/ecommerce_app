import 'package:ecommerce_app/model/favorite_model.dart';
import 'package:get/get.dart';

import '../../model/product_model.dart';
import '../../service/local_storage/app_data_base.dart';

class FavoriteController extends GetxController {
  RxList<ProductModel> favorites = <ProductModel>[].obs;
  List<ProductModel> convertedFavorites = <ProductModel>[];
  final AppDatabase _database = Get.find<AppDatabase>();
  FavoriteModel favoriteProduct = FavoriteModel();
  Future<void> addFavorite(ProductModel product) async {
    product.isFavorite = !product.isFavorite;
    if (product.isFavorite) {
      favorites.add(product);
      favoriteProduct = convertToFavoriteModel(product);
      await _database.favoriteDao.insertFavorite(favoriteProduct);
      print("Add${favorites.length}");
    } else {
      favorites.removeWhere((favProduct) => favProduct.id == product.id);
      favoriteProduct = convertToFavoriteModel(product);
      await _database.favoriteDao.deleteFavorite(favoriteProduct);
      print("delete${favorites.length}");
    }
    loadFavorites();
    update();
  }

  void loadFavorites() async {
    final List<FavoriteModel> favoriteList =
        await _database.favoriteDao.getAllProducts();
    convertedFavorites = favoriteList
        .map((favorite) => ProductModel(
              id: favorite.id,
              title: favorite.title,
              description: favorite.description,
              price: favorite.price,
              discountPercentage: favorite.discountPercentage,
              rating: favorite.rating,
              stock: favorite.stock,
              brand: favorite.brand,
              category: favorite.category,
              thumbnail: favorite.thumbnail,
              images: favorite.getImagesList(),
              isFavorite: favorite.isFavorite,
            ))
        .toList();
    favorites
        .assignAll(convertedFavorites.where((product) => product.isFavorite));
    // return favorites;
    print("DataBase${convertedFavorites.length}");
    print("fav${favorites.length}");
    update();
  }

  @override
  void onInit() {
    loadFavorites();
    // print("object");
    super.onInit();
  }

  FavoriteModel convertToFavoriteModel(ProductModel product) {
    return FavoriteModel(
        id: product.id,
        title: product.title,
        description: product.description,
        price: product.price,
        discountPercentage: product.discountPercentage,
        rating: product.rating,
        stock: product.stock,
        brand: product.brand,
        category: product.category,
        thumbnail: product.thumbnail,
        images: product.images.join(','),
        isFavorite: product
            .isFavorite // Convert List<String> to comma-separated string isFavorite: product.isFavorite,
        );
  }
}

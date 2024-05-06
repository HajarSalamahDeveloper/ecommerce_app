import 'package:ecommerce_app/model/favorite_model.dart';
import 'package:get/get.dart';

import '../../model/product_model.dart';
import '../../service/local_storage/app_data_base.dart';

class FavoriteController extends GetxController {
  RxList<ProductModel> favorites = <ProductModel>[].obs;
  late List<ProductModel> convertedFavorites = <ProductModel>[];
  final AppDatabase _database = Get.find<AppDatabase>(); // Inject AppDatabase
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

///////////////////   // GetStorage().write('favorites', favorites.map((fav) => fav.id).toList());
//     // final favoriteIds = GetStorage().read('favorites') ?? [];
//     //
//     // print("it done${favoriteIds[0][1]}");
//   }
//
//   // void updateYourProductList() {
//   //   productList = List.from(favorites);
//   // }
//
//   // void loadFavorites() {
//   //   final favoriteIds = GetStorage().read('favorites') ?? [];
//   //   favorites.assignAll(
//   //       productList.where((product) => favoriteIds.contains(product.id)));
//   //   print("${favoriteIds.length}");
//   // }

/////////////////
// GetBuilder<FavoriteController>(builder: (controller) {
//   return FutureBuilder<List<ProductModel>>(
//       future: controller.loadFavorites(),
//       builder: (context, snapshot) {
//         // if (snapshot.connectionState == ConnectionState.waiting) {
//         //   return CircularProgressIndicator(); // Show a loading indicator while data is being fetched
//         // } else if (snapshot.hasError) {
//         //   return Center(child: Text("An Error Accuore"));
//         // } else
//         if (snapshot.hasData) {
//           final data = snapshot.data!;
//           if (data.length == 0) {
//             return Container(
//               height: 40,
//               child: Center(
//                 child: Text(
//                   'No favorite product ',
//                 ),
//               ),
//             );
//           } else {
//             return GridView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: data.length,
//                 gridDelegate:
//                     const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2, childAspectRatio: 0.7),
//                 itemBuilder: (BuildContext context, index) {
//                   return CustomListItems(itemsModel: data[index]);
//                 });
//           }
//         } else {
//           return Center(
//             child: Text('لايوجد بيانات '),
//           );
//         }
//       });
// })

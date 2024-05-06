import 'package:get/get.dart';

import '../controller/favorite_controller/favorite_controller.dart';
import '../service/network/api_services.dart';

class InitialBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    // Start
    // Get.put(ApiNetworkingServices(Get.find()), permanent: true);
    Get.put(ApiNetworkingServices());
    // Get.lazyPut<FavoriteController>(() => FavoriteController());
    Get.put(FavoriteController());
    // final database =
    //     await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    //
    // // Register your database instance as a singleton with GetX
    // Get.put<AppDatabase>(database);
  }
}

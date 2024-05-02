import 'package:get/get.dart';

import '../service/network/api_services.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // Start
    // Get.put(ApiNetworkingServices(Get.find()), permanent: true);
    Get.put(ApiNetworkingServices());
  }
}

import 'package:ecommerce_app/res/routs/routes.dart';
import 'package:ecommerce_app/service/local_storage/app_data_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'core/binding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await GetStorage.init();
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  Get.put<AppDatabase>(database);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'ShopHappy',
            locale: const Locale('en', 'US'),
            fallbackLocale: const Locale('en', 'US'),
            initialBinding: InitialBindings(),
            getPages: AppRoutes.appRoutes(),
            // routes: {
            //   '/': (context) => const HomeView(), // HomeView is the initial route
            // },
          );
        });
  }
}

import 'package:ecommerce_app/res/routs/route_name.dart';
import 'package:ecommerce_app/view/favorite_screen/favorite_page.dart';
import 'package:ecommerce_app/view/home_screen/home_screen_nav.dart';
import 'package:get/get.dart';

import '../../view/cart/cart.dart';
import '../../view/product_detailes/product_detailes.dart';
import '../../view/splash_screen/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: '/',
          page: () => SplashScreen(),
          transitionDuration: Duration(milliseconds: 10),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: "/home_screen_nav",
          page: () => HomeScreenBottomNav(),
          transitionDuration: Duration(milliseconds: 10),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
            name: AppRoute.productDetails, page: () => ProductDetailesScreen()),
        GetPage(name: AppRoute.myFavorite, page: () => FavoritePage()),
        GetPage(name: AppRoute.cart, page: () => CartPage()),
      ];
}

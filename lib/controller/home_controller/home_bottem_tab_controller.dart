import 'package:ecommerce_app/view/favorite_screen/favorite_page.dart';
import 'package:ecommerce_app/view/home_screen/home_page.dart';
import 'package:ecommerce_app/view/setting/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../view/profile_screen/profile_page.dart';

class HomeScreenController extends GetxController {
  int currentpage = 0;

  List<Widget> listPage = [
    HomePage(),
    FavoritePage(),
    ProfilePage(),
    Setting()
  ];

  List bottomappbar = [
    {"title": "home", "icon": Icons.home},
    {"title": "favorite", "icon": Icons.favorite},
    {"title": "profile", "icon": Icons.person},
    {"title": "settings", "icon": Icons.settings}
  ];

  changePage(int i) {
    currentpage = i;
    update();
  }
}

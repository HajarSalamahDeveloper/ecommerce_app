import 'dart:async';

import 'package:ecommerce_app/res/routs/route_name.dart';
import 'package:ecommerce_app/res/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/app_constants/app_constanse.dart';
import '../../res/assests_manager/assets_manger.dart';
import '../../res/color/color_manager.dart';
import '../../res/style_manager/style_manger.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  _goNext() {
    print("object");
    // Navigator.pushReplacementNamed(context, AppRoute.homeScreenNav);
    Get.offAllNamed(AppRoute.homeScreenNav);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(50),
            child: Center(
              child: Image.asset(
                ImageAssets.splashLogo,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              StringManager.nameApp,
              style: getHeadLineStyle(color: AppColor.black),
            ),
          )
        ],
      ),
    );
  }
}

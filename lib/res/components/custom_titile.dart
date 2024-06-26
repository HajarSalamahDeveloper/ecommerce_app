import 'package:ecommerce_app/res/style_manager/style_manger.dart';
import 'package:flutter/cupertino.dart';

import '../color/color_manager.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  const CustomTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(title, style: getSemiBoldStyle(color: AppColor.primaryColor)),
    );
  }
}

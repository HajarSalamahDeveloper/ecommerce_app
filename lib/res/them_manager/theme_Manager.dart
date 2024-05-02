// ThemeData getApplicationTheme() {
//   return ThemeData(
//       // main colors
//       primaryColor: ColorManager.primary,
//       primaryColorLight: ColorManager.lightPrimary,
//       primaryColorDark: ColorManager.darkPrimary,
//       disabledColor: ColorManager.grey1,
//       scaffoldBackgroundColor: ColorManager.background,
//       // brightness: Brightness.light,
//       textSelectionTheme: TextSelectionThemeData(
//         cursorColor: ColorManager.lightPrimary,
//         //<-- SEE HERE
//       ),
//       //  brightness: ColorManager.blueGray,
//       // cardview theme
//       iconTheme: IconThemeData(
//         color: ColorManager.secondary,
//       ),
//       cardTheme: CardTheme(
//           color: ColorManager.white,
//           shadowColor: ColorManager.background,
//           elevation: AppSize.s8),
//       // app bar theme
//       navigationBarTheme: NavigationBarThemeData(
//           indicatorColor: ColorManager.secondary,
//           labelTextStyle: MaterialStateProperty.all(const TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w500,
//               //fontFamily: FontConstants.fontFamilyHeadline,
//               color: Color(0xff174D93)))),
//       appBarTheme: AppBarTheme(
//           centerTitle: true,
//           color: const Color(0xFCfaf0dd),
//           elevation: AppSize.s4,
//           systemOverlayStyle: SystemUiOverlayStyle(
//             statusBarColor: ColorManager.primary,
//             statusBarBrightness: Brightness.light,
//           ),
//           shadowColor: ColorManager.lightPrimary,
//           titleTextStyle: getHeadLineStyle(color: ColorManager.primary)),
//       // button theme
//       buttonTheme: ButtonThemeData(
//           shape: const StadiumBorder(),
//           disabledColor: ColorManager.grey1,
//           buttonColor: ColorManager.secondary,
//           splashColor: ColorManager.lightPrimary),
//
//       // text theme
//       elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ElevatedButton.styleFrom(
//               textStyle: getRegularStyle(
//                   color: ColorManager.white, fontSize: FontSize.s17),
//               backgroundColor: ColorManager.secondary,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(AppSize.s12)))),
//       ///////////////////////////////////////
//       textTheme: TextTheme(
//           displayLarge: getSemiBoldStyle(
//               color: ColorManager.black, fontSize: FontSize.s22),
//           headlineLarge: getSemiBoldStyle(
//               color: ColorManager.black, fontSize: FontSize.s22),
//           headlineMedium: getRegularStyle(
//               color: ColorManager.black, fontSize: FontSize.s20),
//           titleMedium:
//               getMediumStyle(color: ColorManager.black, fontSize: FontSize.s16),
//           titleSmall: getRegularStyle(
//               color: ColorManager.black, fontSize: FontSize.s22),
//           bodyLarge: getRegularStyle(color: ColorManager.black),
//           bodySmall: getRegularStyle(
//               color: ColorManager.black, fontSize: FontSize.s16),
//           bodyMedium: getRegularStyle(
//               color: ColorManager.black, fontSize: FontSize.s22),
//           labelSmall: getBoldStyle(
//               color: ColorManager.primary, fontSize: FontSize.s22)),
//
//       // input decoration theme (text form field)
//       inputDecorationTheme: InputDecorationTheme(
//         // content padding
//         contentPadding: const EdgeInsets.all(AppPadding.p8),
//         // hint style
//         hintStyle: getRegularStyle(
//           color: ColorManager.grey,
//           fontSize: FontSize.s12,
//         ),
//         labelStyle:
//             getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s14),
//         errorStyle: getContentStyle(color: ColorManager.error),
//         // input decoration theme (text form field)
//       ));
// }

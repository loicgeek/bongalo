import 'package:bongalo_recruitment/auth/screens/register_screen.dart';
import 'package:bongalo_recruitment/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bongalo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch:
            AppColors.createMaterialColor(AppColors.hexToColor("#3a85fc")),
        fontFamily: "Inter",
        appBarTheme: AppBarTheme(
          systemOverlayStyle: ThemeMode.system == ThemeMode.light
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark,
          elevation: 0,
          color: Colors.transparent,
          iconTheme: IconThemeData(
            color: AppColors.primaryText,
          ),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: AppColors.primary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: RegisterScreen(),
    );
  }
}

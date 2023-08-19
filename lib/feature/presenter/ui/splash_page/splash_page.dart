import 'dart:async';

import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import '../../../../consts/app_dimens.dart';
import '../../../../consts/app_strings.dart';
import '../../../../consts/app_colors.dart';
import '../../../../consts/app_drawables.dart';
import '../../../../consts/app_text_styles.dart';

import '../../../../feature/presenter/ui/home_page/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {


  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 9500), () {
      HomePage.navigate();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.nameOfTheApplication,
              style: AppTextStyle.lobsterFontStyle(
                fontSize: AppDimens.fontSizeGiantDimension,
                bold: true,
                color: AppColors.darkBlue,
              ),
            ),
            SizedBox(
              height: AppDimens.veryBigMarginDimension,
              width: 70,
              child: Lottie.asset(AppDrawables.animationLogo),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../consts/app_colors.dart';

class AppBarOfColorDarkBlueWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;

  const AppBarOfColorDarkBlueWidget({
    Key? key,
    required this.title,
    this.centerTitle = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      backgroundColor: AppColors.darkBlue,
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.lightGray,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
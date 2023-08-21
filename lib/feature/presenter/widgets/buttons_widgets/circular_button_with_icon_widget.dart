import 'package:flutter/material.dart';

import '../../../../consts/app_colors.dart';
import '../../../../consts/app_dimens.dart';

class CircularButtonWithIconWidget extends StatelessWidget {
  final void Function()? onPressed;
  final IconData? icon;

  const CircularButtonWithIconWidget({super.key, this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(AppDimens.defaultMarginDimension),
        ),
        child: Transform.scale(
          scale: 1.2,
          child: Icon(
            icon,
            color: AppColors.pureBlackColor,
            size: AppDimens.bigMarginDimension,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../consts/app_colors.dart';
import '../../../../consts/app_dimens.dart';

class ContainerWithRoundedEdgesWidget extends StatelessWidget {
  final Widget child;
  final Color color;

  const ContainerWithRoundedEdgesWidget({
    super.key,
    required this.child,
    this.color = AppColors.orangeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius:
              BorderRadius.circular(AppDimens.littleBigMarginDimension),
        ),
        child: child,
      ),
    );
  }
}

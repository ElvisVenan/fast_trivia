import 'package:flutter/material.dart';

import '../../../../consts/app_colors.dart';
import '../../../../consts/app_dimens.dart';

class TitleAndSubtitleWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const TitleAndSubtitleWidget({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.smallMarginDimension),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
              style: const TextStyle(
                  color: AppColors.pureBlackColor,
                  fontSize: AppDimens.fontSizeHugeDimension,
                  fontWeight: FontWeight.bold),
            ),
          const SizedBox(
            height: AppDimens.littleBigMarginDimension,
          ),
          Center(
            child: Text(
              textAlign: TextAlign.center,
              subtitle,
              style: const TextStyle(
                color: AppColors.pureBlackColor,
                fontSize: AppDimens.fontSizeBigDimension,
              ),
            ),
          ),
          const SizedBox(
            height: AppDimens.defaultMarginDimension,
          ),
        ],
      ),
    );
  }
}

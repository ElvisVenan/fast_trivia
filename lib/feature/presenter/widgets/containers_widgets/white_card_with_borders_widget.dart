import 'package:flutter/material.dart';

import '../../../../consts/app_dimens.dart';

class WhiteCardWithBordersWidget extends StatelessWidget {
  final Color? color;
  final String text;

  const WhiteCardWithBordersWidget({
    super.key,
    this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      margin: const EdgeInsets.all(10),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: AppDimens.fontSizeBigDimension,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

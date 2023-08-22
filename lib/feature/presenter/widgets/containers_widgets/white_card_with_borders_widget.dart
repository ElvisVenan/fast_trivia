import 'package:flutter/material.dart';

import '../../../../consts/app_dimens.dart';

class WhiteCardWithBordersWidget extends StatelessWidget {
  final Color? color;
  final String text;
  final double margin;

  const WhiteCardWithBordersWidget({
    super.key,
    this.color,
    required this.text,
    this.margin = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      margin: EdgeInsets.all(margin),
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

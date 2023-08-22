import 'package:flutter/material.dart';

import '../../../../consts/app_dimens.dart';

class CardWithIconWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const CardWithIconWidget({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Card(
        elevation: AppDimens.tinyMarginDimension,
        child: ListTile(
          leading: const Icon(
            Icons.check_circle,
            color: Colors.green,
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: AppDimens.fontSizeMediumDimension,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
    ;
  }
}

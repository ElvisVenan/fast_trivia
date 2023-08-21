import 'package:flutter/material.dart';

class RoundedEdgeButtonWidget extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const RoundedEdgeButtonWidget({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  final String buttonName;
  final iconType;
  VoidCallback onPressed;
  MyButton({
    super.key,
    required this.buttonName,
    required this.iconType,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
        ),
        child: Row(
          children: [
            Text(buttonName),
            const SizedBox(
              width: 10,
            ),
            Icon(iconType),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:therapy/core/widgets/app_button.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    super.key,
    required this.error,
    required this.onPressed,
  });

  final String error;
  final dynamic Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          error,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 20),
        AppButton(
          label: "Try Again",
          onPressed: onPressed,
        )
      ],
    );
  }
}

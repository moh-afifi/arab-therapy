import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class AppLoader extends StatelessWidget {
  final double? width;
  final double? height;

  const AppLoader({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.green4e7e76,
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/utils/app_navigator.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../items/presentation/screens/items_screen.dart';

class StartNowButton extends StatelessWidget {
  const StartNowButton({super.key, this.padding});

  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 10),
      label: "ابدأ للآن",
      shrink: true,
      onPressed: () => AppNavigator.push(
          context: context,
          widget: const ItemsScreen(),
          route: "/items_screen"),
    );
  }
}

import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class GlobalAppBar extends AppBar {
  GlobalAppBar(
    BuildContext context, {
    Key? key,
    required String title,
    Widget? child,
    bool centerTitle = true,
    Color? backgroundColor,
    Color? titleColor,
    bool enableBack = false,
    double elevation = 0.5,
    List<Widget>? actions,
    double? height,
    Widget? backIcon,
    Function()? onBack,
  }) : super(
          key: key,
          centerTitle: centerTitle,
          elevation: elevation,
          toolbarHeight: height ?? 50.0,
          automaticallyImplyLeading: false,
          backgroundColor: backgroundColor ?? AppColors.bluee8edf5,
          title: child ??
              FittedBox(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: titleColor ?? Colors.black,
                  ),
                ),
              ),
          leading: !enableBack
              ? null
              : IconButton(
                  onPressed: () {
                    if (onBack != null) {
                      onBack();
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  icon: backIcon ??
                      Icon(
                        Icons.adaptive.arrow_back_rounded,
                        color: titleColor ?? Colors.black,
                      ),
                ),
          actions: actions,
        );
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:therapy/core/utils/app_navigator.dart';
import 'package:therapy/features/home/presentation/widgets/start_now_button.dart';
import 'package:therapy/features/items/presentation/screens/items_screen.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/app_button.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          left: 15,
          right: 15,
          bottom: 20),
      color: AppColors.greenf1ffff,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset('assets/svg/logo.svg'),
              const StartNowButton(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Image.asset(
              'assets/images/mind.png',
              height: 100,
            ),
          ),
          const Text(
            'هل تشعر بالوحدة؟ نحن معك',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'تحدث مع طبيب أو أخصائي نفسي عبر\nالانترنت،بكفاءة ومعايير ألمانية',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
          const StartNowButton(
            padding: EdgeInsets.symmetric(horizontal: 50),
          ),
        ],
      ),
    );
  }
}

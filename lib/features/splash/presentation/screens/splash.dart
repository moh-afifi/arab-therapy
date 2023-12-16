import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_navigator.dart';
import '../../../../core/widgets/global_scaffold.dart';
import '../../../home/presentation/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _navigate() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        AppNavigator.pushReplacement(
          context: context,
          widget: const HomeScreen(),
          route: '/home_screen',
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _navigate();
  }

  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: Center(
        child: SvgPicture.asset('assets/svg/logo.svg'),
      ),
    );
  }
}

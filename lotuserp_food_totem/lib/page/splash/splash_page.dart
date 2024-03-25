import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus_food_totem/page/init/init_page.dart';

import '../../core/app_colors.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var _scale = 5.0;
  var _animationOpacityLogo = 0.0;

  double get _logoAnimationWidth => 800 / _scale;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _animationOpacityLogo = 1.0;
        _scale = 2;
      });
    });
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(() => const InitPage());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backSlider,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          color: CustomColors.backSlider,
        ),
        child: Center(
          child: AnimatedOpacity(
            duration: const Duration(seconds: 3),
            curve: Curves.ease,
            opacity: _animationOpacityLogo,
            child: AnimatedContainer(
              width: _logoAnimationWidth,
              duration: const Duration(seconds: 3),
              curve: Curves.linearToEaseOut,
              color: CustomColors.backSlider,
              child: SizedBox(
                height: 500,
                child: Image.asset(
                  'assets/images/Logo Nova Branco Vertical.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

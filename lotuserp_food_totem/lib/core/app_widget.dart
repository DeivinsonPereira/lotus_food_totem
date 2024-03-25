import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lotus_food_totem/core/app_colors.dart';
import 'package:lotus_food_totem/page/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TOTEM FOOD',
      navigatorObservers: [ImmersiveModeObserver()],
      theme: ThemeData(
        scaffoldBackgroundColor: CustomColors.pageOptionalColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const SplashPage(),
    );
  }
}

class ImmersiveModeObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    setImmersiveMode();
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    setImmersiveMode();
  }

  void setImmersiveMode() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

import '../../../routes/main_navigation.dart';

Widget splashLogo(AnimationController? controller, context) {
  return Container(
    alignment: Alignment.center,
    height: MediaQuery.of(context).size.height * 0.6,
    child: Lottie.asset(
      'assets/json/splash_page.json',
      controller: controller,
      animate: true,
      onLoaded: (composition) {
        controller!
          ..duration = composition.duration
          ..forward().whenComplete(
            () => Navigator.popAndPushNamed(
                context, MainNavigationRouteNames.mainScreen),
          );
      },
    ),
  );
}

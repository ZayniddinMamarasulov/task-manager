import 'package:flutter/cupertino.dart';
import 'package:task_manager/src/presentation/screens/main_screen/main_screen.dart';
import 'package:task_manager/src/presentation/screens/splash_screen/splash_screen.dart';

abstract class MainNavigationRouteNames {
  static const mainScreen = "/main";
  static const splashScreen = '/splash';
  static const homeScreen = '/home';
  static const notificationScreen = '/notification';
  static const searchScreen = "/search";
  static const profileScreen = "/profile";
  static const settingsScreen = "/settings";
  static const createTaskScreen = "/createTask";
  static const taskCalenderScreen = "/taskCalender";
}

class MainNavigationRoute {
  MainNavigationRoute._();
  static final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.splashScreen: (context) => const SplashScreen(),
    MainNavigationRouteNames.mainScreen: (context) => const MainScreen(),
  };
}

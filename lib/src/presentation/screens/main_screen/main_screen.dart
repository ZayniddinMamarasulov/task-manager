import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/src/presentation/cubit/navigation_cubit.dart';
import 'package:task_manager/src/presentation/cubit/navigation_state.dart';
import 'package:task_manager/src/presentation/screens/home_screen/home_screen.dart';
import 'package:task_manager/src/presentation/screens/main_screen/widgets/bottom_navigation.dart';
import 'package:task_manager/src/presentation/screens/notification_screen/notification_screen.dart';
import 'package:task_manager/src/presentation/screens/search_screen/search_screen.dart';
import 'package:task_manager/src/presentation/screens/task_calender_screen/task_calender_screen.dart';

import '../../cubit/nav_bar_items.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          if (state.navbarItem == NavbarItem.home) {
            return HomeScree();
          } else if (state.navbarItem == NavbarItem.taskCalender) {
            return TaskCalenderScreen();
          } else if (state.navbarItem == NavbarItem.notification) {
            return NotificationScreen();
          } else if (state.navbarItem == NavbarItem.search) {
            return SearchScreen();
          }
          return Container();
        },
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/nav_bar_items.dart';
import '../../../cubit/navigation_cubit.dart';
import '../../../cubit/navigation_state.dart';
import 'bottom_bar_item.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return BottomNavigationBar(
          elevation: 0,
          currentIndex: state.index!,
          items: [
            bottomBarIcon(context, 'assets/icons/ic_home-fill.svg', "Home"),
            bottomBarIcon(context, 'assets/icons/ic_calendar.svg', "Calendar"),
            bottomBarIcon(
                context, 'assets/icons/ic_notification.svg', "Notification"),
            bottomBarIcon(context, 'assets/icons/ic_search.svg', "Search"),
          ],
          onTap: (index) {
            switch (index) {
              case 0:
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.home);
                break;
              case 1:
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.taskCalender);
                break;
              case 2:
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.notification);
                break;
              case 3:
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.search);
                break;
            }
          },
        );
      },
    );
  }
}

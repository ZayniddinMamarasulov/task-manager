import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/src/presentation/cubit/navigation_state.dart';

import 'nav_bar_items.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState(NavbarItem.home, 0));

  void getNavBarItem(NavbarItem item) {
    switch (item) {
      case NavbarItem.home:
        emit(NavigationState(item, 0));
        break;
      case NavbarItem.taskCalender:
        emit(NavigationState(item, 1));
        break;
      case NavbarItem.notification:
        emit(NavigationState(item, 2));
        break;
      case NavbarItem.search:
        emit(NavigationState(item, 3));
        break;
    }
  }
}

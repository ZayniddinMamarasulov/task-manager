import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/ui/add_task_page/create_task_page.dart';
import 'package:task_manager/ui/home_page/home_page.dart';
import 'package:task_manager/ui/notification_page/notification_page.dart';
import 'package:task_manager/ui/second_page/my_task_calendar_page.dart';
import 'package:task_manager/ui/theme/app_colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  List<Widget> widgets = [
    const MyHomePage(),
    const TaskCalendarPage(),
    const NotificationPage(),
    const CreateTaskPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackgroundColor,
      body: widgets[_currentIndex],
      bottomNavigationBar: customBottomNavigationBar(),
    );
  }

  Widget customBottomNavigationBar() {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: AppColors.lightBackgroundColor,
      currentIndex: _currentIndex,
      selectedItemColor: AppColors.lightbottomGradient,
      unselectedItemColor: const Color(0xffC4C4C4),
      onTap: (selectedIndex) {
        setState(() {
          _currentIndex = selectedIndex;
        });
      },
      elevation: 0,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/ic_home.svg',
            height: 28,
            color: _currentIndex == 0
                ? AppColors.lightbottomGradient
                : Color(0xffC4C4C4),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/ic_calendar.svg',
            height: 28,
            color: _currentIndex == 1
                ? AppColors.lightbottomGradient
                : Color(0xffC4C4C4),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/ic_notification.svg',
            height: 28,
            color: _currentIndex == 2
                ? AppColors.lightbottomGradient
                : const Color(0xffC4C4C4),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/ic_search-white.svg',
            height: 28,
            color: _currentIndex == 3
                ? AppColors.lightbottomGradient
                : const Color(0xffC4C4C4),
          ),
          label: '',
        ),
      ],
    );
  }
}

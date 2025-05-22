import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fullcycle/core/resources/colors.dart';
import 'package:fullcycle/features/chats/presentation/screens/chats_screen.dart';
import 'package:fullcycle/features/main/presentation/screens/main_screen.dart';
import 'package:fullcycle/features/mytasks/screens/mytasks_screen.dart';
import 'package:fullcycle/features/profile/presentation/screens/profile_screen.dart';

import '../../../../services/notifications/firebase_notification.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    if (!mounted) return;

    await FirebaseCustomNotification.setUpFirebase();
  }

  changeIndex(index) {
    currentIndex = index;
    setState(() {});
  }

  final pages = [
    const MainScreen(),
    const ChatsScreen(),
      MyTasksScreen(),
    const ProfileScreen(),
  ];
  final titles = [
    'الرئيسية',
    'المحادثات',
    'مهماتي',
    'حسابي',
  ];
  final icons = [
    'assets/icons/home.svg',
    'assets/icons/chats.svg',
    'assets/icons/task.svg',
    'assets/icons/profile.svg',
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: pages[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              backgroundColor: AppColors.grey,
              currentIndex: currentIndex,
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
              onTap: changeIndex,
              fixedColor: AppColors.primaryColor,
              elevation: 0,
              items: List.generate(4, (index) {
                return BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    icons[index],
                    color: currentIndex == index
                        ? AppColors.primaryColor
                        : Colors.black, // or AppColors.unselectedIconColor
                  ),
                  label: titles[index],
                );
              }))),
    );
  }
}

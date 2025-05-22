import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fullcycle/features/bank_information/presentation/screens/bank_information_screen.dart';
import 'package:fullcycle/features/experience/presentation/screens/experience_screen.dart';
import 'package:fullcycle/features/profile/presentation/widgets/profile_header.dart';
import 'package:fullcycle/features/user_documents/presentation/screens/edit_personal_documents_screen.dart';
import 'package:fullcycle/services/navigation/navigation.dart';
import 'package:fullcycle/shared/widgets/custom_divider.dart';

import '../../../../core/resources/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 144), child: ProfileHeader()),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 16, bottom: 12),
              child: Text(
                'تفاصيل الملف الشخصي',
                style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(

                children: [
                  buildItem('المعلومات البنكية', 'bank', () {
                    AppNavigation.navigate(const BankInformationScreen());
                  }),
                  const CustomDivider(),
                  buildItem('مستنداتي  الشخصية', 'folder', () {
                    AppNavigation.navigate(const EditPersonalDocumentsScreen());

                  }),
                  const CustomDivider(),

                  buildItem('الخبرات والمشاراكات', 'exp', () {
                    AppNavigation.navigate(const ExperienceScreen());

                  }),
                  const CustomDivider(),
                  buildItem('مواقعي المحفوظة', 'location', () {}),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16, bottom: 12),
              child: Text(
                'الإعدادات والأمان',
                style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  buildItem('الامان', 'security', () {}),
                  const CustomDivider(),
                  buildItem('الاعدادت', 'settings', () {}),
                  const CustomDivider(),
                  buildItem('الاشعارات', 'notif', () {}),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16, bottom: 12),
              child: Text(
                'الدعم والمعلومات',
                style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  buildItem('المساعدة', 'help', () {}),
                  const CustomDivider(),
                  buildItem('سياسة الخصوصية', 'privacy', () {}),
                  const CustomDivider(),
                  buildItem('تعرف عنا', 'info', () {}),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 50),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: buildItem('تسجيل الخروج', 'logout', () {}),
            ),
          ],
        ),
      ),
    );
  }

  buildItem(String title, String icon, Function function) {
    return GestureDetector(
      onTap: (){
        function();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            SvgPicture.asset('assets/icons/$icon.svg'),
            const SizedBox(width: 10),
            Text(title),
            const Spacer(),
            SvgPicture.asset('assets/icons/arrow.svg'),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fullcycle/core/resources/colors.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الامان'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('البريد الالكتروني'),
              subtitle: const Text('mohamed@gmail.com'),
              // subtitle: Text('${CacheHelper.getCandidate.email}'),
              trailing: TextButton(
                onPressed: () {},
                child: const Text(
                  "تعديل",
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryColor),
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('كلمة المرور'),
              subtitle: const Text('***************'),
              // subtitle: Text('${CacheHelper.getCandidate.email}'),
              trailing: TextButton(
                onPressed: () {},
                child: const Text(
                  "تعديل",
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

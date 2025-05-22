import 'package:flutter/material.dart';
import 'package:fullcycle/features/experience/presentation/screens/add_experience_screen.dart';
import 'package:fullcycle/services/navigation/navigation.dart';

import '../../../../core/resources/colors.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({super.key});

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('الخبرات والمشاراكات (5) '),
          centerTitle: true,
          actions: [

            IconButton(onPressed: (){
              AppNavigation.navigate(  AddExperienceScreen());
            }, icon: const Icon(Icons.add,size: 30,))
          ],
        ),
        body: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.greyText)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('أخصائي نظم معلومات',style: TextStyle(
                          fontWeight: FontWeight.w600
                        ),),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.more_horiz))
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8, bottom: 12),
                      child: Text('شركة النخبة للتقنية . 3 سنين'),
                    ),
                    const Text(
                        'شركة سعودية رائدة في تطوير الحلول الرقمية وخدمات التحول الرقمي للقطاعين الحكومي والخاص، مقرها الرياض وتخدم عملاء في مختلف أنحاء المملكة.')
                  ],
                ),
              );
            }),
      ),
    );
  }
}

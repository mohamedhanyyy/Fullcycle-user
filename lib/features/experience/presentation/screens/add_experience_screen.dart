import 'package:flutter/material.dart';
import 'package:fullcycle/shared/widgets/custom_button.dart';
import 'package:fullcycle/shared/widgets/custom_text_field.dart';

class AddExperienceScreen extends StatelessWidget {
  AddExperienceScreen({super.key});

  final companyNameController = TextEditingController();
  final jobNameController = TextEditingController();
  final numOfYearsController = TextEditingController();
  final descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('إضافة خبرة جديدة'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              const Text('اسم الشركة'),
              const SizedBox(height: 8),
              CustomTextField(controller: companyNameController),
              const SizedBox(height: 16),
              const Text('المسمي الوظيفي'),
              const SizedBox(height: 8),
              CustomTextField(controller: jobNameController),
              const SizedBox(height: 16),
              const Text('عدد السنين'),
              const SizedBox(height: 8),
              CustomTextField(
                controller: numOfYearsController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              const Text('الوصف'),
              const SizedBox(height: 8),
              CustomTextField(controller: descriptionController, maxLines: 4),
              const SizedBox(height: 16),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: CustomElevatedButton(
            onTap: () {},
            buttonText: 'حفظ الخبرة',
          ),
        ),
      ),
    );
  }
}

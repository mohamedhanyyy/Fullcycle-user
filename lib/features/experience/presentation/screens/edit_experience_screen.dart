import 'package:flutter/material.dart';
import 'package:fullcycle/features/candidate/data/repository/candidate_repository.dart';
import 'package:fullcycle/shared/widgets/custom_button.dart';

import '../../../candidate/data/models/experiences_model.dart';

class EditExperienceScreen extends StatefulWidget {
  final ExperienceItem item;

  const EditExperienceScreen({super.key, required this.item});

  @override
  State<EditExperienceScreen> createState() => _EditExperienceScreenState();
}

class _EditExperienceScreenState extends State<EditExperienceScreen> {
  final _formKey = GlobalKey<FormState>();

  late final _positionController =
      TextEditingController(text: widget.item.position);
  late final _companyController =
      TextEditingController(text: widget.item.companyName ?? "");
  late final projectNameController =
  TextEditingController(text:   "");
  late final _descriptionController =
      TextEditingController(text: widget.item.description ?? "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("تعديل الخبرة"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _positionController,
                decoration: const InputDecoration(
                  labelText: "المسمى الوظيفي",
                  border: OutlineInputBorder(),
                ),
                validator: (val) =>
                    val == null || val.isEmpty ? "ادخل المسمى" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _companyController,
                decoration: const InputDecoration(
                  labelText: "اسم الشركة",
                  border: OutlineInputBorder(),
                ),
                validator: (val) =>
                    val == null || val.isEmpty ? "ادخل اسم الشركة" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: "الوصف",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              CustomElevatedButton(
                onTap: () async {
                  await CandidateRepository.updateExperience(widget.item);
                },
                buttonText: 'حفظ التعديلات',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

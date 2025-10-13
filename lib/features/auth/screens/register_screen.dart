import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fullcycle/core/cubit/base_cubit_state.dart';
import 'package:fullcycle/shared/widgets/custom_button.dart';
import 'package:fullcycle/shared/widgets/custom_loading_widget.dart';
import 'package:fullcycle/shared/widgets/custom_text_field.dart';
import 'package:intl/intl.dart';

import '../cubit/register_cubit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final idController = TextEditingController();
  final cityController = TextEditingController();
  final dobController = TextEditingController();
  final nationalityController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final sizeController = TextEditingController();
  final phoneController = TextEditingController();

  String? gender;
  int _currentStep = 0;

  @override
  void initState() {
    super.initState();

    if (kDebugMode) {
      firstNameController.text = "محمد ";
      lastNameController.text = "Ali";
      idController.text = "1017106344";
      cityController.text = "Cairo";
      dobController.text = "2024-08-07";
      gender = "ذكر";
      nationalityController.text = "مصري";
      heightController.text = "180";
      weightController.text = "75";
      sizeController.text = "L";
      phoneController.text = "0555040513";
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    idController.dispose();
    cityController.dispose();
    dobController.dispose();
    nationalityController.dispose();
    heightController.dispose();
    weightController.dispose();
    sizeController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void _submitForm(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<RegisterCubit>().
      register(
        arabicName: firstNameController.text.trim(),
        englishName: lastNameController.text.trim(),
        idNumber: idController.text.trim(),
        cityId: 1,
        email: "D2eux6cUAaC3o@SlOBwwBEUaMjoofUCyxq.rta",
        dob: dobController.text.trim(),
        gender: gender ?? "",
        nationality: nationalityController.text.trim(),
        height: heightController.text.trim(),
        weight: weightController.text.trim(),
        tshirtSize: sizeController.text.trim(),
        phoneNumber: phoneController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("تسجيل حساب جديد")),
      body: Form(
        key: _formKey,
        child: Stepper(
          type: StepperType.horizontal,
          currentStep: _currentStep,
          onStepContinue: () {
            if (_currentStep < 2) {
              if (_formKey.currentState?.validate() ?? false) {
                setState(() => _currentStep += 1);
              }
            } else {
              _submitForm(context);
            }
          },
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() => _currentStep -= 1);
            }
          },
          steps: [
            Step(
              title: const Text("الهوية"),
              isActive: _currentStep >= 0,
              content: _buildIdentityStep(),

            ),
            Step(
              title: const Text("الشخصية"),
              isActive: _currentStep >= 1,
              content: _buildPersonalStep(),
            ),
            Step(
              title: const Text("التواصل"),
              isActive: _currentStep >= 2,
              content: _buildContactStep(context),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- Steps ----------------

  Widget _buildIdentityStep() {
    return Column(
      children: [
        buildTextField("الاسم الأول", firstNameController),
        buildTextField("اسم العائلة", lastNameController),
        buildTextField("رقم الهوية", idController, keyboardType: TextInputType.number),
        buildDropdown(
          "المدينة",
          cityController.text.isEmpty ? null : cityController.text,
          ["Cairo", "Riyadh", "Dubai"],
              (val) => setState(() => cityController.text = val!),
        ),
      ],
    );
  }

  Widget _buildPersonalStep() {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            FocusScope.of(context).unfocus();
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now().subtract(const Duration(days: 365 * 20)),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (picked != null) {
              dobController.text = DateFormat("dd/MM/yyyy").format(picked);
            }
          },
          child: AbsorbPointer(
            child: buildTextField("تاريخ الميلاد", dobController),
          ),
        ),
        buildDropdown("الجنس", gender, ["ذكر", "انثى"], (val) => setState(() => gender = val!)),
        buildDropdown(
          "الجنسية",
          nationalityController.text.isEmpty ? null : nationalityController.text,
          ["مصري", "سعودي", "أردني"],
              (val) => setState(() => nationalityController.text = val!),
        ),
        buildTextField("الطول (سم)", heightController, keyboardType: TextInputType.number),
        buildTextField("الوزن (كجم)", weightController, keyboardType: TextInputType.number),
        buildTextField("مقاس التيشرت", sizeController),
      ],
    );
  }

  Widget _buildContactStep(BuildContext context) {
    return Column(
      children: [
        buildTextField("رقم الهاتف", phoneController, keyboardType: TextInputType.phone),
        BlocBuilder<RegisterCubit, CubitState>(
          builder: (context, state) {
            if (state == CubitState.loading) {
              return const CustomLoadingButtonWidget();
            }
            return CustomElevatedButton(
              onTap: () => _submitForm(context),
              buttonText: 'تسجيل',
            );
          },
        ),
      ],
    );
  }

  // ---------------- Widgets ----------------

  Widget buildTextField(
      String label,
      TextEditingController controller, {
        TextInputType keyboardType = TextInputType.text,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: CustomTextField(
        controller: controller,
        hintText: label,
        keyboardType: keyboardType,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return "الرجاء إدخال $label";
          }
          return null;
        },
      ),
    );
  }

  Widget buildDropdown(String label, String? value, List<String> items, Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DropdownButtonFormField<String?>(
        value: value,
        isExpanded: true,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onChanged: onChanged,
        validator: (val) => val == null || val.isEmpty ? "الرجاء اختيار $label" : null,
        items: items
            .map((e) => DropdownMenuItem(
          value: e,
          child: Align(alignment: Alignment.centerRight, child: Text(e)),
        ))
            .toList(),
      ),
    );
  }
}

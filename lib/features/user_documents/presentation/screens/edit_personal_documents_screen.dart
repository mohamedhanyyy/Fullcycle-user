

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fullcycle/shared/widgets/custom_loading_widget.dart';
import '../../../../core/cubit/base_cubit_state.dart';
import '../../../../services/navigation/navigation.dart';
import '../../edit_personal_document_cubit.dart';
import '../widgets/document_uploader.dart';

class EditPersonalDocumentsScreen extends StatelessWidget {
  const EditPersonalDocumentsScreen({super.key});

  Future<void> _pickAndUpload(String docKey) async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null &&
        result.files.single.path != null &&
        AppNavigation.context.mounted) {
      final filePath = result.files.single.path!;
      AppNavigation.context
          .read<PersonalDocumentsCubit>()
          .uploadDocument(docKey, filePath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonalDocumentsCubit, CubitState>(
      builder: (context, state) {
        final cubit = context.read<PersonalDocumentsCubit>();

        return Scaffold(
          appBar: AppBar(
            title: const Text('تعديل مستنداتي الشخصية'),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              const SizedBox(height: 24),
              DocumentUploader(
                title: 'رفع السيرة الذاتية',
                fileName: cubit.documents["cv"] ?? "لم يتم رفع الملف بعد",
                onUpload: () => _pickAndUpload("cv"),
                onRemove: () => cubit.removeDocument("cv"),
              ),
              const SizedBox(height: 24),
              DocumentUploader(
                title: 'رفع شهادة خلو السوابق',
                fileName:
                    cubit.documents["criminalRecord"] ?? "لم يتم رفع الملف بعد",
                onUpload: () => _pickAndUpload("criminalRecord"),
                onRemove: () => cubit.removeDocument("criminalRecord"),
              ),
              const SizedBox(height: 24),
              DocumentUploader(
                title: 'رفع ملف التفويض',
                fileName:
                    cubit.documents["delegation"] ?? "لم يتم رفع الملف بعد",
                onUpload: () => _pickAndUpload("delegation"),
                onRemove: () => cubit.removeDocument("delegation"),
              ),
              if (state == CubitState.loading)
                const CustomLoadingWidget(),
            ],
          ),
        );
      },
    );
  }
}

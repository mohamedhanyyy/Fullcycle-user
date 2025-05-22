import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fullcycle/shared/widgets/custom_button.dart';
import '../../../../core/resources/colors.dart';

class EditPersonalDocumentsScreen extends StatefulWidget {
  const EditPersonalDocumentsScreen({super.key});

  @override
  State<EditPersonalDocumentsScreen> createState() =>
      _EditPersonalDocumentsScreenState();
}

class _EditPersonalDocumentsScreenState
    extends State<EditPersonalDocumentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تعديل مستنداتي الشخصية'),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            const SizedBox(height: 24),
            DocumentUploader(
              title: 'رفع السيرة الذاتية',
              fileName: 'السيرة الذاتية .PDF',
              onUpload: () {},
            ),
            const SizedBox(height: 24),
            DocumentUploader(
              title: 'رفع شهادة خلو السوابق',
              fileName: 'شهادة خلو السوابق .PDF',
              onUpload: () {},
            ),
            const SizedBox(height: 24),
            DocumentUploader(
              title: 'رفع ملف التفويض',
              fileName: 'ملف التفويض .PDF',
              onUpload: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class DocumentUploader extends StatelessWidget {
  final String title;
  final String fileName;
  final Function onUpload;

  const DocumentUploader({
    super.key,
    required this.title,
    required this.fileName,
    required this.onUpload,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, color: AppColors.textColor),
        ),
        const SizedBox(height: 8),
        const Text(
          'Maximum file size allowed is 2MB, supported file formats include .jpg, .png, and .pdf.',
          style: TextStyle(fontSize: 12, color: AppColors.textColor),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  border: Border.all(color: AppColors.greyText),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/check.svg'),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        fileName,
                        style: const TextStyle(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        // TODO: Handle file removal
                      },
                      icon: const Icon(Icons.clear),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            CustomElevatedButton(
              padding: 10,
              width: 90,
              height: 36,
              color: Colors.black,
              onTap: () {
                onUpload();
              },
              buttonText: "رفع الملف",
            ),
          ],
        ),
      ],
    );
  }
}

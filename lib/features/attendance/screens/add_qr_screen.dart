import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fullcycle/shared/widgets/custom_button.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:fullcycle/shared/widgets/custom_text_field.dart';

import '../../candidate/cubit/attend_candidate_cubit.dart';

class AddQrScreen extends StatefulWidget {
  const AddQrScreen({super.key});

  @override
  State<AddQrScreen> createState() => _AddQrScreenState();
}

class _AddQrScreenState extends State<AddQrScreen> {
  final controller = TextEditingController();

  Future<void> _showQrScannerDialog() async {
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => const QrScannerDialog(),
    );

    if (result != null && mounted) {
      controller.text = result;
      context.read<AttendCandidateCubit>().attendCandidate(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الفعاليات')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child: Text("كود الفعالية"),
            ),
            CustomTextField(
              controller: controller,
              keyboardType:  TextInputType.number,
              onSubmitted: (val) => context.read<AttendCandidateCubit>().attendCandidate(val),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset('assets/icons/scan.svg'),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: CustomElevatedButton(
                onTap: _showQrScannerDialog,
                buttonText: ('مسح QR'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QrScannerDialog extends StatefulWidget {
  const QrScannerDialog({super.key});

  @override
  State<QrScannerDialog> createState() => _QrScannerDialogState();
}

class _QrScannerDialogState extends State<QrScannerDialog> {
  final controller = MobileScannerController();
  bool _isScanned = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: SizedBox(
        height: 300,
         child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: MobileScanner(

            controller: controller,
            onDetect: (capture) {
              if (_isScanned) return;
              _isScanned = true;
              final barcode = capture.barcodes.first;
              final value = barcode.rawValue;
              if (value != null) {
                context
                    .read<AttendCandidateCubit>()
                    .attendCandidate(value,true);
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

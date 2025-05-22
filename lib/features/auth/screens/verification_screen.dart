import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pinput/pinput.dart';

import '../../../core/cubit/base_cubit_state.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/custom_loading_widget.dart';
import '../cubit/login_cubit.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key, required this.name});

  final String name;

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final controller = TextEditingController(text: kDebugMode ? '1111' : null);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text('ادخل رقم التحقق'),
        )),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Pinput(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  controller: controller,
                  length: 4,
                  validator: (val) {
                    if (val?.isEmpty == true || val!.length < 4) {
                      return 'برجاء ادخال رمز التحقق';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              BlocBuilder<LoginCubit, BaseCubitState>(
                  builder: (context, state) {
                if (state == BaseCubitState.loading) {
                  return const CustomLoadingButtonWidget();
                }
                return CustomElevatedButton(
                  buttonText: 'تحقق',
                  onTap: () {
                    if (controller.length < 4) {
                      return;
                    }
                    context
                        .read<LoginCubit>()
                        .login(widget.name, controller.text);
                  },
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

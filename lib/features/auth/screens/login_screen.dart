import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fullcycle/core/extensions/string_extenstions.dart';

import '../../../core/cubit/base_cubit_state.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/custom_loading_widget.dart';
import '../../../shared/widgets/custom_text_field.dart';
import '../cubit/send_otp_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final nationalId =
      TextEditingController(text: kDebugMode ? '2372133871' : null);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('تسجيل الدخول'),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                CustomTextField(
                  controller: nationalId,
                  hintText: 'رقم الهوية',
                  keyboardType: TextInputType.number,
                  validator: (val) => val!.phoneValidator(val),
                ),
                const SizedBox(height: 20),
                BlocBuilder<SendOtpCubit, BaseCubitState>(
                    builder: (context, state) {
                  if (state == BaseCubitState.loading) {
                    return const CustomLoadingButtonWidget();
                  }
                  return CustomElevatedButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        context
                            .read<SendOtpCubit>()
                            .sendOtp(nationalId.text);
                      }
                    },
                    buttonText: 'تسجيل الدخول',
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

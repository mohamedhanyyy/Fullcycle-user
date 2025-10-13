import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fullcycle/core/cubit/base_cubit_state.dart';
import 'package:fullcycle/core/resources/colors.dart';
import 'package:fullcycle/features/candidate/cubit/get_candidate_banks_cubit.dart';
import 'package:fullcycle/features/candidate/cubit/validate_iban_cubit.dart';
import 'package:fullcycle/shared/widgets/custom_button.dart';
import 'package:fullcycle/shared/widgets/custom_loading_widget.dart';
import 'package:fullcycle/shared/widgets/custom_text_field.dart';

import '../../data/models/user_banks_model.dart';

class UserBanksScreen extends StatefulWidget {
  const UserBanksScreen({super.key});

  @override
  State<UserBanksScreen> createState() => _UserBanksScreenState();
}

class _UserBanksScreenState extends State<UserBanksScreen> {
  late GetCandidateBanksCubit getCandidateBanksCubit;
  final ibanController = TextEditingController();
  final delegateNameController = TextEditingController();
  final delegateIdController = TextEditingController();

  BankInfoModel? selectedBank;
  bool hasDelegate = false;

  @override
  void initState() {
    super.initState();
    getCandidateBanksCubit = context.read<GetCandidateBanksCubit>();
    getCandidateBanksCubit.getUserBanks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اضف بيانات البنك'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<GetCandidateBanksCubit, CubitState>(
              builder: (context, state) {
                if (state == CubitState.loading) {
                  return const CustomLoadingWidget();
                } else if (state == CubitState.done) {
                  final banks =
                      getCandidateBanksCubit.userBanksModel?.data ?? [];

                  if (banks.isEmpty) {
                    return const Text("لا توجد بنوك متاحة");
                  }

                  return DropdownButtonFormField<BankInfoModel>(
                    decoration: const InputDecoration(
                      labelText: "اختر بنك",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.primaryColor),
                      ),
                    ),
                    items: banks.map((bank) {
                      return DropdownMenuItem<BankInfoModel>(
                        value: bank,
                        child: Text(bank.text ?? ""),
                      );
                    }).toList(),
                    onChanged: (value) {
                      selectedBank = value!;
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                      controller: ibanController, hintText: 'رقم ال IBAN'),
                ),
                TextButton(
                  onPressed: () {
                    if (selectedBank != null) {
                      context.read<ValidateIbanCubit>().validateIban(
                          ibanController.text, selectedBank?.value);
                    }
                  },
                  child: const Text('تحقق'),
                )
              ],
            ),
            const SizedBox(height: 20),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: const BorderSide(color: Colors.black)),
              value: hasDelegate,
              onChanged: (val) {
                setState(() {
                  hasDelegate = val ?? false;
                });
              },
              title: const Text("هل يوجد مفوض؟"),
              controlAffinity: ListTileControlAffinity.leading,
            ),
            if (hasDelegate) ...[
              const SizedBox(height: 10),
              CustomTextField(
                controller: delegateNameController,
                hintText: 'اسم المفوض',
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: delegateIdController,
                hintText: 'رقم هوية المفوض',
              ),
            ],
            const SizedBox(height: 20),
            BlocBuilder<ValidateIbanCubit, CubitState>(
              builder: (context, state) {
                if (state == CubitState.loading) {
                  return const CustomLoadingButtonWidget();
                }
                return CustomElevatedButton(
                  onTap: () {
                    final iban = ibanController.text;
                    final bankId = selectedBank?.value;

                    final delegateName =
                        hasDelegate ? delegateNameController.text : null;

                    context.read<ValidateIbanCubit>().upldateIban(
                        iban, bankId, hasDelegate, bankId, delegateName);
                  },
                  buttonText: 'إضافة بيانات البنك',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

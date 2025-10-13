import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fullcycle/features/candidate/cubit/get_candidate_experiences_cubit.dart';
import 'package:fullcycle/features/experience/presentation/screens/add_experience_screen.dart';
import 'package:fullcycle/services/navigation/navigation.dart';
import 'package:fullcycle/shared/widgets/custom_button.dart';
import 'package:fullcycle/shared/widgets/custom_loading_widget.dart';

import '../../../../core/cubit/base_cubit_state.dart';
import '../../../../core/resources/colors.dart';
import '../widgets/delete_experience_popup.dart';
import 'edit_experience_screen.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({super.key});

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  late GetCandidateExperiencesCubit getCandidateExperiencesCubit;

  @override
  void initState() {
    super.initState();
    getCandidateExperiencesCubit = context.read<GetCandidateExperiencesCubit>();
    getCandidateExperiencesCubit.getCandidateExperiences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الخبرات والمشاراكات'),
        actions: [
          IconButton(
              onPressed: () =>
                  AppNavigation.navigate(const AddExperienceScreen()),
              icon: const Icon(
                Icons.add,
                size: 30,
              ))
        ],
      ),
      body: BlocBuilder<GetCandidateExperiencesCubit, CubitState>(
          builder: (context, state) {
        if (state == CubitState.done) {
          return ListView.builder(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
              itemCount:
                  getCandidateExperiencesCubit.experiencesModel?.data?.length,
              itemBuilder: (context, index) {
                final experience =
                    getCandidateExperiencesCubit.experiencesModel?.data?[index];
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
                          Text(
                            '${experience?.position}',
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          PopupMenuButton<String>(
                            onSelected: (value) {
                              if (value == 'edit') {
                                AppNavigation.navigate(EditExperienceScreen(
                                  item: experience!,
                                ));
                              } else if (value == 'delete') {
                                showDeleteExperienceDialog(experience!.id!);
                              }
                            },
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                value: 'edit',
                                child: Text("تعديل الخبرة"),
                              ),
                              const PopupMenuItem(
                                value: 'delete',
                                child: Text("مسح الخبرة"),
                              ),
                            ],
                            icon: const Icon(Icons.more_horiz),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 12),
                        child: Text('${experience?.companyName}'),
                      ),
                      Text('${experience?.description}')
                    ],
                  ),
                );
              });
        } else if (state == CubitState.loading) {
          return const CustomLoadingWidget();
        } else if (state == CubitState.empty) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 100, left: 16, right: 16),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/noexp.png'),
                  const Text(
                    "لا توجد خبرات مضافة حتى الآن",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      "قم بإضافة خبراتك السابقة لتظهر في ملفك الشخصي وتعزز فرصك في التقديم للفرص المناسبة.",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xff384250)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  CustomElevatedButton(
                    onTap: () => AppNavigation.navigate(const AddExperienceScreen()),
                    buttonText: 'اضافة خبرة جديدة',
                    fontColor: const Color(0xffF5DCCB),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  )
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      }),
    );
  }
}

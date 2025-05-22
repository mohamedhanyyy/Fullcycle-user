import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fullcycle/services/navigation/navigation.dart';
import 'package:fullcycle/services/shared_preferences/preferences_helper.dart';
import 'package:fullcycle/shared/functions/general_functions.dart';
import 'package:fullcycle/shared/themes/app_theme.dart';
import 'features/auth/cubit/login_cubit.dart';
import 'features/auth/cubit/send_otp_cubit.dart';
import 'features/auth/screens/login_screen.dart';
import 'features/home/presentation/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      useInheritedMediaQuery: true,
      builder: (context, cont) {
        return GestureDetector(
          onTap: GeneralFunctions.hideKeyboard,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => LoginCubit()),
              BlocProvider(create: (context) => SendOtpCubit()),
            ],
            child: MaterialApp(
              title: 'fullcycle',
              theme: AppThemes.whiteTheme,
              locale: const Locale('ar'),
              debugShowCheckedModeBanner: false,
              navigatorKey: AppNavigation.navigatorKey,
              home: CacheHelper.getToken == null
                  ? const LoginScreen()
                  : const HomeScreen(),
            ),
          ),
        );
      },
    );
  }
}

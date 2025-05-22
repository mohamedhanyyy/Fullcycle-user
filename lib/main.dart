import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fullcycle/services/shared_preferences/preferences_helper.dart';
import 'package:fullcycle/shared/functions/general_functions.dart';
import 'package:fullcycle/srs_app.dart';

 import 'shared/functions/restart_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GeneralFunctions.setPreferredOrientation();
  await  Firebase.initializeApp();

  await CacheHelper.init();

  runApp(const RestartWidget(child: MyApp()));
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fullcycle/features/candidate/data/repository/candidate_repository.dart';
import 'package:fullcycle/services/cache/cache_helper.dart';
import 'package:fullcycle/full_cycle.dart';
import 'shared/functions/restart_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await CacheHelper.init();
  debugPrint(CacheHelper.getToken);
  CandidateRepository.getLookUps();
  runApp(const RestartWidget(child: MyApp()));
}

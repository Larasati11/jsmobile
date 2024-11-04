import 'package:flutter/material.dart';
import 'package:master_plan_pertemuan10/models/plan.dart';
import 'package:master_plan_pertemuan10/provider/plan_provider.dart';
import 'package:master_plan_pertemuan10/views/plan_creator_screen.dart';
import './views/plan_screen.dart';

void main() => runApp(MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

 @override
Widget build(BuildContext context) {
  return PlanProvider(
    notifier: ValueNotifier<List<Plan>>(const []),
    child: MaterialApp(
      title: 'State management app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PlanCreatorScreen(),
    ),
  );
}
}

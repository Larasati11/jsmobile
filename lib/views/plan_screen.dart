import 'package:master_plan_pertemuan10/provider/plan_provider.dart';
import '../models/data_layer.dart';
import 'package:flutter/material.dart';

class PlanScreen extends StatefulWidget {
  final Plan plan;
  const PlanScreen({super.key, required this.plan});
  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  late ScrollController scrollController;
  Plan get plan => widget.plan;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<Plan>> plansNotifier = PlanProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(plan.name)),
      body: ValueListenableBuilder<List<Plan>>(
        valueListenable: plansNotifier,
        builder: (context, plans, child) {
          if (plans.isEmpty) {
            return Center(child: Text('No plans available'));
          }
          Plan currentPlan = plans.firstWhere((p) => p.name == plan.name, orElse: () => Plan(name: 'Empty Plan', tasks: []));
          return Column(
            children: [
              Expanded(child: _buildList(currentPlan)),
              SafeArea(child: Text(currentPlan.completenessMessage)),
            ],
          );
        },
      ),
      floatingActionButton: _buildAddTaskButton(context),
    );
  }

  Widget _buildAddTaskButton(BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        Plan currentPlan = plan;
        int planIndex =
            planNotifier.value.indexWhere((p) => p.name == currentPlan.name);
        if (planIndex != -1) {
          List<Task> updatedTasks = List<Task>.from(currentPlan.tasks)
            ..add(const Task());
          planNotifier.value = List<Plan>.from(planNotifier.value)
            ..[planIndex] = Plan(
              name: currentPlan.name,
              tasks: updatedTasks,
            );
        }
      },
    );
  }

  Widget _buildList(Plan plan) {
    if (plan.tasks.isEmpty) {
      return Center(child: Text('No tasks available'));
    }
    return ListView.builder(
      controller: scrollController,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) {
        if (index >= plan.tasks.length) {
          return Container(); // Handle out of range index
        }
        return _buildTaskTile(plan.tasks[index], index, context);
      },
    );
  }

  Widget _buildTaskTile(Task task, int index, BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);

    return ListTile(
      leading: Checkbox(
          value: task.complete,
          onChanged: (selected) {
            Plan currentPlan = plan;
            int planIndex = planNotifier.value
                .indexWhere((p) => p.name == currentPlan.name);
            if (planIndex != -1 && index < currentPlan.tasks.length) {
              planNotifier.value = List<Plan>.from(planNotifier.value)
                ..[planIndex] = Plan(
                  name: currentPlan.name,
                  tasks: List<Task>.from(currentPlan.tasks)
                    ..[index] = Task(
                      description: task.description,
                      complete: selected ?? false,
                    ),
                );
            }
          }),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          Plan currentPlan = plan;
          int planIndex =
              planNotifier.value.indexWhere((p) => p.name == currentPlan.name);
          if (planIndex != -1 && index < currentPlan.tasks.length) {
            planNotifier.value = List<Plan>.from(planNotifier.value)
              ..[planIndex] = Plan(
                name: currentPlan.name,
                tasks: List<Task>.from(currentPlan.tasks)
                  ..[index] = Task(
                    description: text,
                    complete: task.complete,
                  ),
              );
          }
        },
      ),
    );
  }
}
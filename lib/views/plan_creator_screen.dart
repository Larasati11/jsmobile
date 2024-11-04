import 'package:flutter/material.dart';
import 'package:master_plan_pertemuan10/provider/plan_provider.dart';
import 'package:master_plan_pertemuan10/views/plan_screen.dart';
import '../models/data_layer.dart'; // Pastikan path ini sesuai dengan struktur folder Anda

class PlanCreatorScreen extends StatefulWidget {
  @override
  _PlanCreatorScreenState createState() => _PlanCreatorScreenState();
}

class _PlanCreatorScreenState extends State<PlanCreatorScreen> {
  // Menggunakan TextEditingController untuk mengelola input teks
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Ganti ‘Namaku' dengan nama panggilan Anda
      appBar: AppBar(title: const Text('Master Plans Namaku')),
      body: Column(
        children: [
          _buildListCreator(context), // Pass context to this method
          Expanded(child: _buildMasterPlans(context)) // Pass context to this method
        ],
      ),
    );
  }

  Widget _buildListCreator(BuildContext context) {
    // Menerima context sebagai parameter
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Material(
        color: Theme.of(context).cardColor,
        elevation: 10,
        child: TextField(
          controller: textController,
          decoration: const InputDecoration(
            labelText: 'Add a plan',
            contentPadding: EdgeInsets.all(20),
          ),
          onEditingComplete: () => addPlan(context), // Menambahkan context
        ),
      ),
    );
  }

  void addPlan(BuildContext context) {
    // Menerima context sebagai parameter
    final text = textController.text;
    if (text.isEmpty) {
      return;
    }
    final plan = Plan(name: text, tasks: []);
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);
    planNotifier.value = List<Plan>.from(planNotifier.value)..add(plan);
    textController.clear();
    FocusScope.of(context).requestFocus(FocusNode());
  }

  Widget _buildMasterPlans(BuildContext context) {
    // Menerima context sebagai parameter
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);
    List<Plan> plans = planNotifier.value;

    if (plans.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(Icons.note, size: 100, color: Colors.grey),
          Text(
            'Anda belum memiliki rencana apapun.',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      );
    }

    return ListView.builder(
      itemCount: plans.length,
      itemBuilder: (context, index) {
        final plan = plans[index];
        return ListTile(
          title: Text(plan.name),
          subtitle: Text(plan.completenessMessage),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => PlanScreen(plan: plan)),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    textController.dispose(); // Pastikan untuk membersihkan controller saat tidak digunakan
    super.dispose();
  }
}

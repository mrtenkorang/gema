import 'package:flutter/material.dart';
import 'package:gema/view/register/register_controller.dart';
import 'package:get/get.dart';

class PassedHistory extends StatelessWidget {
  const PassedHistory({super.key});

  @override
  Widget build(BuildContext context) {


    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Passed History'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.drafts), text: 'Drafts'),
              Tab(icon: Icon(Icons.check), text: 'Submitted'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            DraftsTab(),
            SubmittedTab(),
          ],
        ),
      ),
    );
  }
}

class DraftsTab extends StatelessWidget {
  const DraftsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final registerController = Get.put(RegisterController());
    final theme = Theme.of(context);
    debugPrint("Drafts Tab DATA ::::::::: ${registerController.passPropertyDetails}");
    return const Center(
      child: Text('Drafts Tab'),
    );
  }
}

class SubmittedTab extends StatelessWidget {
  const SubmittedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Submitted Tab'),
    );
  }
}
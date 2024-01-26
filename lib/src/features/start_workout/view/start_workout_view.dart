import 'package:fitness_app/widgets/scaffold.dart';
import 'package:flutter/material.dart';

class StartWorkoutView extends StatelessWidget {
  const StartWorkoutView({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return XScaffold(
      child: Center(
        child: Text('Start Workout $id'),
      ),
    );
  }
}

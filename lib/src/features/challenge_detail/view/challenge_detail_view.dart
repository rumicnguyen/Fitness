import 'package:fitness_app/widgets/scaffold.dart';
import 'package:flutter/material.dart';

class ChallengeDetailView extends StatelessWidget {
  const ChallengeDetailView({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return XScaffold(
      child: Center(child: Text('Challenge detail $id')),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gym_buddy/model/workout.dart';

class WorkoutCard extends StatelessWidget {
  final Workout workout;
  final VoidCallback onDelete;

  const WorkoutCard({
    required this.workout,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(workout.name),
        subtitle: Text(workout.description),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
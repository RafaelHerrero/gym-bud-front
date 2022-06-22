class Workout {
  final String workoutName;
  final String workoutId;
  final String workoutDescription;

  Workout(
      {required this.workoutName,
      required this.workoutId,
      required this.workoutDescription});

  Workout.fromJson(Map<String, dynamic> json)
      : workoutName = json['workout_name'],
        workoutId = json['workout_id'],
        workoutDescription = json['workout_description'];

  Map<String, dynamic> toJson() => {
        'workout_name': workoutName,
        'workout_id': workoutId,
        'workout_description': workoutDescription,
      };
}

// final workouts = [
//   Workout(workoutName: "TREINO A", workoutId: "treino_a"),
//   Workout(workoutName: "TREINO B", workoutId: "treino_b"),
//   Workout(workoutName: "TREINO C", workoutId: "treino_c"),
// ];

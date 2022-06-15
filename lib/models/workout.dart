class Workout {
  final String workoutName;
  final String workoutId;

  Workout({required this.workoutName, required this.workoutId});
}

final workouts = [
  Workout(workoutName: "TREINO A", workoutId: "treino_a"),
  Workout(workoutName: "TREINO B", workoutId: "treino_b"),
  Workout(workoutName: "TREINO C", workoutId: "treino_c"),
];
class ExercisePlanWorkouts {
  String exercisePlanWorkoutId;
  String exercisePlanId;
  String workoutId;
  DateTime createdAt;
  DateTime updatedAt;

  ExercisePlanWorkouts({
    required this.exercisePlanWorkoutId,
    required this.exercisePlanId,
    required this.workoutId,
    required this.createdAt,
    required this.updatedAt,
  });

  ExercisePlanWorkouts.fromJson(Map<String, dynamic> json)
      : exercisePlanWorkoutId = json['exercise_plan_workout_id'],
        exercisePlanId = json['exercise_plan_id'],
        workoutId = json['workout_id'],
        createdAt = DateTime.parse(json['created_at']),
        updatedAt = DateTime.parse(json['updated_at']);

  Map<String, dynamic> toJson() => {
        'exercise_plan_workout_id': exercisePlanWorkoutId,
        'exercise_plan_id': exercisePlanId,
        'workout_id': workoutId,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };
}

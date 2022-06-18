class WorkoutPlanWorkouts {
  String workoutPlanWorkoutId;
  String workoutPlanId;
  String workoutId;
  DateTime createdAt;
  DateTime updatedAt;

  WorkoutPlanWorkouts({
    required this.workoutPlanWorkoutId,
    required this.workoutPlanId,
    required this.workoutId,
    required this.createdAt,
    required this.updatedAt,
  });

  WorkoutPlanWorkouts.fromJson(Map<String, dynamic> json)
      : workoutPlanWorkoutId = json['workout_plan_workout_id'],
        workoutPlanId = json['workout_plan_id'],
        workoutId = json['workout_id'],
        createdAt = DateTime.parse(json['created_at']),
        updatedAt = DateTime.parse(json['updated_at']);

  Map<String, dynamic> toJson() => {
        'workout_plan_workout_id': workoutPlanWorkoutId,
        'workout_plan_id': workoutPlanId,
        'workout_id': workoutId,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };
}

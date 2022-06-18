class WorkoutPlan {
  String wokoutPlanId;
  String workoutPlanName;
  String workoutPlanDescription;

  WorkoutPlan({
    required this.wokoutPlanId,
    required this.workoutPlanName,
    required this.workoutPlanDescription,
  });

  WorkoutPlan.fromJson(Map<String, dynamic> json)
      : wokoutPlanId = json['workout_plan_id'],
        workoutPlanName = json['workout_plan_name'],
        workoutPlanDescription = json['workout_plan_description'];

  Map<String, dynamic> toJson() => {
        'workout_plan_id': wokoutPlanId,
        'workout_plan_name': workoutPlanName,
        'workout_plan_description': workoutPlanDescription,
      };
}

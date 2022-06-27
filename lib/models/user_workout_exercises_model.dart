class UserWorkoutExercises {
  String workoutId;
  String exerciseId;
  String exerciseMuscleGroup;
  String exerciseName;
  String exerciseReps;
  String exerciseSets;
  String exerciseDescription;
  String exerciseImage;

  UserWorkoutExercises({
    required this.workoutId,
    required this.exerciseId,
    required this.exerciseMuscleGroup,
    required this.exerciseName,
    required this.exerciseReps,
    required this.exerciseSets,
    required this.exerciseDescription,
    required this.exerciseImage,
  });

  UserWorkoutExercises.fromJson(Map<String, dynamic> json)
      : workoutId = json['workout_id'],
        exerciseId = json['exercise_id'],
        exerciseMuscleGroup = json['exercise_muscle_group'],
        exerciseName = json['exercise_name'],
        exerciseReps = json['exercise_reps'],
        exerciseSets = json['exercise_sets'],
        exerciseDescription = json['exercise_description'],
        exerciseImage = json['exercise_image'];

  Map<String, dynamic> toJson() => {
        'workout_id': workoutId,
        'exercise_id': exerciseId,
        'exercise_muscle_group': exerciseMuscleGroup,
        'exercise_name': exerciseName,
        'exercise_reps': exerciseReps,
        'exercise_sets': exerciseSets,
        'exercise_description': exerciseDescription,
        'exercise_image': exerciseImage,
      };
}

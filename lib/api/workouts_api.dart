import 'package:gym_bud_front/models/exercise_plan_workout_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../utilities/constants.dart';

class ApiWorkout {
  Future<List<ExercisePlanWorkouts>?> getUserActiveWorkout(
    String userId,
  ) async {
    var finalUrl = '$baseUrl/workout/$userId/active';

    try {
      final response = await http.get(
        Uri.parse(finalUrl),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        Iterable variable = json.decode(response.body);
        List<ExercisePlanWorkouts> workouts =
            variable.map((e) => ExercisePlanWorkouts.fromJson(e)).toList();
        print(variable);
        return workouts;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}

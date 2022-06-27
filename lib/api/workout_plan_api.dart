import 'package:gym_bud_front/models/workout_plan_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../utilities/constants.dart';

class ApiWorkoutPlan {
  Future<List<WorkoutPlan>?> getAllWorkoutPlans(
    String userId,
  ) async {
    var finalUrl = '$baseUrl/workout/workout_plans/all';

    try {
      final response = await http.get(
        Uri.parse(finalUrl),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        Iterable variable = json.decode(response.body);
        List<WorkoutPlan> workoutPlan =
            variable.map((e) => WorkoutPlan.fromJson(e)).toList();
        return workoutPlan;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<List<WorkoutPlan>?> getUserActiveWorkoutPlan(
    String userId,
  ) async {
    var finalUrl = '$baseUrl/workout/workout_plans/active/$userId';

    try {
      final response = await http.get(
        Uri.parse(finalUrl),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        Iterable variable = json.decode(response.body);
        List<WorkoutPlan> workoutPlan =
            variable.map((e) => WorkoutPlan.fromJson(e)).toList();
        print(variable);
        return workoutPlan;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}

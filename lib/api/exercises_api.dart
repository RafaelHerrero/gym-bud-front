import 'package:gym_bud_front/models/workout_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../utilities/constants.dart';

class ApiExercise {
  Future<List<Exercise>?> getAllExercises(
    String userId,
  ) async {
    var finalUrl = '$baseUrl/exercise/all';

    try {
      final response = await http.get(
        Uri.parse(finalUrl),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        Iterable variable = json.decode(response.body);
        List<Exercise> exercises =
            variable.map((e) => Exercise.fromJson(e)).toList();
        return exercises;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}

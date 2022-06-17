import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../utilities/constants.dart';

Future<List> getUserActiveWorkout(String userId,) async {

  var finalUrl = '$baseUrl/workout/$userId/active';

  final response = await http.get(
      Uri.parse(finalUrl),
      headers: {'Content-Type': 'application/json'},
  );

  var variable = json.decode(response.body);

  if (response.statusCode == 200) {
    return variable;
  }
  return [];
}

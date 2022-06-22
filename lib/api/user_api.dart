import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../utilities/constants.dart';

Future<String> checkUserLogin(
  String userEmail,
  String userPassword,
) async {
  Map loginData = {'user_login': userEmail, 'user_password': userPassword};

  var body = json.encode(loginData);
  const String finalUrl = '$baseUrl/user/login';

  final response = await http.post(Uri.parse(finalUrl),
      headers: {'Content-Type': 'application/json'}, body: body);
  if (response.statusCode == 200) {
    return response.body;
  }
  return "error";
}

Future<String> createUser(String userFirstName, String userLastName,
    String userLogin, String userPassword) async {
  Map userData = {
    'user_firstname': userFirstName,
    'user_lastname': userLastName,
    'user_login': userLogin,
    'user_password': userPassword
  };

  var body = json.encode(userData);
  String baseUlr = '$baseUrl/user/create';

  final response = await http.post(Uri.parse(baseUlr),
      headers: {"Content-Type": "application/json"}, body: body);
  if (response.statusCode == 201) {
    return response.body;
  }
  return "error";
}

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
Future<http.Response> createUser(
    String userFirstName,
    String userLastName,
    String userLogin,
    String userPassword
    ) async {

  Map userData = {
    'user_firstname': userFirstName,
    'user_lastname': userLastName,
    'user_login': userLogin,
    'user_password': userPassword
  };

  var body = json.encode(userData);
  Uri baseUlr = 'http://127.0.0.1:8000/users/create_user' as Uri;

  final response = await http.post(
    baseUlr,
    headers: {"Content-Type": "application/json"},
    body: body
  );
  print('${response.statusCode}');
  print(response.body);
  return response;
}
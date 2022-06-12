import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<Map<String, dynamic>> createUser(
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
  String baseUlr = 'http://127.0.0.1:8000/users/create_user';

  final response = await http.post(
    Uri.parse(baseUlr),
    headers: {"Content-Type": "application/json"},
    body: body
  );
  // print('${response.statusCode}');
  // print(response.body);

  dynamic resultData;

  var responseBody = json.decode(response.body);
  // print('response body em json');
  // print(responseBody);

  if (response.statusCode == 201) {
      return responseBody;
  }

  return Future.error("error");
}
//   print('${response.statusCode}');
//   print(response.body);
//   return response;
// }
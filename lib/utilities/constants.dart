import 'package:flutter/material.dart';

const kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

const kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);
const buttonTextColor = TextStyle(
  color: Colors.white,
  letterSpacing: 1.5,
  fontFamily: 'OpenSans',
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
);

final kBoxDecorationStyle = BoxDecoration(
  color: const Color.fromARGB(255, 69, 69, 70),
  borderRadius: BorderRadius.circular(10.0),
);

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  primary: const Color.fromARGB(255, 69, 69, 70),
  onPrimary: const Color.fromARGB(255, 53, 53, 54),
  onSurface: Colors.black12,
  fixedSize: const Size.fromHeight(50),
  shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20))),
);

String? validateEmail(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value)) {
    return 'Enter a valid email address';}
  else {
    return null;}
}

String? validatePassword(String value) {
  RegExp regex =
  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (value.isEmpty) {
    return 'Please enter password';
  } else {
    if (!regex.hasMatch(value)) {
      return 'Enter valid password';
    } else {
      return null;
    }
  }
}

// foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
// overlayColor: MaterialStateProperty.resolveWith<Color?>(
// (Set<MaterialState> states) {
// if (states.contains(MaterialState.hovered)) {
// return Colors.grey.withOpacity(0.09);
// }
// if (states.contains(MaterialState.focused) ||
// states.contains(MaterialState.pressed)) {
// return Colors.grey.withOpacity(0.18);
// }
// return null; // Defer to the widget's default.
// },
// ),
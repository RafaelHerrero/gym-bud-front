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

final kBoxDecorationStyle = BoxDecoration(
  color: Colors.green,
  borderRadius: BorderRadius.circular(10.0),
);

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  primary: Colors.green,
  onPrimary: Colors.green,
  onSurface: Colors.black12,
  fixedSize: const Size.fromHeight(50),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20))
  ),
);

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
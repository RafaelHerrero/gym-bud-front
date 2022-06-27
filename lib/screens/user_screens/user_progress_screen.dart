import 'package:flutter/material.dart';
import 'package:gym_bud_front/utilities/constants.dart';
import '../../utilities/common_widgets.dart';
import '../../utilities/constants.dart';
import 'package:intl/intl.dart';

class ProgressScreen extends StatefulWidget {
  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [topInformationBar(height, "User Progress Screen")],
      ),
    );
  }
}

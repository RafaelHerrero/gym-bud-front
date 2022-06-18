import 'package:flutter/material.dart';
import 'package:gym_bud_front/utilities/common_widgets.dart';

class AddWorkoutPlanScreen extends StatefulWidget {
  @override
  _AddWorkoutPlanScreenState createState() => _AddWorkoutPlanScreenState();
}

class _AddWorkoutPlanScreenState extends State<AddWorkoutPlanScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [topInformationBar(height, "Add Workout Plan")],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gym_bud_front/utilities/common_widgets.dart';

class AddExerciseScreen extends StatefulWidget {
  @override
  _AddExerciseScreenState createState() => _AddExerciseScreenState();
}

class _AddExerciseScreenState extends State<AddExerciseScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [topInformationBar(height, "Add Exercise")],
      ),
    );
  }
}

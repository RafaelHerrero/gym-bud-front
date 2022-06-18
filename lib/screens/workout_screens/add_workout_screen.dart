import 'package:flutter/material.dart';
import 'package:gym_bud_front/utilities/common_widgets.dart';

class AddWorkoutScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<AddWorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          topInformationBar(height, "Add Workouts"),
          Positioned(
            top: height * 0.24,
            child: Container(
              height: height * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [goBackOnePage(context)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_bud_front/screens/workout_screens/add_exercise_screen.dart';
import 'package:gym_bud_front/screens/workout_screens/add_workout_plan_screen.dart';
import 'package:gym_bud_front/screens/workout_screens/add_workout_screen.dart';
import 'package:gym_bud_front/utilities/constants.dart';
import '../../utilities/common_widgets.dart';

class CreateWorkoutScreen extends StatefulWidget {
  final String loggedUserId;
  final String loggedUserName;
  const CreateWorkoutScreen(
      {Key? key, required this.loggedUserId, required this.loggedUserName})
      : super(key: key);
  @override
  _CreateWorkoutScreenState createState() => _CreateWorkoutScreenState();
}

class _CreateWorkoutScreenState extends State<CreateWorkoutScreen> {
  List addButtons = [
    {"button_text": "Add Workout Plan", "button_page": AddWorkoutPlanScreen()},
    {"button_text": "Add Workout", "button_page": AddWorkoutScreen()},
    {"button_text": "Add Exercise", "button_page": AddExerciseScreen()},
  ];
  // Map addButtonsMap = {
  //   'Add Woraakout': AddWorkoutScreen(),
  //   'Add Workout Plan': AddWorkoutPlanScreen(),
  //   'Add Exercise': AddExerciseScreen(),
  // };

  Widget addWorkoutButton(Map button) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.blueGrey;
              }
              return null;
            },
          ),
        ),
        child: Text(
          button["button_text"],
          style: buttonTextColor,
        ),
        onPressed: () {
          print(button);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => button["button_page"],
            ),
          );
        },
      ),
    );
  }

  Widget addButton(height) {
    return Positioned(
      top: height * 0.24,
      left: 0,
      right: 0,
      child: Container(
        height: height * 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (int i = 0; i < addButtons.length; i++)
              addWorkoutButton(addButtons[i]),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          topInformationBar(height, "Add Workout Screen"),
          addButton(height)
        ],
      ),
    );
  }
}

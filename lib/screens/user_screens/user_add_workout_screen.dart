import 'package:flutter/material.dart';
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

  Widget addWorkoutPlan(height) {
    return Positioned(
        top: height * 0.24,
        left: 0,
        right: 0,
        child: Container(
          height: height * 0.6,
          color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 40,
                ),
                alignment: Alignment.center,
                onPressed: () {
                  print('a');
              },
              ),
            ],
          ),
        ),
    );
  }

  @override
  Widget build(BuildContext context){
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          topInformationBar(height, "Add Workout Screen"),
          addWorkoutPlan(height)
        ],
      ),
    );
  }}

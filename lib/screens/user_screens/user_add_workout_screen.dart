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

  @override
  Widget build(BuildContext context){
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          topInformationBar(height, "Add Workout Screen")
        ],
      ),
    );
  }}

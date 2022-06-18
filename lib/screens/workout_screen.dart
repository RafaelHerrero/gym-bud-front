import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_bud_front/models/workout.dart';
import 'package:intl/intl.dart';

import '../models/exercises.dart';
import '../utilities/common_widgets.dart';
import '../utilities/constants.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen(
      {Key? key,
        required this.userId,
        required this.userName,
        required this.workoutName,
        required this.workoutId,
      }) : super(key: key);

  final String userId;
  final String userName;
  final String workoutName;
  final String workoutId;


  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();

    Widget _workoutTitle(workoutName) {
      return ListTile(
        title: Text(
          "${DateFormat("EEEE").format(today)}, ${DateFormat("d MMMM").format(today)}",
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: Colors.white
          ),
        ),
        subtitle: Text(
          workoutName,
          style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 25,
              color: Colors.white
          ),
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.access_time,
                color: Colors.white30,),
                SizedBox(width: 5,),
                Text(
                  "60 mins",
                  style: iconTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.shutter_speed,
                  color: Colors.white30,
                ),
                SizedBox(width: 5,),
                Text(
                  "Easy",
                  style: iconTextStyle,
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget _workoutsDescriptions(exercises) {
      return ListTile(
        leading: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: boxColor,
          ),
          padding: const EdgeInsets.all(6),
          child: Image.asset(
            exercises.imagePath,
            width: 45,
            height: 45,
            color: Colors.white,
          ),
        ),
        title: Text(
          exercises.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Row(
          children: [
            Text(
              '${exercises.sets} sets',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(width: 10,),
            Text(
              '${exercises.reps} reps',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(width: 10,),
            Text(
              exercises.description,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16,
          ),
          child: Column(
            children: [
              goBackOnePage(context),
              _workoutTitle(workoutName),
              for (int i = 0; i < fullUpperBody.length; i++)
                _workoutsDescriptions(fullUpperBody[i])
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gym_bud_front/screens/workout_screen.dart';
import 'package:intl/intl.dart';
import 'package:gym_bud_front/models/workout.dart';
import '../../utilities/constants.dart';
import '../../utilities/string_extension.dart';

class HomeScreen extends StatefulWidget {
  final String loggedUserId;
  final String loggedUserName;

  const HomeScreen(
      {Key? key, required this.loggedUserId, required this.loggedUserName})
      : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final today = DateTime.now();

  Widget _userInformationBar(loggedUserName, height) {
    return Positioned(
      top: 0,
      height: height * 0.20,
      left: 0,
      right: 0,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(40)
        ),
        child: Container(
          color: boxColor,
          padding: const EdgeInsets.only(
            top: 40,
            left: 22,
            right: 16,
            bottom: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  "${DateFormat("EEEE").format(today)}, ${DateFormat("d MMMM")
                      .format(today)}",
                  style: const TextStyle(
                    color: Colors.white30,
                  ),
                ),
                subtitle: Text(
                  '$loggedUserName'.toTitleCase(),
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _workoutListTitle() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 8, left: 32, right: 16),
      child: Text(
        "Workouts",
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _workoutsList(loggedUserId, loggedUserName, height) {
    return Positioned(
      top: height * 0.24,
      left: 0,
      right: 0,
      child: Container(
        height: height * 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _workoutListTitle(),
            Expanded(
              // child: Container(color: Colors.yellow,),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    for (int i = 0; i < workouts.length; i++)
                      _WorkoutCard(
                        workout: workouts[i],
                        userId: loggedUserId,
                        userName: loggedUserName,
                      )
                  ],
                ),
              ),
            ),
            // Expanded(child: child)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    return Stack(
      children: [
        _userInformationBar(widget.loggedUserName, height),
        _workoutsList(widget.loggedUserId, widget.loggedUserName, height),
      ],
    );
  }
}


class _WorkoutCard extends StatelessWidget {
  final Workout workout;
  final String userId;
  final String userName;

// ignore: unused_element
  const _WorkoutCard({Key? key,
    required this.workout,
    required this.userId,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 15
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                onTap: () {
                  print("pressed workout ${workout.workoutName}");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          WorkoutScreen(
                            userId: userId,
                            userName: userName,
                            workoutName: workout.workoutName,
                            workoutId: workout.workoutId,
                          ),
                    ),
                  );
                },
                child: Container(
                  color: boxColor,
                  height: 38,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 9),
                    child: Text(
                      workout.workoutName,
                      style: kLabelStyle,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
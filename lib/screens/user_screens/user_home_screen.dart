import 'package:flutter/material.dart';
import 'package:gym_bud_front/screens/workout_screen.dart';
import 'package:gym_bud_front/models/workout.dart';
import '../../api/workouts_api.dart';
import '../../models/exercise_plan_workout_model.dart';
import '../../utilities/common_widgets.dart';
import '../../utilities/constants.dart';

class HomeScreen extends StatefulWidget {
  final String loggedUserId;
  final String loggedUserName;
  // final List workoutList;

  const HomeScreen({
    Key? key,
    required this.loggedUserId,
    required this.loggedUserName,
    // required this.workoutList
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  int counter = 0;

  @override
  bool get wantKeepAlive => true;
  List workoutList = [];

  void getWorkoutList() async {
    var _workoutList = getUserActiveWorkout(widget.loggedUserId);
    workoutList = await _workoutList;
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

  Widget _workoutsList(loggedUserId, loggedUserName, height, userWorkouts) {
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
                    for (int i = 0; i < userWorkouts.length; i++)
                      _WorkoutCard(
                        workout: userWorkouts[i],
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
    super.build(context);
    getWorkoutList();
    print(workoutList);
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        topInformationBar(height, widget.loggedUserName),
        _workoutsList(widget.loggedUserId, widget.loggedUserName, height,
            getWorkoutList()),
      ],
    );
  }
}

class _WorkoutCard extends StatelessWidget {
  final workout;
  final String userId;
  final String userName;

// ignore: unused_element
  const _WorkoutCard({
    Key? key,
    required this.workout,
    required this.userId,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
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
                  // print(getUserActiveWorkout(userId));
                  print("pressed workout ${workout["workout_id"]}");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WorkoutScreen(
                        userId: userId,
                        userName: userName,
                        workoutName: workout["workout_id"],
                        workoutId: workout["workout_id"],
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
                      workout["workout_id"],
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

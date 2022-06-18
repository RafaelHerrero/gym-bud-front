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
  final List<ExercisePlanWorkouts>? workoutList;

  const HomeScreen(
      {Key? key,
      required this.loggedUserId,
      required this.loggedUserName,
      required this.workoutList})
      : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  int counter = 0;

  @override
  bool get wantKeepAlive => true;

  // late List<ExercisePlanWorkouts> workoutList = [];

  // void getWorkoutList() async {
  //   workoutList =
  //       (await ApiWorkout().getUserActiveWorkout(widget.loggedUserId))!;
  // }

  @override
  void initState() {
    super.initState();
    // getWorkoutList();
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
                    for (int i = 0; i < widget.workoutList!.length; i++)
                      _WorkoutCard(
                        workout: widget.workoutList![i],
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
    // getWorkoutList();
    // print(workoutList);
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        topInformationBar(height, widget.loggedUserName),
        _workoutsList(widget.loggedUserId, widget.loggedUserName, height,
            widget.workoutList),
      ],
    );
  }
}

class _WorkoutCard extends StatelessWidget {
  final ExercisePlanWorkouts workout;
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
                  print("pressed workout ${workout.workoutId}");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WorkoutScreen(
                        userId: userId,
                        userName: userName,
                        workoutName: workout.workoutId,
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
                      workout.workoutId,
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

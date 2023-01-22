import 'package:flutter/material.dart';
import 'package:gym_bud_front/models/workout_model.dart';
import 'package:gym_bud_front/models/workout_plan_model.dart';
import 'package:gym_bud_front/screens/globals.dart' as globals;
import 'package:gym_bud_front/screens/workout_screens/workout_screen.dart';
import 'package:gym_bud_front/models/workout_plan_workout_model.dart';
import 'package:gym_bud_front/utilities/common_widgets.dart';
import 'package:gym_bud_front/utilities/constants.dart';

class HomeScreen extends StatefulWidget {
  final List<Workout>? workoutList;
  final List<WorkoutPlan>? userActiveWorkoutPlan;

  const HomeScreen(
      {Key? key,
      required this.workoutList,
      required this.userActiveWorkoutPlan})
      : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  Widget _workoutListTitle() {
    String name = widget.userActiveWorkoutPlan![0].workoutPlanName;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 32, right: 16),
      child: Text(
        "Workouts - ${name}",
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _workoutsList(height, userWorkouts) {
    return Positioned(
      top: height * 0.19,
      left: 0,
      right: 0,
      child: Container(
        height: height * 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _workoutListTitle(),
            Expanded(
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
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        topInformationBar(height, globals.userName),
        _workoutsList(height, widget.workoutList),
      ],
    );
  }
}

class _WorkoutCard extends StatelessWidget {
  final Workout workout;

  const _WorkoutCard({
    Key? key,
    required this.workout,
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
                        workoutDescription: workout.workoutDescription,
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

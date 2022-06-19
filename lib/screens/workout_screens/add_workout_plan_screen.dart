import 'package:flutter/material.dart';
import 'package:gym_bud_front/screens/globals.dart' as globals;
import 'package:gym_bud_front/api/workout_plan_api.dart';
import 'package:gym_bud_front/models/workout.dart';
import 'package:gym_bud_front/models/workout_plan_model.dart';
import 'package:gym_bud_front/utilities/common_widgets.dart';

// typedef OnDelete();

class AddWorkoutPlanScreen extends StatefulWidget {
  @override
  _AddWorkoutPlanScreenState createState() => _AddWorkoutPlanScreenState();
}

class _AddWorkoutPlanScreenState extends State<AddWorkoutPlanScreen> {
  late List<WorkoutPlan>? workoutPlanList = [];
  // final _formKey = GlobalKey<FormState>();
  // final _scaffoldKey = GlobalKey<ScaffoldState>();
  // final _workoutPlanNameController = TextEditingController();
  // final _workoutPlanDescriptionController = TextEditingController();
  // final _workoutPlanDurationController = TextEditingController();
  // final _workoutPlanRepetitionsController = TextEditingController();
  // final _workoutPlanRestTimeController = TextEditingController();

  void getWorkoutPlan() async {
    workoutPlanList = await ApiWorkoutPlan().getAllWorkoutPlans(globals.userId);
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  void initState() {
    getWorkoutPlan();
    super.initState();
  }

  Widget _buildWorkoutPlanForm(height) {
    return Positioned(
      top: height * 0.24,
      child: Container(
        color: Colors.red,
        height: height * 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(globals.userId),
            Text(
              "${workoutPlanList}",
            ),
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
          topInformationBar(height, "Add Workout Plan"),
          _buildWorkoutPlanForm(height),
        ],
      ),
    );
  }
}

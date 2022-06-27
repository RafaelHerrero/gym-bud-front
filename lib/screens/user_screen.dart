import 'dart:convert';
import 'package:gym_bud_front/api/workout_plan_api.dart';
import 'package:gym_bud_front/models/workout_model.dart';
import 'package:gym_bud_front/models/workout_plan_model.dart';

import 'globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:gym_bud_front/screens/user_screens/user_create_workout_area.dart';
import 'package:gym_bud_front/screens/user_screens/user_home_screen.dart';
import 'package:gym_bud_front/screens/user_screens/user_profile_screen.dart';
import 'package:gym_bud_front/api/workouts_api.dart';
import 'package:gym_bud_front/utilities/constants.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  int _selectedIndex = 0;
  late List<Workout>? workoutList = [];
  late List<WorkoutPlan>? userActiveWorkoutPlan = [];
  final today = DateTime.now();

  void getWorkoutList() async {
    workoutList = await ApiWorkout().getUserActiveWorkout(globals.userId);
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void getUserActiveWorkoutPlan() async {
    userActiveWorkoutPlan =
        await ApiWorkoutPlan().getUserActiveWorkoutPlan(globals.userId);
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  late PageController pageController;

  @override
  void initState() {
    getWorkoutList();
    getUserActiveWorkoutPlan();
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  _onTap(int index) async {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _bottomNavigationBar() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTap,
        backgroundColor: boxColor,
        iconSize: 28,
        selectedIconTheme: const IconThemeData(
          color: Colors.blue,
        ),
        unselectedIconTheme: const IconThemeData(
          color: Colors.white30,
        ),
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Icon(Icons.home),
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Icon(Icons.add),
              ),
              label: "Add"),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Icon(Icons.person),
              ),
              label: "Profile"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeScreen(
          workoutList: workoutList,
          userActiveWorkoutPlan: userActiveWorkoutPlan),
      CreateWorkoutScreen(),
      ProfileScreen()
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: _bottomNavigationBar(),
      body: workoutList == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : PageView(
              controller: pageController,
              onPageChanged: onPageChanged,
              children: screens,
            ),
    );
  }
}

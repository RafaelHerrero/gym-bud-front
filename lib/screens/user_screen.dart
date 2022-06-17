import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gym_bud_front/screens/user_screens/user_add_workout_screen.dart';
import 'package:gym_bud_front/screens/user_screens/user_home_screen.dart';
import 'package:gym_bud_front/screens/user_screens/user_profile_screen.dart';
import '../api/workouts_api.dart';
import '../utilities/constants.dart';

class UserScreen extends StatefulWidget {
  final String loggedUserId;
  final String loggedUserName;
  const UserScreen(
      {Key? key, required this.loggedUserId, required this.loggedUserName})
      : super(key: key);
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  int _selectedIndex = 0;


  final today = DateTime.now();

  void _onTap(int index) async {
    setState(() {
      _selectedIndex = index;
    });
  }

  // void getWorkoutList() async {
  //   Future<List> workoutsListString = getUserActiveWorkout(widget.loggedUserId);
  //   var workoutList = await workoutsListString;
  // }


  Widget _bottomNavigationBar() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
      child: BottomNavigationBar(
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
              label: "Add Workout"),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Icon(Icons.person),
              ),
              label: "Profile"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTap,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    // var workoutsListString = await getUserActiveWorkout(widget.loggedUserId);
    final List screens = [
      HomeScreen(loggedUserId: widget.loggedUserId, loggedUserName: widget.loggedUserName),
      CreateWorkoutScreen(loggedUserId: widget.loggedUserId, loggedUserName: widget.loggedUserName),
      ProfileScreen()
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: _bottomNavigationBar(),
      body: screens[_selectedIndex],
    );
  }}

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
  // List workoutList = [];
  final today = DateTime.now();

  late PageController pageController;

  @override
  void initState() {
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
  //
  // void getWorkoutList() async {
  //   Future<List> _workoutList = getUserActiveWorkout(widget.loggedUserId);
  //   workoutList = await _workoutList;
  // }

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
              label: "Add Workout"),
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
    // getWorkoutList();
    // print(workoutList);
    final List<Widget> screens = [
      HomeScreen(
          loggedUserId: widget.loggedUserId,
          loggedUserName: widget.loggedUserName),
      CreateWorkoutScreen(
          loggedUserId: widget.loggedUserId,
          loggedUserName: widget.loggedUserName),
      ProfileScreen()
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: _bottomNavigationBar(),
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: screens,
      ),
    );
  }
}

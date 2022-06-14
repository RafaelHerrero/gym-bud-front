import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import '../utilities/constants.dart';
import "string_extension.dart";

import 'package:gym_bud_front/models/workout.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key, required this.loggedUserId, required this.loggedUserName}) : super(key: key);
  final String loggedUserId;
  final String loggedUserName;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    final datetime = DateTime.now();
    final now = Jiffy(datetime);


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
                  child: Icon(Icons.search),
                ),
                label: "Search"),
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

    Widget _userInformationBar(loggedUserName) {
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
                    "${now.EEEE}, ${now.day} ${now.MMMM}",
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

    Widget _workoutsList(loggedUserId) {
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
                        _WorkoutCard(workout: workouts[i])
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

    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: _bottomNavigationBar(),
      body: Stack(
        children: [
          _userInformationBar(loggedUserName),
          _workoutsList(loggedUserId),
        ],
      ),
    );
  }
}


class _WorkoutCard extends StatelessWidget {
  final Workout workout;
  // ignore: unused_element
  const _WorkoutCard({Key? key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 15
      ),
      constraints: const BoxConstraints(maxHeight: 25),
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        elevation: 4,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: Column(
                children: [
                  Text(workout.workoutName),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
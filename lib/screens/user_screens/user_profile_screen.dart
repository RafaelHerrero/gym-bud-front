import 'package:flutter/material.dart';
import 'package:gym_bud_front/utilities/constants.dart';
import '../../utilities/constants.dart';
import 'package:intl/intl.dart';


class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final today = DateTime.now();

  Widget _userInformationBar(height) {
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
                subtitle: const Text(
                  'Profile Page',
                  style: TextStyle(
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

  @override
  Widget build(BuildContext context){
    final height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          _userInformationBar(height)
        ],
      ),
    );
  }}

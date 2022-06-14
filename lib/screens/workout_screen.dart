import 'package:flutter/material.dart';

class WorkoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16,
          ),
          child: Column(
            children: [
              _goBackOnePage(context),
              Container(
                color: Colors.yellow,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


Widget _goBackOnePage(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 16.0),
    child: IconButton(
      icon: const Icon(
        Icons.close,
        color: Colors.white,
        size: 40,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
  );
}
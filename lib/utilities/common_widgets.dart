import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:intl/intl.dart';

Widget topInformationBar(height, barTitle) {
  final today = DateTime.now();
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
              subtitle: Text(
                barTitle,
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

Widget goBackOnePage(BuildContext context) {
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

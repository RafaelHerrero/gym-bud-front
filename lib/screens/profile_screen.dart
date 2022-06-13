import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class ProfileScreen extends StatelessWidget {
  final String loggedUserId;
  const ProfileScreen({Key? key, required this.loggedUserId}) : super(key: key);

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
          backgroundColor: const Color.fromARGB(255, 15, 18, 23),
          iconSize: 28,
          selectedIconTheme: const IconThemeData(
            color: Colors.blue,
          ),
          unselectedIconTheme: const IconThemeData(
            color: Colors.white30,
          ),
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

    Widget _userInformationBar(loggedUserId) {
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
            color: const Color.fromARGB(255, 15, 18, 23),
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
                    loggedUserId,
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

    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: _bottomNavigationBar(),
      body: Stack(
        children: [
          _userInformationBar(loggedUserId),
        ],
      ),
    );
  }
}

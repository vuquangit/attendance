import 'package:attendance/pages/calendar_page.dart';
import 'package:attendance/pages/home_page.dart';
import 'package:attendance/pages/profile_page.dart';
import 'package:attendance/pages/task_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int pageCurrentIndex = 0;
  final pages = [
    const HomePage(),
    const CalendarPage(),
    const TaskPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageCurrentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        // iconSize: 25,
        // selectedFontSize: 16,
        // unselectedFontSize: 16,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        mouseCursor: SystemMouseCursors.grab,
        currentIndex: pageCurrentIndex,
        onTap: (index) => setState(() => pageCurrentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.calendar),
            label: 'Calendar',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.listCheck),
            label: 'Task',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user),
            label: 'Profile',
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}

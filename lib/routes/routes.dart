import 'package:attendance/pages/calendar_page.dart';
import 'package:attendance/pages/home_page.dart';
import 'package:attendance/pages/login_page.dart';
import 'package:attendance/pages/main_page.dart';
import 'package:attendance/pages/profile_page.dart';
import 'package:attendance/pages/splash_page.dart';
import 'package:attendance/pages/task_page.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String main = '/main';
  static const String calendar = '/calendar';
  static const String task = '/task';
  static const String profile = '/profile';

  static final routes = <String, WidgetBuilder>{
    login: (BuildContext context) => const LoginPage(),
    main: (BuildContext context) => const MainPage(),
    home: (BuildContext context) => const HomePage(),
    calendar: (BuildContext context) => const CalendarPage(),
    task: (BuildContext context) => const TaskPage(),
    profile: (BuildContext context) => const ProfilePage(),
    splash: (BuildContext context) => const SplashScreen(),
  };
}

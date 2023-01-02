import 'package:attendance/provider/internet_provider.dart';
import 'package:attendance/pages/login_page.dart';
import 'package:attendance/pages/main_page.dart';
import 'package:attendance/provider/sign_in_provider.dart';
import 'package:attendance/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: ((context) => SignInProvider()),
          ),
          ChangeNotifierProvider(
            create: ((context) => InternetProvider()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const MainPage();
                } else {
                  return const LoginPage();
                }
              }),
          routes: Routes.routes,
        ));
  }
}

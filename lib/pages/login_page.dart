import 'package:attendance/helpers/next_screen.dart';
import 'package:attendance/pages/home_page.dart';
import 'package:attendance/provider/sign_in_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
// import '../auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // handle after signin
    handleAfterSignIn() {
      Future.delayed(const Duration(milliseconds: 1000)).then((value) {
        nextScreenReplace(context, const HomePage());
      });
    }

    // handling google sign in
    Future handleGoogleSignIn() async {
      final sp = context.read<SignInProvider>();
      await sp.signInWithGoogle();
      await sp.saveDataToSharedPreferences();
      handleAfterSignIn();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login page'),
      ),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 40, right: 40, top: 40, bottom: 40),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Flexible(
                flex: 1,
                child: Text(
                  'Attendance',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Auth().signInWithGoogle();
                        handleGoogleSignIn();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          FaIcon(FontAwesomeIcons.google),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Login with Google"),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:attendance/helpers/next_screen.dart';
import 'package:attendance/helpers/snack_bar.dart';
import 'package:attendance/pages/home_page.dart';
// import 'package:attendance/provider/internet_provider.dart';
import 'package:attendance/provider/sign_in_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
// import '../auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // handle after sign in
    handleAfterSignIn() {
      Future.delayed(const Duration(milliseconds: 1000)).then((value) {
        nextScreenReplaceNamed(context, '/main');
      });
    }

    // handling google sign in
    Future handleGoogleSignIn() async {
      final sp = context.read<SignInProvider>();
      // final ip = context.read<InternetProvider>();
      // await ip.checkInternetConnection();

      // if (ip.hasInternet == false) {
      // openSnackbar(context, "Check your Internet connection", Colors.red);
      // googleController.reset();
      // } else {
      await sp.signInWithGoogle().then((value) {
        if (sp.hasError == true) {
          openSnackbar(context, sp.errorCode.toString(), Colors.red);
          // googleController.reset();
        } else {
          // checking whether user exists or not
          sp.checkUserExists().then((value) async {
            if (value == true) {
              // user exists
              await sp.getUserDataFromFirestore(sp.uid).then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        // googleController.success();
                        handleAfterSignIn();
                      })));
            } else {
              // user does not exist
              sp.saveDataToFirestore().then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        // googleController.success();
                        handleAfterSignIn();
                      })));
            }
          });
        }
      });
      // }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login page'),
        automaticallyImplyLeading: false,
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

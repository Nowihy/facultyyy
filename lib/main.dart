import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shubrafaculty/NavBar.dart';
import 'package:shubrafaculty/SignUp.dart';
import 'package:shubrafaculty/login_screen.dart';
import 'package:shubrafaculty/show%20request.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Shubra Faculty',
      initialRoute: LoginScreen.FacultyName,
      routes: {
        LoginScreen.FacultyName: (context) => LoginScreen(),
        showrequest.FacultyName: (context) => showrequest(),
        MainPage.FacultyName: (context) => MainPage(),
        Register.FacultyName: (context) => Register(),
      },
    );
  }
}
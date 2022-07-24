import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shubrafaculty/NavBar.dart';
import 'package:shubrafaculty/show%20request.dart';
import 'package:shubrafaculty/themeees.dart';
import 'package:shubrafaculty/utils.dart';
import 'package:shubrafaculty/validation.dart';

class LoginScreen extends StatefulWidget {
  static const String FacultyName = 'Login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '', password = '';

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(46, 64, 83, 1),
        title: const Text('Shubra Faculty'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 100, right: 100),
                child: Image.asset('images/shubrafacultylogo.jpeg',
                    fit: BoxFit.contain),
              ),
              Container(
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(children: [
                        Container(
                          child: Form(
                            key: formKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: Column(children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: 50, right: 50, top: 20),
                                padding: EdgeInsets.all(10),
                                child: TextFormField(
                                  onChanged: (text) {
                                    email = text;
                                  },
                                  validator: (text) {
                                    if (text == null || text.trim().isEmpty) {
                                      return 'please enter your Email';
                                    }
                                    if (!isValidEmail(email)) {
                                      return 'please enter a valid Email';
                                    }
                                    return null;
                                  },
                                  obscureText: false,
                                  decoration: ThemeHelper().textInputDecoration(
                                      'Email', 'اكتب البريد الالكتروني'),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 50, right: 50, top: 20),
                                padding: EdgeInsets.all(10),
                                child: TextFormField(
                                  onChanged: (text) {
                                    password = text;
                                  },
                                  validator: (text) {
                                    if (text == null || text.trim().isEmpty) {
                                      return 'ادخل الرقم السري';
                                    }
                                    if (text.length < 6) {
                                      return 'ادخل ست ارقام';
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  decoration: ThemeHelper().textIconDecoration(
                                      'Password', 'اكتب الرقم السري'),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(40),
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(27, 10, 27, 10),
                                    child: Text(
                                      'Sign In'.toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (formKey.currentState?.validate() == true) {
                                      print('valid');
                                      logInWithFireBaseAuth();
                                    }

                                  },
                                ),
                              ),
                            ]),
                          ),
                        )
                      ]))),
            ],
          ),
        ),
      ),
    );
  }

  void logInWithFireBaseAuth() async {
    try {
      showLoading(context);
      var result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      hideLoading(context);
      if (result.user != null) {
        showMessage('user log in succesful', context);
        Navigator.pushNamed(
            context, MainPage.FacultyName);

      }
    } catch (error) {
      hideLoading(context);
      showMessage('invalid Email or Password', context);
    }
  }
}

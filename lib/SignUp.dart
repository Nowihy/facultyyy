import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shubrafaculty/Add_problem_to_Firestore.dart' as AppUser;
import 'package:shubrafaculty/fireStore_utils.dart';
import 'package:shubrafaculty/utils.dart';

class Register extends StatefulWidget {
  static const String FacultyName = 'register';

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String Email = '';

  String Name = '';

  String Password = '';

  String Role = '';

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('register'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                    child: TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  onChanged: (text) {
                    Email = text;
                  },
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'please enter some thing';
                    }
                    return null;
                  },
                )),
                // Container(
                //     child:
                //     TextFormField(
                //       decoration: InputDecoration(
                //           labelText: 'Id'
                //       ),
                //       onChanged: (text){
                //         Role = text;
                //       },
                //       validator: (text){
                //         if(text==null||text.trim().isEmpty){
                //           return 'please enter some thing' ;
                //         }
                //         return null ;
                //       },
                //     )
                // ),
                Container(
                    child: TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  onChanged: (text) {
                    Name = text;
                  },
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'please enter some thing';
                    }
                    return null;
                  },
                )),
                Container(
                    child: TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  onChanged: (text) {
                    Password = text;
                  },
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'please enter some thing';
                    }
                    return null;
                  },
                )),
                Container(
                    child: TextFormField(
                  decoration: const InputDecoration(labelText: 'Role'),
                  onChanged: (text) {
                    Role = text;
                  },
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'please enter some thing';
                    }
                    return null;
                  },
                )),
                Container(
                  child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState?.validate() == true) {
                          creatAccountwithFireBaseAuth();
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('create account'),
                          Icon(Icons.arrow_right)
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void creatAccountwithFireBaseAuth() async {
    try {
      showLoading(context);
      var result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: Email, password: Password);
      if (result.user != null) {
        AddUserToFireStore(AppUser.User(
          Email: Email,
          Id: result.user!.uid,
          Name: Name,
          Password: Password,
          Role: Role,
        )).then((value) {
          hideLoading(context);
          showMessage('user registered succesful', context);
        }).onError((error, stackTrace) {
          showMessage(error.toString(), context);
        });

        showMessage('user registerd succesful', context);
      }
    } catch (error) {
      hideLoading(context);
      showMessage('invalid Email or Password', context);
    }
  }
}

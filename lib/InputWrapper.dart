import 'package:flutter/material.dart';
import 'package:shubrafaculty/themeees.dart';

class InputWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: [
      Container(
        margin: EdgeInsets.only(left: 50, right: 50, top: 20),
        padding: EdgeInsets.all(10),
        child: TextField(
          obscureText: true,
          decoration: ThemeHelper().textInputDecoration('Email','اكتب الحساب'),
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 50, right: 50, top: 20),
        padding: EdgeInsets.all(10),
        child: TextField(
          obscureText: true,
          decoration: ThemeHelper().textInputDecoration('Password','اكتب الرقم السري',),
        ),
      )
    ]);
    //   Padding(padding: EdgeInsets.all(30),
    // child: Column(
    //   children: [
    //     SizedBox(height: 40,)
    //     Container(
    //       decoration: BoxDecoration(
    //         color: Colors.white,
    //       ),
    //     )
    //   ],
    // ),
    // )
  }
}

import 'package:flutter/material.dart';

class edit_text extends StatelessWidget{
  String title ;
  edit_text(this.title);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 6,left: 20,right: 20),
          child: TextField(
            decoration: InputDecoration(
              hintText: title,
              hintStyle: TextStyle(fontSize: 18),
            ),
            onChanged: (text) {
              title = text;
            },
          ),
        )
      ],
    );
  }
}
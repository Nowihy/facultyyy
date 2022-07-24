import 'package:flutter/material.dart';

class place extends StatefulWidget {


  @override
  _placeState createState() => _placeState() ;
    // TODO: implement createState
  }

class _placeState extends State<place>{
  int _groupValue = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          Radio(value: 'El-Khalfawy',
              groupValue: _groupValue,
              onChanged: (value){
            setState((){
            });
              })
        ],
      ),
    );
  }

}
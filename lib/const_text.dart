import 'package:flutter/material.dart';

class ConstText extends StatelessWidget {
 late String word ;
 double top ;
 double bottom ;
 ConstText(this.word,this.top,this.bottom);
  @override
  Widget build(BuildContext context) {
    return Container(child:
          Container(
            margin: EdgeInsets.only(left: 30,bottom: bottom,top: top),
            child: Text(word,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),


    );
  }
}

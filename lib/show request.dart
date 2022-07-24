import 'package:flutter/material.dart';
import 'package:shubrafaculty/themeees.dart';

class showrequest extends StatelessWidget{
  static const String FacultyName = 'show request';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(46, 64, 83, 1),
        title: const Text('Shubra Faculty'),
      ),
      body:
      SingleChildScrollView(
      child : Container(
        color: Colors.white,
         child: Column(
           children: [
             Container(
               margin: EdgeInsets.only(left: 100 , right: 100),
               child: Image.asset('images/shubrafacultylogo.jpeg',fit:BoxFit.contain),
             ),
             Container(
                 margin: EdgeInsets.only(left: 40 ,right: 40,top: 75,bottom: 45),
                 decoration: ThemeHelper().buttonBoxDecoration(context),
                 child: ElevatedButton(
                   style: ThemeHelper().buttonStyle(),
                   child: Padding(
                     padding: EdgeInsets.fromLTRB(27, 10, 27, 10),
                     child: Text('New Request'.toUpperCase(),style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold ,color: Colors.white),),
                   ),
                   onPressed: (){},
                 ),
               ),
             Container(
               margin: EdgeInsets.only(left: 40,right: 40),
               decoration: ThemeHelper().buttonBoxDecoration(context),
               child: ElevatedButton(
                 style: ThemeHelper().buttonStyle(),
                 child: Padding(
                   padding: EdgeInsets.fromLTRB(27, 10, 27, 10),
                   child: Text('Show Requests'.toUpperCase(),style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold ,color: Colors.white),),
                 ),
                 onPressed: (){},
               ),
             ),
           ],
         ) ,
      ),
      )
    );
  }
}
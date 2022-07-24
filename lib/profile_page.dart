
import 'package:flutter/material.dart';
import 'package:shubrafaculty/const_text.dart';

class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('profile'),
      ),
      body: Column(
        children: [
          Expanded(child: ListView.builder(itemCount: 1,itemBuilder: (context,index){
            return Column(
              children: [

                    Container(
                      margin:  EdgeInsets.symmetric(vertical: 50),
                      child:  CircleAvatar(
                        radius: 100,
                        backgroundColor:Colors.white,
                        backgroundImage: AssetImage('images/onepiece.jpg')

                      ),


                ),
               Row(children: [
                 ConstText('Name :',20,20),
               ],) ,
                Row(
                  children: [
                    ConstText('ID :',20,20),
                  ],
                ),
                Row(
                  children: [
                    ConstText('E-mail :',20,20),
                  ],
                ),
              ],
            );
      }
      )
          )
        ],
      ),
    );
  }
}

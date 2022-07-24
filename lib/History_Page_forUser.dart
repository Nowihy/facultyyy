import 'package:flutter/material.dart';
import 'package:shubrafaculty/const_text.dart';

class HistoryPageUser extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('History'),
      ),
      body:
      Column(
        children: [
      Expanded(
          child:
          ListView.builder(itemCount: 3,
          itemBuilder: (context,index){
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      Container(
                          height:100,
                      child:
                      Image.asset('images/logo2.png',fit: BoxFit.contain,)
                      ),
                      Row(
                        children: [
                        ConstText('Request Number :',10,10),
                      ],
                      ) ,
                      Row(
                        children: [
                          ConstText('Address :',10,10),
                        ],
                      ) ,
                      Row(
                        children: [
                          ConstText('Floor :',10,10),
                        ],
                      ) ,
                      Row(
                        children: [
                          ConstText('Hall :',10,10),
                        ],
                      ) ,
                      Row(
                        children: [
                          ConstText('User-Email :',10,10),
                        ],
                      ) ,
                      Row(
                        children: [
                          ConstText('User-Name :',10,10),
                        ],
                      ) ,
                      Row(
                        children: [
                          ConstText('Time :',10,10),
                        ],
                      ) ,
                      Row(
                        children: [
                          ConstText('Statue :',10,10),
                        ],
                      ) ,

                    ],

                  ),
                )
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

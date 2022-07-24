import 'package:flutter/material.dart';
import 'package:shubrafaculty/radio_button.dart';
class MyChoice{
  String choice ;
  int index ;
  MyChoice({required this.choice,required this.index});
}
class RadioButton extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _RadioButtonState() ;
  }
  
}
class _RadioButtonState extends State<RadioButton>{
  String default_Choice = "" ;
  int default_index = 2 ;

  List<MyChoice> choices =[
    MyChoice(index :0 , choice:"El-Khalafawy",),
    MyChoice(index :1 , choice:"Rod El-farag"),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return(
    Column(
      children: [
        Wrap(
          children: [
            Container(
              child: Column(
                 children:
                 choices.map((data)=>RadioListTile(title: Text('${data.choice}',
                   style: TextStyle(fontSize: 20),),
                     value: data.index,
                     groupValue: default_index,
                     onChanged: (value){
                    setState((){
                      default_Choice = data.choice;
                      default_index =data.index ;
                    });
                  })).toList()

              ),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.all(14),)

      ],
    )
    );
  }
  
}
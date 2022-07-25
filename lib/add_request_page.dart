import 'package:flutter/material.dart';
import 'package:shubrafaculty/edit%20text.dart';
import 'package:shubrafaculty/problem%20types.dart';
import 'package:shubrafaculty/radio_button.dart';
import 'package:shubrafaculty/themeees.dart';

class AddRequest extends StatelessWidget {
  String id = '';

  String branch = '';

  String building = '';

  String floor = '';

  String room = '';

  String type = '';

  String description = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Request'),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          margin:
                              EdgeInsets.only(left: 10, top: 18, bottom: 22),
                          child: Text('which campus do you want to report ?',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          child: RadioButton(),
                        ),
                        Container(
                          child: edit_text('Building'),
                        ),
                        Container(
                          child: edit_text('Floor'),
                        ),
                        Container(
                          child: edit_text('Room'),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 18, top: 50, bottom: 50),
                              child: Text('choose the type of the problem',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 10, top: 50, bottom: 50),
                              child: ProblemTypes(),
                            ),
                          ],
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: 10, top: 50, bottom: 22),
                          child: Text('Write a description about problem',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(bottom: 6, left: 20, right: 20),
                          child: const TextField(
                            textInputAction: TextInputAction.newline,
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            maxLines: 5,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(0, 10, 20, 10),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.zero,
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(46, 64, 83, 1))),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.zero,
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(46, 64, 83, 1))),
                              hintText: 'Description',
                              hintStyle: TextStyle(fontSize: 30),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(40),
                          decoration:
                              ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                              style: ThemeHelper().buttonStyle(),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(27, 10, 27, 10),
                                child: Text(
                                  'Submit'.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              onPressed: () {
                                // AddProblemToFireStore(Problem(id: id, branch: branch, building: building, floor: floor, room: room, type: type, description: description));
                              }),
                        )
                      ],
                    );
                  }))
        ],
      ),
    );
  }
}
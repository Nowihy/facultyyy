import 'package:flutter/material.dart';
import 'package:shubrafaculty/Add_Problem_to_Firestore.dart';
import 'package:shubrafaculty/firestore_utils_for_problem.dart';
import 'package:shubrafaculty/radio_button.dart';
import 'package:shubrafaculty/themeees.dart';
import 'package:shubrafaculty/utils.dart';

class AddRequest extends StatefulWidget {
  @override
  State<AddRequest> createState() => _AddRequestState();
}

class _AddRequestState extends State<AddRequest> {
  String dropdownValue = 'AC conditioner';

  String default_Choice = "";
  int default_index = 2;

  List<MyChoice> choices = [
    MyChoice(
      index: 0,
      choice: "El-Khalafawy",
    ),
    MyChoice(index: 1, choice: "Rod El-farag"),
  ];

  //late String Id;
  late String Statue;
  late String Floor;

  //late String Label;
  late String Branch;
  late String Building;

  //late String Sender;
  late String Type;
  late String Hall;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Request'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 10, top: 18, bottom: 22),
                              child: Text(
                                  'which campus do you want to report ?',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Wrap(
                                    children: [
                                      Container(
                                        child: Column(
                                            children: choices
                                                .map((data) => RadioListTile(
                                                    title: Text(
                                                      '${data.choice}',
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                    value: data.index,
                                                    groupValue: default_index,
                                                    onChanged: (text) {
                                                      Branch = '$text';
                                                      setState(() {
                                                        default_Choice =
                                                            data.choice;
                                                        default_index =
                                                            data.index;
                                                      });
                                                    }))
                                                .toList()),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(14),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  bottom: 6, left: 20, right: 20),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Building',
                                  hintStyle: TextStyle(fontSize: 18),
                                ),
                                onChanged: (text) {
                                  Building = text;
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  bottom: 6, left: 20, right: 20),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Floor',
                                  hintStyle: TextStyle(fontSize: 18),
                                ),
                                onChanged: (text) {
                                  Floor = text;
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  bottom: 6, left: 20, right: 20),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Hall',
                                  hintStyle: TextStyle(fontSize: 18),
                                ),
                                onChanged: (text) {
                                  Hall = text;
                                },
                              ),
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
                                    child: DropdownButton<String>(
                                      hint: Text('Type'),
                                      value: dropdownValue,
                                      icon: const Icon(
                                          Icons.arrow_drop_down_outlined),
                                      style:
                                          const TextStyle(color: Colors.blue),
                                      underline: Container(
                                        height: 2,
                                        color: Colors.blue,
                                      ),
                                      onChanged: (String? newValue) {
                                        Type = '$newValue';
                                        setState(() {
                                          dropdownValue = newValue!;
                                        });
                                      },
                                      items: <String>[
                                        'AC conditioner',
                                        'Electricity',
                                        'Elevator',
                                        'plumbing',
                                        'Computer',
                                        'network',
                                        'printer',
                                        'metal works',
                                        'wood work'
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    )),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 10, top: 50, bottom: 22),
                              child: Text('Write a description about problem',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  bottom: 6, left: 20, right: 20),
                              child: TextField(
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
                                          color:
                                              Color.fromRGBO(46, 64, 83, 1))),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.zero,
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(46, 64, 83, 1))),
                                  hintText: 'Description',
                                  hintStyle: TextStyle(fontSize: 30),
                                ),
                                onChanged: (text) {
                                  Statue = text;
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(40),
                              decoration:
                                  ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(27, 10, 27, 10),
                                    child: Text(
                                      'Submit'.toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (formKey.currentState?.validate() ==
                                        true) {
                                      SendDataToFirestore();
                                    }
                                    // AddProblemToFireStore(Problem(id: id, branch: branch, building: building, floor: floor, room: room, type: type, description: description));
                                  }),
                            )
                          ],
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }

  void SendDataToFirestore() async {
    try {
      var result;
      AddProblemToFireStore(Problem(
              // Id: result.user!.uid,
              Statue: Statue,
              Floor: Floor,
              //Label: Label,
              Branch: Branch,
              Building: Building,
              //Sender: Sender,
              Type: Type,
              Hall: Hall))
          .then((value) {
        showMessage('your request has been submitted', context);
      });
    } catch (error) {
      showMessage('cannot send your request', context);
    }
  }
}

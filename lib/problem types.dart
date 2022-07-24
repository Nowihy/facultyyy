import 'package:flutter/material.dart';

class ProblemTypes extends StatefulWidget {
  const ProblemTypes({Key? key}) : super(key: key);

  @override
  State<ProblemTypes> createState() => _ProblemTypesState();
}

class _ProblemTypesState extends State<ProblemTypes> {
  String dropdownValue = 'AC conditioner';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text('Type'),
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down_outlined),
      style: const TextStyle(color: Colors.blue),
      underline: Container(
        height: 2,
        color: Colors.blue,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['AC conditioner','Electricity', 'Elevator', 'plumbing', 'Computer','network','printer','metal works','wood work']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

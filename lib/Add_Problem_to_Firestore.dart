import 'package:cloud_firestore/cloud_firestore.dart';

class Problem {
  static String collectionName = 'problems';

//String Id;
  String Statue;
  String Floor;

//String Label;
  String Branch;
  String Building;

//String Sender ;
  String Type;

  String Hall;

  Problem(
      {
      //required this.Id,
      required this.Statue,
      required this.Floor,
      //required this.Label,
      required this.Branch,
      required this.Building,
      //required this.Sender,
      required this.Type,
      required this.Hall});

  Problem.fromJson(Map<String, dynamic> json)
      : this(
          // Id: json['Id'] as String,
          Statue: json['Statue'] as String,
          Floor: json['Floor'] as String,
          //Label: json['Label'] as String,
          Branch: json['Branch'] as String,
          Building: json['Building'] as String,
          //Sender: json['Sender'] as String,
          Type: json['Type'] as String,
          Hall: json['Hall'] as String,
        );

  Map<String, dynamic> toJson() {
    return {
      //'Id': Id,
      'Statue': Statue,
      'Floor': Floor,
      //'Label': Label,
      'Branch': Branch,
      'Building': Building,
      //'Sender': Sender,
      'Type': Type,
      'Hall': Hall
    };
  }

  static CollectionReference<Problem> withConverter() {
    return FirebaseFirestore.instance
        .collection(collectionName)
        .withConverter<Problem>(
          fromFirestore: (snapshot, _) => Problem.fromJson(snapshot.data()!),
          toFirestore: (Problems, _) => Problems.toJson(),
        );
  }
}
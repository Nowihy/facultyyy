import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  static String collectionName = 'users';

  String Email;

  String Id;

  String Name;

  String Password;

  String Role;

  // String type ;
  // String description ;
  User({
    required this.Email,
    required this.Id,
    required this.Name,
    required this.Password,
    required this.Role,
    //required this.type,required this.description
  });

  User.fromJson(Map<String, dynamic> json)
      : this(
          Email: json['Email'] as String,
          Id: json['Id'] as String,
          Name: json['Name'] as String,
          Password: json['Password'] as String,
          Role: json['Role'] as String,
          // type: json['type'] as String,
          // description: json['desription'] as String
        );

  Map<String, dynamic> toJson() {
    return {
      'Email': Email,
      'Id': Id,
      'Name': Name,
      'Password': Password,
      'Role': Role,

      //'type' : type,
      //'description' : description
    };
  }

  static CollectionReference<User> withConverter() {
    return FirebaseFirestore.instance
        .collection(collectionName)
        .withConverter<User>(
          fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
          toFirestore: (Users, _) => Users.toJson(),
        );
  }
}

//import 'package:firebase_auth/firebase_auth.dart';
import 'package:shubrafaculty/Add_User_to_Firestore.dart';

Future<void> AddUserToFireStore(AddUser user) {
  return AddUser.withConverter().doc(user.Id).set(user);
}

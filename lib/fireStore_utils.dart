//import 'package:firebase_auth/firebase_auth.dart';
import 'package:shubrafaculty/Add_problem_to_Firestore.dart';

Future<void> AddUserToFireStore(User user) {
  return User.withConverter().doc(user.Id).set(user);
}

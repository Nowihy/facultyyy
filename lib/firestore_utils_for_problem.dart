import 'package:shubrafaculty/Add_Problem_to_Firestore.dart';

Future<void> AddProblemToFireStore(Problem user) {
  return Problem.withConverter().doc(user.Branch).set(user);
}

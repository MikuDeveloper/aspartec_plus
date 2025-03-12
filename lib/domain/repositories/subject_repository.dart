import '../models/subject.dart';

abstract class SubjectRepository {
  Future<List<Subject>> getSubjects();
  Future<void> joinSubject({required String subject});
  Future<void> leaveSubject({required String subject});
}
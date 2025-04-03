import '../models/aspartec_user.dart';
import '../models/subject.dart';

abstract class SubjectRepository {
  Future<List<Subject>> getSubjects();
  Future<List<Subject>> getAdvisorSubjects({required List<String> adviceTaught});
  Future<List<AspartecUser>> getAdvisorsBySubject({required String subjectId});
  Future<void> joinSubject({required String id});
  Future<void> leaveSubject({required String id});
}
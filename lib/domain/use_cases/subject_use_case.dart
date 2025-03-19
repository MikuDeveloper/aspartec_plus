import '../models/subject.dart';
import '../repositories/subject_repository.dart';

class SubjectUseCase {
  final SubjectRepository _subjectRepository;

  SubjectUseCase(this._subjectRepository);

  Future<List<Subject>> getSubjects() => _subjectRepository.getSubjects();
  Future<List<Subject>> getAdvisorSubjects({required List<String> adviceTaught}) 
    => _subjectRepository.getAdvisorSubjects(adviceTaught: adviceTaught);
  Future<void> joinSubject({required String id}) => _subjectRepository.joinSubject(id: id);
  Future<void> leaveSubject({required String id}) => _subjectRepository.leaveSubject(id: id);
}
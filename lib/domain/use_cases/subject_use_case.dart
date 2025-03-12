import '../models/subject.dart';
import '../repositories/subject_repository.dart';

class SubjectUseCase {
  final SubjectRepository _subjectRepository;

  SubjectUseCase(this._subjectRepository);

  Future<List<Subject>> getSubjects() => _subjectRepository.getSubjects();
  Future<void> joinSubject({required String subject}) => _subjectRepository.joinSubject(subject: subject);
  Future<void> leaveSubject({required String subject}) => _subjectRepository.leaveSubject(subject: subject);
}
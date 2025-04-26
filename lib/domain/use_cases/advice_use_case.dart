import 'dart:typed_data' show Uint8List;

import 'package:aspartec_plus/app/global/enums.dart' show AdviceStatus, Role;

import '../models/advice.dart';
import '../repositories/advice_repository.dart';

class AdviceUseCase {
  final AdviceRepository _adviceRepository;

  AdviceUseCase(this._adviceRepository);

  Future<void> createAdvice({ required String subject, required String topic, required String advisorId, required String studentMajor }) 
    => _adviceRepository.createAdvice(subject: subject, topic: topic, advisorId: advisorId, studentMajor: studentMajor);

  Future<List<Advice>> getAdvice({required Role role, required AdviceStatus status})
    => _adviceRepository.getAdvice(role: role, status: status);
    
  Future<void> closeAdvice({required String id, required double rating, required Uint8List evidence })
    => _adviceRepository.closeAdvice(id: id, rating: rating, evidence: evidence);
  Future<void> skipAdvice({required String id}) => _adviceRepository.skipAdvice(id: id);

  Future<void> cancelAdvice({required String id}) => _adviceRepository.cancelAdvice(id: id);
  Future<void> ratingAdvisor({required String id, required double rating}) => _adviceRepository.ratingAdvisor(id: id, rating: rating);
}
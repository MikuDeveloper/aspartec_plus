import 'dart:typed_data' show Uint8List;

import 'package:aspartec_plus/app/global/values.dart' show AdviceStatus, Role;

import '../models/advice.dart';
import '../repositories/advice_repository.dart';

class AdviceUseCase {
  final AdviceRepository _adviceRepository;

  AdviceUseCase(this._adviceRepository);

  Future<List<Advice>> getAdvice({required Role role, required AdviceStatus status})
    => _adviceRepository.getAdvice(role: role, status: status);
    
  Future<void> closeAdvice({required String id, required bool rating, required Uint8List evidence })
    => _adviceRepository.closeAdvice(id: id, rating: rating, evidence: evidence);
  Future<void> skipAdvice({required String id}) => _adviceRepository.skipAdvice(id: id);

  Future<void> cancelAdvice({required String id}) => _adviceRepository.cancelAdvice(id: id);
}
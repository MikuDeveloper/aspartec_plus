import 'dart:typed_data' show Uint8List;

import 'package:aspartec_plus/app/global/enums.dart' show Role, AdviceStatus;

import '../models/advice.dart';

abstract class AdviceRepository {
  Future<void> createAdvice({ required String subject, required String topic, required String advisorId });
  Future<List<Advice>> getAdvice({required Role role, required AdviceStatus status});

  Future<void> closeAdvice({required String id, required bool rating, required Uint8List evidence });
  Future<void> skipAdvice({required String id});

  Future<void> cancelAdvice({required String id});
}
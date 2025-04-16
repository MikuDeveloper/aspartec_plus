import 'dart:typed_data' show Uint8List;

import 'package:flutter/material.dart' show Colors, StepStyle;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentStepProvider = StateProvider.autoDispose<int>((ref) => 0);
final evidenceProvider = StateProvider.autoDispose<Uint8List?>((ref) => null);
final ratingProvider = StateProvider.autoDispose<double>((ref) => 0.0);
final stepStyleProvider = Provider((ref) => StepStyle(
  color: Colors.pink,
  connectorColor: Colors.pinkAccent
));
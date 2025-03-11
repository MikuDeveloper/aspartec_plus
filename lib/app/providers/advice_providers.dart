import 'package:flutter_riverpod/flutter_riverpod.dart';

final advisorOpenedAdviceProvider = FutureProvider((ref) async => await Future.delayed(const Duration(seconds: 2)));
final advisorCompletedAdviceProvider = FutureProvider((ref) async => await Future.delayed(const Duration(seconds: 2)));
final advisorCanceledAdviceProvider = FutureProvider((ref) async => await Future.delayed(const Duration(seconds: 2)));
final advisorForRatingAdviceProvider = FutureProvider((ref) async => await Future.delayed(const Duration(seconds: 2)));

final studentOpenedAdviceProvider = FutureProvider((ref) => Future.delayed(const Duration(seconds:  1)));
final studentCompletedAdviceProvider = FutureProvider((ref) => Future.delayed(const Duration(seconds:  1)));
final studentCanceledAdviceProvider = FutureProvider((ref) => Future.delayed(const Duration(seconds:  1)));
final studentForRatingAdviceProvider = FutureProvider((ref) => Future.delayed(const Duration(seconds:  1)));
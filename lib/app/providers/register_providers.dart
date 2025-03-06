import 'package:flutter/material.dart' show Icon, Icons, Colors;
import 'package:flutter_riverpod/flutter_riverpod.dart' show StateProvider;

import '../global/values.dart' show Role;

final selectedRoleProvider = StateProvider.autoDispose<Role?>((ref) => null);
final stepProvider = StateProvider.autoDispose<int>((ref) => 0);

final selectedGenderProvider = StateProvider.autoDispose<String?>((ref) => null);
final genderIconProvider = StateProvider.autoDispose<Icon>(
  (ref) => switch(ref.watch(selectedGenderProvider)) {
    'Hombre' => const Icon(Icons.male_rounded, color: Colors.blueAccent),
    'Mujer' => const Icon(Icons.female_rounded, color: Colors.pinkAccent),
    'No binario' => const Icon(Icons.transgender_rounded, color: Colors.amberAccent),
    _ => const Icon(Icons.question_mark_rounded, color: Colors.blueGrey)
  }
);
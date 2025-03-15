import 'package:flutter/material.dart' show DropdownMenuItem, Text;
import 'package:flutter_riverpod/flutter_riverpod.dart' show Provider;
import 'package:reactive_forms/reactive_forms.dart' show FormGroup, FormControl, Validators;

import '../global/values.dart' show formattedPhoneNumberRegex, genders, majors, passwordRegex;

final loginFormProvider = Provider.autoDispose(
  (ref) => FormGroup({
    'email': FormControl<String>(value: '', validators: [Validators.required, Validators.email]),
    'password': FormControl<String>(value: '', validators: [Validators.required])
  })
);

final forgotPasswordFormProvider = Provider.autoDispose(
  (ref) => FormGroup({
    'recoveryEmail': FormControl<String>(
      value: '',
      validators: [Validators.required, Validators.email]
    )
  })
);

final personalDataFormProvider = Provider.autoDispose(
  (ref) => FormGroup({
    'firstname': FormControl<String>(value: '', validators: [Validators.required]),
    'lastname1': FormControl<String>(value: '', validators: [Validators.required]),
    'lastname2': FormControl<String>(value: ''),
    'gender': FormControl<String>(value: '', validators: [Validators.required]),
    'phoneNumber': FormControl<String>(value: '', validators: [
      Validators.required,
      Validators.pattern(formattedPhoneNumberRegex)
    ])
  })
);

final schoolDataFormProvider = Provider.autoDispose(
  (ref) => FormGroup({
    'major': FormControl<String>(value: '', validators: [Validators.required]),
    'controlNumber': FormControl<String>(value: '', validators: [Validators.required])
  })
);

final credentialsFormProvider = Provider.autoDispose(
  (ref) => FormGroup({
    'email': FormControl<String>(value: '', validators: [Validators.required, Validators.email]),
    'password': FormControl<String>(value: '', validators: [
      Validators.required,
      Validators.pattern(passwordRegex)
    ])
  })
);

final genderEntriesProvider = Provider.autoDispose(
  (ref) => genders.map(
    (gender) => DropdownMenuItem(
      value: gender,
      child: Text(gender)
    )
  ).toList()
);

final majorEntriesProvider = Provider.autoDispose(
  (ref) => majors.map(
    (major) => DropdownMenuItem(value: major, child: Text(major))
  ).toList()
);
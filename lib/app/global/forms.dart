import 'package:reactive_forms/reactive_forms.dart' show FormControl, FormGroup, Validators;

import 'values.dart' show passwordRegex, formattedPhoneNumberRegex;

final loginForm = FormGroup({
  'email': FormControl<String>(value: '', validators: [Validators.required, Validators.email]),
  'password': FormControl<String>(value: '', validators: [Validators.required])
});

final forgotPasswordForm = FormGroup({
  'forgotEmail': FormControl<String>(
    value: '',
    validators: [Validators.required, Validators.email]
  )
});

final personalDataForm = FormGroup({
  'firstname': FormControl<String>(value: '', validators: [Validators.required]),
  'lastname1': FormControl<String>(value: '', validators: [Validators.required]),
  'lastname2': FormControl<String>(value: '', validators: [Validators.required]),
  'gender': FormControl<String>(value: '', validators: [Validators.required]),
  'phoneNumber': FormControl<String>(value: '', validators: [
    Validators.required,
    Validators.pattern(formattedPhoneNumberRegex)
  ])
});

final schoolDataForm = FormGroup({
  'major': FormControl<String>(value: '', validators: [Validators.required]),
  'controlNumber': FormControl<String>(value: '', validators: [Validators.required])
});

final credentialsForm = FormGroup({
  'email': FormControl<String>(value: '', validators: [Validators.required, Validators.email]),
  'password': FormControl<String>(value: '', validators: [
    Validators.required,
    Validators.pattern(passwordRegex)
  ])
});
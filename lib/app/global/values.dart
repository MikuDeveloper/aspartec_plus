const double defaultPadding = 16.0;

final Set<String> genders = {
  'Hombre', 'Mujer', 'No binario', 'Otro'
};

final Set<String> majors = {
  'Ingeniería en Sistemas Computacionales',
  'Ingeniería en Tecnologías de la Información',
  'Ingeniería Mecatrónica',
  'Ingeniería Industrial',
  'Ingeniería en Gestión Empresarial',
  'Ingeniería Bioquímica',
  'Ingeniería en Nanotecnología'
};

final formattedPhoneNumberRegex = RegExp(r'^\(\d{3}\)\s?\d{3}\-\d{4}$');
final plainPhoneNumberRegex = RegExp(r'[^0-9]');
final passwordRegex = RegExp(
  r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*()\_+\-=?.,;:/{}<>\[\]~\S])(?!.*[^A-Za-z0-9!@#$%^&*()\_+\-=?.,;:/{}<>\[\]~]).{6,}$'
);

String setPhoneNumberFormat(String phoneNumber) {
  String cleanedNumber = phoneNumber.replaceAll(plainPhoneNumberRegex, '');
  if (cleanedNumber.length == 10) {
    return '(${cleanedNumber.substring(0, 3)}) ${cleanedNumber.substring(3, 6)}-${cleanedNumber.substring(6, 10)}';
  } else {
    return phoneNumber;
  }
}
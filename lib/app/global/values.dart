const double defaultPadding = 16.0;

enum Role { asesor, estudiante }

enum AdviceStatus {
  opened, completed, canceled, forRating
}

enum UserStatus { active, inactive }

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

String getStatus(AdviceStatus status) => switch(status) {
  AdviceStatus.opened => 'Abierta',
  AdviceStatus.canceled => 'Cancelada',
  AdviceStatus.completed => 'Completada',
  AdviceStatus.forRating => 'Por evaluar'
};

AdviceStatus setStatus(dynamic str) => switch(str) {
  'Abierta' => AdviceStatus.opened,
  'Completada' => AdviceStatus.completed,
  'Por evaluar' => AdviceStatus.forRating,
  _ => AdviceStatus.canceled,
};
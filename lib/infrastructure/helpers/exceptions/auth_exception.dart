class AuthException implements Exception {
  final String code;

  AuthException({required this.code});

  @override
  String toString() => switch(code) {
    'expired-session' => 'Sesión expirada, vuelva a iniciar sesión',
    'network-request-failed' => 'Sin conexión a internet.',
    'invalid-credential' => 'Correo o contraseña incorrectos.',
    'user-not-found' => 'Correo o contraseña incorrectos.',
    'wrong-password' => 'Correo o contraseña incorrectos.',
    'user-disabled' => 'Este usuario ha sido deshabilitado.',
    'too-many-requests' => 'Demasiados solicitudes, intente de nuevo en unos minutos.',
    'email-already-in-use' => 'Este correo electrónico ya se encuentra registrado.',
    _ => 'Error inesperado: $code.'
  };
}
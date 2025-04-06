class DatabaseException implements Exception {
  final String code;

  DatabaseException({required this.code});

  @override
  String toString() => switch(code) {
    'advice-already-exists' => 'Ya hay una asesoría abierta con el mismo asesor y la misma materia.',
    'not-found' => 'No se encuentra la información solicitada.',
    'invalid-argument' => 'Se ha especificado un argumento inválido en la solicitud.',
    'already-exists' => 'Ya existe un documento con el ID proporcionado.',
    'permission-denied' => 'No tiene permiso para acceder a esta información.',
    'deadline-exceeded' => 'Se excedió el tiempo de espera de la solicitud.',
    'unavailable' => 'El servicio no se encuentra disponible.',
    'resource-exhausted' => 'Cuota excedida. Contacte con el administrador del sistema.',
    'cancelled' => 'La solicitud ha sido cancelada.',
    'unimplemented' => 'Operación no implementada o soportada.',
    'out-of-range' => 'La operación se implementó fuera de un rango permitido',
    _ => 'Error inesperado: $code.'
  };
}
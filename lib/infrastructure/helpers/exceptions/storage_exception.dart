class StorageException implements Exception {
  final String code;

  StorageException({required this.code});

  @override
  String toString() => switch(code) {
    'object-not-found' => 'No existe el archivo especificado.',
    'bucket-not-found' => 'No se encuentra ninguna implementación de almacenamiento.',
    'project-not-found' => 'La aplicación no se encuentra configurada con Storage.',
    'quota-exceeded' => 'Se superó la cuota de almacenamiento. Contacte con el administrador del sistema.',
    'unauthenticated' => 'Usuario no auntenticado.',
    'unauthorized' => 'No tienes permiso para realizar la acción especificada.',
    'retry-limit-exceeded' => 'Tiempo de espera excedido.',
    'invalid-checksum' => 'Discrepancia de archivos, vuelve a intentarlo luego de actualizar el archivo.',
    'cannot-slice-blob' => 'Discrepancia de archivos, vuelve a intentarlo luego de actualizar el archivo.',
    'server-file-wrong-size' => 'Discrepancia de archivos, vuelve a intentarlo luego de actualizar el archivo.',
    'canceled' => 'Operación cancelada por el usuario',
    'invalid-event-name' => 'Se proporcionó un evento inválido.',
    'invalid-url' => 'Se proporcionó una URL inválida.',
    'invalid-argument' => 'Se proporcionó un argumento inválido.',
    'no-default-bucket' => 'No se encontró la ruta predefinida de almacenamiento.',
    _ => 'Error inesperado: $code.'
  };
}
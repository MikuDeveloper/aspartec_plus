enum Role {
  advisor('Asesor'),
  student('Estudiante');

  final String displayName;

  const Role(this.displayName);

  static Role fromDisplayName(String displayName) {
    return Role.values.firstWhere(
      (role) => role.displayName == displayName,
      orElse: () => Role.student,
    );
  }
}

enum AdviceStatus {
  opened('Abierta'),
  completed('Completada'),
  canceled('Cancelada'), 
  forRating('Por evaluar');

  final String displayName;

  const AdviceStatus(this.displayName);

  static AdviceStatus fromDisplayName(String displayName) {
    return AdviceStatus.values.firstWhere(
      (role) => role.displayName == displayName,
      orElse: () => AdviceStatus.canceled,
    );
  }
}

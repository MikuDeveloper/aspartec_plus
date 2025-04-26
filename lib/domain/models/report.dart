class Report {
  final DateTime _date;
  final double _averageRaiting;
  final int _adviceCount;
  final int _completedAdvice;
  final int _canceledAdvice;
  final int _adviceBySistemas;
  final int _adviceByTics;
  final int _adviceByMecatronica;
  final int _adviceByIndustrial;
  final int _adviceByGestion;
  final int _adviceByBioquimica;
  final int _adviceByNano;

  DateTime get date => _date;
  double get averageRaiting => _averageRaiting;
  int get adviceCount => _adviceCount;
  int get completedAdvice => _completedAdvice;
  int get canceledAdvice => _canceledAdvice;
  int get adviceBySistemas => _adviceBySistemas;
  int get adviceByTics => _adviceByTics;
  int get adviceByMecatronica => _adviceByMecatronica;
  int get adviceByIndustrial => _adviceByIndustrial;
  int get adviceByGestion => _adviceByGestion;
  int get adviceByBioquimica => _adviceByBioquimica;
  int get adviceByNano => _adviceByNano;

  Report({
    required DateTime date,
    required double averageRaiting,
    required int adviceCount,
    required int completedAdvice,
    required int canceledAdvice,
    required int adviceBySistemas,
    required int adviceByTics,
    required int adviceByMecatronica,
    required int adviceByIndustrial,
    required int adviceByGestion,
    required int adviceByBioquimica,
    required int adviceByNano,
  }) : 
    _date = date,
    _averageRaiting = averageRaiting,
    _adviceCount = adviceCount,
    _completedAdvice = completedAdvice,
    _canceledAdvice = canceledAdvice,
    _adviceBySistemas = adviceBySistemas,
    _adviceByTics = adviceByTics,
    _adviceByMecatronica = adviceByMecatronica,
    _adviceByIndustrial = adviceByIndustrial,
    _adviceByGestion = adviceByGestion,
    _adviceByBioquimica = adviceByBioquimica,
    _adviceByNano = adviceByNano;
        
  Report copyWith({
    DateTime? date,
    double? averageRaiting,
    int? adviceCount,
    int? completedAdvice,
    int? canceledAdvice,
    int? adviceBySistemas,
    int? adviceByTics,
    int? adviceByMecatronica,
    int? adviceByIndustrial,
    int? adviceByGestion,
    int? adviceByBioquimica,
    int? adviceByNano,
  }) =>
  Report(
    date: date ?? _date,
    averageRaiting: averageRaiting ?? _averageRaiting,
    adviceCount: adviceCount ?? _adviceCount,
    completedAdvice: completedAdvice ?? _completedAdvice,
    canceledAdvice: canceledAdvice ?? _canceledAdvice,
    adviceBySistemas: adviceBySistemas ?? _adviceBySistemas,
    adviceByTics: adviceByTics ?? _adviceByTics,
    adviceByMecatronica: adviceByMecatronica ?? _adviceByMecatronica,
    adviceByIndustrial: adviceByIndustrial ?? _adviceByIndustrial,
    adviceByGestion: adviceByGestion ?? _adviceByGestion,
    adviceByBioquimica: adviceByBioquimica ?? _adviceByBioquimica,
    adviceByNano: adviceByNano ?? _adviceByNano,
  );
}
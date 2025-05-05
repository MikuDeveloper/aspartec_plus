import 'package:intl/intl.dart';

import 'aspartec_user.dart';

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

  factory Report.fromJson(Map<String, dynamic> json) => Report(
      date: json['date'] ?? DateTime.now(),
      averageRaiting: json['averageRaiting'] ?? 0.0,
      adviceCount: json['adviceCount'] ?? 0,
      completedAdvice: json['completedAdvice'] ?? 0,
      canceledAdvice: json['canceledAdvice'] ?? 0,
      adviceBySistemas: json['adviceBySistemas'] ?? 0,
      adviceByTics: json['adviceByTics'] ?? 0,
      adviceByMecatronica: json['adviceByMecatronica'] ?? 0,
      adviceByIndustrial: json['adviceByIndustrial'] ?? 0,
      adviceByGestion: json['adviceByGestion'] ?? 0,
      adviceByBioquimica: json['adviceByBioquimica'] ?? 0,
      adviceByNano: json['adviceByNano'] ?? 0
    );

  Map<String, dynamic> toJsonForm(AspartecUser user, List<String> advisorSubjects) {
    final map = <String, dynamic>{};
    map['advisor'] = '${user.firstname} ${user.lastname1} ${user.lastname2}'.trim();
    map['date'] = DateFormat('dd/MMMM/yyyy', 'es').format(_date);
    map['controlNumber'] = user.controlNumber;
    map['major'] = user.major;
    map['averageRating'] = _averageRaiting.toStringAsFixed(1);
    map['subjects'] = '${advisorSubjects.join(', ')}.';
    map['adviceCount'] = _adviceCount.toString();
    map['completedAdvice'] = _completedAdvice.toString();
    map['canceledAdvice'] = _canceledAdvice.toString();
    map['bySistemas'] = _adviceBySistemas.toString();
    map['byTics'] = _adviceByTics.toString();
    map['byMeca'] = _adviceByMecatronica.toString();
    map['byIndustrial'] = _adviceByIndustrial.toString();
    map['byGestion'] = _adviceByGestion.toString();
    map['byBioquimica'] = _adviceByBioquimica.toString();
    map['byNano'] = _adviceByNano.toString();
    return map;
  }
        
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
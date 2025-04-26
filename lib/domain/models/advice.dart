import 'package:aspartec_plus/app/global/enums.dart' show AdviceStatus;

class Advice {
  final String _id;
  final String _subject;
  final String _topic;
  final AdviceStatus _status;
  final String _advisorId;
  final String _studentId;
  final String _studentMajor;
  final dynamic _startDate;
  final dynamic _endDate;
  final double _advisorRating;
  final double _studentRating;
  final String _evidencePath;

  String get id => _id;
  String get subject => _subject;
  String get topic => _topic;
  AdviceStatus get status => _status;
  String get advisorId => _advisorId;
  String get studentId => _studentId;
  String get studentMajor => _studentMajor;
  dynamic get startDate => _startDate;
  dynamic get endDate => _endDate;
  double get advisorRating => _advisorRating;
  double get studentRating => _studentRating;
  String get evidencePath => _evidencePath;

  Advice({
    required String id,
    required String subject,
    required String topic,
    required AdviceStatus status,
    required String advisorId,
    required String studentId,
    required String studentMajor,
    required dynamic startDate,
    required dynamic endDate,
    required double advisorRating,
    required double studentRating,
    required String evidencePath
  }) :
  _id = id,
  _subject = subject,
  _topic = topic,
  _status = status,
  _advisorId = advisorId,
  _studentId = studentId,
  _studentMajor = studentMajor,
  _startDate = startDate,
  _endDate = endDate,
  _advisorRating = advisorRating,
  _studentRating = studentRating,
  _evidencePath = evidencePath;

  Advice copyWith({
    String? id,
    String? subject,
    String? topic,
    AdviceStatus? status,
    String? advisorId,
    String? studentId,
    String? studentMajor,
    dynamic startDate,
    dynamic endDate,
    double? advisorRating,
    double? studentRating,
    String? evidencePath
  }) =>
  Advice(
    id: id ?? _id,
    subject: subject ?? _subject,
    topic: topic ?? _topic,
    status: status ?? _status,
    advisorId: advisorId ?? _advisorId,
    studentId: studentId ?? _studentId,
    studentMajor: studentMajor ?? _studentMajor,
    startDate: startDate ?? _startDate,
    endDate: endDate ?? _endDate,
    advisorRating: advisorRating ?? _advisorRating,
    studentRating: studentRating ?? _studentRating,
    evidencePath: evidencePath ?? _evidencePath
  );

  factory Advice.fromJson(Map<String, dynamic> json) => Advice(
    id: json['id'] ?? '',
    subject: json['subject'] ?? '',
    topic: json['topic'] ?? '',
    status: AdviceStatus.fromDisplayName(json['status'] ?? 'none'),
    advisorId: json['advisorId'] ?? '',
    studentId: json['studentId'] ?? '',
    studentMajor: json['studentMajor'] ?? '',
    startDate: json['startDate'],
    endDate: json['endDate'],
    advisorRating: (json['advisorRating'] ?? 0.0).toDouble(),
    studentRating: (json['studentRating'] ?? 0.0).toDouble(),
    evidencePath: json['evidencePath'] ?? ''
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['subject'] = _subject;
    map['topic'] = _topic;
    map['status'] = _status.displayName;
    map['advisorId'] = _advisorId;
    map['studentId'] = _studentId;
    map['studentMajor'] = _studentMajor;
    map['startDate'] = _startDate;
    map['endDate'] = _endDate;
    map['advisorRating'] = _advisorRating;
    map['studentRating'] = _studentRating;
    map['evidencePath'] = _evidencePath;
    return map;
  }
}
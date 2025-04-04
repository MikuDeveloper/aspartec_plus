import 'package:aspartec_plus/app/global/enums.dart' show AdviceStatus;

class Advice {
  final String _id;
  final String _subject;
  final String _topic;
  final AdviceStatus _status;
  final String _advisorId;
  final String _studentId;
  final String _startDate;
  final String _endDate;
  final double _advisorRating;
  final double _studentRating;
  final String _evidenceUrl;

  String get id => _id;
  String get subject => _subject;
  String get topic => _topic;
  AdviceStatus get status => _status;
  String get advisorId => _advisorId;
  String get studentId => _studentId;
  String get startDate => _startDate;
  String get endDate => _endDate;
  double get advisorRating => _advisorRating;
  double get studentRating => _studentRating;
  String get evidenceUrl => _evidenceUrl;

  Advice({
    required String id,
    required String subject,
    required String topic,
    required AdviceStatus status,
    required String advisorId,
    required String studentId,
    required String startDate,
    required String endDate,
    required double advisorRating,
    required double studentRating,
    required String evidenceUrl
  }) :
  _id = id,
  _subject = subject,
  _topic = topic,
  _status = status,
  _advisorId = advisorId,
  _studentId = studentId,
  _startDate = startDate,
  _endDate = endDate,
  _advisorRating = advisorRating,
  _studentRating = studentRating,
  _evidenceUrl = evidenceUrl;

  Advice copyWith({
    String? id,
    String? subject,
    String? topic,
    AdviceStatus? status,
    String? advisorId,
    String? studentId,
    String? startDate,
    String? endDate,
    double? advisorRating,
    double? studentRating,
    String? evidenceUrl
  }) =>
  Advice(
    id: id ?? _id,
    subject: subject ?? _subject,
    topic: topic ?? _topic,
    status: status ?? _status,
    advisorId: advisorId ?? _advisorId,
    studentId: studentId ?? _studentId,
    startDate: startDate ?? _startDate,
    endDate: endDate ?? _endDate,
    advisorRating: advisorRating ?? _advisorRating,
    studentRating: studentRating ?? _studentRating,
    evidenceUrl: evidenceUrl ?? _evidenceUrl
  );

  factory Advice.fromJson(Map<String, dynamic> json) => Advice(
    id: json['id'] ?? '',
    subject: json['subject'] ?? '',
    topic: json['topic'] ?? '',
    status: AdviceStatus.fromDisplayName(json['status'] ?? 'none'),
    advisorId: json['advisorId'] ?? '',
    studentId: json['studentId'] ?? '',
    startDate: json['startDate'] ?? DateTime.now().toIso8601String(),
    endDate: json['endDate'] ?? DateTime.now().toIso8601String(),
    advisorRating: json['advisorRating'] ?? 0.0,
    studentRating: json['studentRating'] ?? 0.0,
    evidenceUrl: json['evidenceUrl'] ?? ''
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['subject'] = _subject;
    map['topic'] = _topic;
    map['status'] = _status.displayName;
    map['advisorId'] = _advisorId;
    map['studentId'] = _studentId;
    map['startDate'] = _startDate;
    map['endDate'] = _startDate;
    map['advisorRating'] = _advisorRating;
    map['studentRating'] = _studentRating;
    map['evidenceUrl'] = _evidenceUrl;
    return map;
  }
}
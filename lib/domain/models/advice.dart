import 'package:aspartec_plus/app/global/enums.dart' show AdviceStatus;
import 'package:cloud_firestore/cloud_firestore.dart' show Timestamp;

class Advice {
  final String _id;
  final String _subject;
  final String _topic;
  final AdviceStatus _status;
  final String _advisorId;
  final String _studentId;
  final DateTime _startDate;
  final DateTime _endDate;
  final double _advisorRating;
  final double _studentRating;
  final String _evidenceUrl;

  String get id => _id;
  String get subject => _subject;
  String get topic => _topic;
  AdviceStatus get status => _status;
  String get advisorId => _advisorId;
  String get studentId => _studentId;
  DateTime get startDate => _startDate;
  DateTime get endDate => _endDate;
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
    required DateTime startDate,
    required DateTime endDate,
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
    DateTime? startDate,
    DateTime? endDate,
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
    id: json.containsKey('id') ? json['id'] : '',
    subject: json.containsKey('subject') ? json['subject'] : '',
    topic: json.containsKey('topic') ? json['topic'] : '',
    status: json.containsKey('status') ? AdviceStatus.fromDisplayName(json['status']) : AdviceStatus.canceled,
    advisorId: json.containsKey('advisorId') ? json['advisorId'] : '',
    studentId: json.containsKey('studentId') ? json['studentId'] : '',
    startDate: json.containsKey('startDate') ? (json['startDate'] as Timestamp).toDate() : DateTime.now(),
    endDate: json.containsKey('endDate') ? (json['endDate'] as Timestamp).toDate() : DateTime.now(),
    advisorRating: json.containsKey('advisorRating') ? json['advisorRating'] : 0.0,
    studentRating: json.containsKey('studentRating') ? json['studentRating'] : 0.0,
    evidenceUrl: json.containsKey('evidenceUrl') ? json['evidenceUrl'] : ''
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['subject'] = _subject;
    map['topic'] = _topic;
    map['status'] = _status.displayName;
    map['advisorId'] = _advisorId;
    map['studentId'] = _studentId;
    map['startDate'] = Timestamp.fromDate(_startDate);
    map['endDate'] = Timestamp.fromDate(_startDate);
    map['advisorRating'] = _advisorRating;
    map['studentRating'] = _studentRating;
    map['evidenceUrl'] = _evidenceUrl;
    return map;
  }
}
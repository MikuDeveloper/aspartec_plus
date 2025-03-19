import 'package:aspartec_plus/app/global/enums.dart' show Role;

class AspartecUser {
  final Role _role;
  final String _controlNumber;
  final String _major;
  final String _firstname;
  final String _lastname1;
  final String _lastname2;
  final String _gender;
  final String _phoneNumber;
  final String _avatarUrl;
  final List<String> _adviceTaught;
  final bool _enabled;

  Role get role => _role;
  String get controlNumber => _controlNumber;
  String get major => _major;
  String get firstname => _firstname;
  String get lastname1 => _lastname1;
  String get lastname2 => _lastname2;
  String get gender => _gender;
  String get phoneNumber => _phoneNumber;
  String get avatarUrl => _avatarUrl;
  List<String> get adviceTaught => _adviceTaught;
  bool get enabled => _enabled;

  AspartecUser({
    required Role role,
    required String controlNumber,
    required String major,
    required String firstname,
    required String lastname1,
    required String lastname2,
    required String gender,
    required String phoneNumber,
    required String avatarUrl,
    required List<String> adviceTaught,
    required bool enabled
  }) :
  _role = role,
  _controlNumber = controlNumber,
  _major = major,
  _firstname = firstname,
  _lastname1 = lastname1,
  _lastname2 = lastname2,
  _gender = gender,
  _phoneNumber = phoneNumber,
  _avatarUrl = avatarUrl,
  _adviceTaught = adviceTaught,
  _enabled = enabled;

  AspartecUser copyWith({
    Role? role,
    String? controlNumber,
    String? major,
    String? firstname,
    String? lastname1,
    String? lastname2,
    String? gender,
    String? phoneNumber,
    String? avatarUrl,
    List<String>? adviceTaught,
    bool? enabled
  }) =>
  AspartecUser(
    role: role ?? _role,
    controlNumber: controlNumber ?? _controlNumber,
    major: major ?? _major,
    firstname: firstname ?? _firstname,
    lastname1: lastname1 ?? _lastname1,
    lastname2: lastname2 ?? _lastname2,
    gender: gender ?? _gender,
    phoneNumber: phoneNumber ?? _phoneNumber,
    avatarUrl: avatarUrl ?? _avatarUrl,
    adviceTaught: adviceTaught ?? _adviceTaught,
    enabled: enabled ?? _enabled
  );

  factory AspartecUser.fromJson(Map<String, dynamic> json) => AspartecUser(
    role: Role.fromDisplayName(json['role']),
    controlNumber: json.containsKey('controlNumber') ? json['controlNumber'] : '',
    major: json.containsKey('major') ? json['major'] : '',
    firstname: json.containsKey('firstname') ? json['firstname'] : '',
    lastname1: json.containsKey('lastname1') ? json['lastname1'] : '',
    lastname2: json.containsKey('lastname2') ? json['lastname2'] : '',
    gender: json.containsKey('gender') ? json['gender'] : '',
    phoneNumber: json.containsKey('phoneNumber') ? json['phoneNumber'] : '',
    avatarUrl: json.containsKey('avatarUrl') ? json['avatarUrl'] : '',
    adviceTaught: json.containsKey('adviceTaught') ? List<String>.from(json['adviceTaught']) : [],
    enabled: json.containsKey('enabled') ? json['enabled'] : false
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['role'] = _role.displayName;
    map['controlNumber'] = _controlNumber;
    map['major'] = _major;
    map['firstname'] = _firstname;
    map['lastname1'] = _lastname1;
    map['lastname2'] = _lastname2;
    map['gender'] = _gender;
    map['phoneNumber'] = _phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');
    map['avatarUrl'] = _avatarUrl;
    map['adviceTaught'] = _adviceTaught;
    map['enabled'] = _enabled;
    return map;
  }
}
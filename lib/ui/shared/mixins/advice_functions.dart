import 'package:aspartec_plus/domain/models/aspartec_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart' show Timestamp;
import 'package:intl/intl.dart' show DateFormat;

mixin AdviceFunctions {
  String getDateFormatted(dynamic date) {
    final dateTime = (date as Timestamp).toDate().toLocal();
    final dateFormat = DateFormat('dd/MMMM/yyyy\nhh:mm a', 'es').format(dateTime);
    return dateFormat.toLowerCase();
  }

  String getUsername(AspartecUser user) {
    final username = '${user.firstname} ${user.lastname1} ${user.lastname2}'.trim();
    return username;
  }

  String getDate(DateTime date) {
    final dateFormat = DateFormat('MMMM_yyyy', 'es').format(date);
    return dateFormat;
  }
}
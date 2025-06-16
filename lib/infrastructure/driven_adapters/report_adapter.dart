import 'package:aspartec_plus/app/global/enums.dart';
import 'package:aspartec_plus/app/global/values.dart' show months;
import 'package:aspartec_plus/domain/models/advice.dart';
import 'package:aspartec_plus/domain/models/report.dart';
import 'package:aspartec_plus/domain/repositories/report_repository.dart';
import 'package:aspartec_plus/infrastructure/helpers/constants.dart';
import 'package:aspartec_plus/infrastructure/helpers/functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ReportAdapter implements ReportRepository {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  @override
  Future<Report> getGeneralReport() {
    
    throw UnimplementedError();
  }

  @override
  Future<Report> getReportByMonth({required String month}) async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) throw FirebaseException(plugin: 'firebase_auth', code: 'expired-session');
    final date = DateTime.now().toUtc();
    final monthNumber = months.indexOf(month) + 1;
    final startDate = DateTime(date.year, monthNumber, 1);
    final endDate = DateTime(date.year, monthNumber + 1, 1).subtract(Duration(seconds: 1));

    try {
      final data = await _firestore.collection(adviceCollection)
        .where('advisorId', isEqualTo: uid)
        .where('endDate', isGreaterThanOrEqualTo: startDate)
        .where('endDate', isLessThanOrEqualTo: endDate)
        .get();
      final adviceList = data.docs.map((doc) => Advice.fromJson(doc.data())).toList();
      return fillReport(adviceList);
    } on FirebaseException catch (e) {
      throw getException(e.plugin, e.code);
    } catch (error) {
      throw Exception(error);
    }
  }

  Report fillReport(List<Advice> adviceList) {
    final date = DateTime.now();
    final adviceCount = adviceList.length;
    int ratedAdvice = 0;
    double averageRaiting = 0.0;
    int completedAdvice = 0;
    int canceledAdvice = 0;
    int adviceBySistemas = 0;
    int adviceByTics = 0;
    int adviceByMecatronica = 0;
    int adviceByIndustrial = 0;
    int adviceByGestion = 0;
    int adviceByBioquimica = 0;
    int adviceByNano = 0;

    for (final advice in adviceList) {
      if (advice.advisorRating > 0) {
        averageRaiting += advice.advisorRating;
        ratedAdvice++;
      }
      if (advice.status == AdviceStatus.completed) completedAdvice++;
      if (advice.status == AdviceStatus.canceled) canceledAdvice++;
      switch (advice.studentMajor) {
        case 'Ingeniería en Sistemas Computacionales':
          adviceBySistemas++;
          break;
        case 'Ingeniería en Tecnologías de la Información':
          adviceByTics++;
          break;
        case 'Ingeniería Mecatrónica':
          adviceByMecatronica++;
          break;
        case 'Ingeniería Industrial':
          adviceByIndustrial++;
          break;
        case 'Ingeniería en Gestión Empresarial':
          adviceByGestion++;
          break;
        case 'Ingeniería Bioquímica':
          adviceByBioquimica++;
          break;
        case 'Ingeniería en Nanotecnología':
          adviceByNano++;
          break;
        default:
      }
    }

    if (ratedAdvice > 0) averageRaiting /= ratedAdvice;

    return Report(
      date: date,
      averageRaiting: averageRaiting,
      adviceCount: adviceCount,
      completedAdvice: completedAdvice,
      canceledAdvice: canceledAdvice,
      adviceBySistemas: adviceBySistemas,
      adviceByTics: adviceByTics,
      adviceByMecatronica: adviceByMecatronica,
      adviceByIndustrial: adviceByIndustrial,
      adviceByGestion: adviceByGestion,
      adviceByBioquimica: adviceByBioquimica,
      adviceByNano: adviceByNano
    );
  }
}
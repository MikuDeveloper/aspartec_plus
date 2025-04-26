import '../models/report.dart';

abstract class ReportRepository {
  Future<Report> getReportByMonth({required String month});
  Future<Report> getGeneralReport();
}
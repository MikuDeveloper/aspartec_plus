import '../models/report.dart';
import '../repositories/report_repository.dart';

class ReportUseCase {
  final ReportRepository _reportRepository;

  ReportUseCase(this._reportRepository);

  Future<Report> getReportByMonth({required String month}) => _reportRepository.getReportByMonth(month: month);
  Future<Report> getGeneralReport() => _reportRepository.getGeneralReport();
}
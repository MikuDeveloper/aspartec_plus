import 'package:aspartec_plus/domain/use_cases/advice_use_case.dart';
import 'package:aspartec_plus/domain/use_cases/aspartec_user_use_case.dart';
import 'package:aspartec_plus/domain/use_cases/report_use_case.dart';
import 'package:aspartec_plus/domain/use_cases/subject_use_case.dart';
import 'package:aspartec_plus/infrastructure/driven_adapters/advice_adapter.dart';
import 'package:aspartec_plus/infrastructure/driven_adapters/aspartec_user_adapter.dart';
import 'package:aspartec_plus/infrastructure/driven_adapters/report_adapter.dart';
import 'package:aspartec_plus/infrastructure/driven_adapters/subject_adapter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userUseCaseProvider = Provider((ref) => AspartecUserUseCase(AspartecUserAdapter()));
final adviceUseCaseProvider = Provider((ref) => AdviceUseCase(AdviceAdapter()));
final subjectsUseCaseProvider = Provider((ref) => SubjectUseCase(SubjectAdapter()));
final reportsUseCaseProvider = Provider((ref) => ReportUseCase(ReportAdapter()));
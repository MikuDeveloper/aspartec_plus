import 'package:aspartec_plus/app/global/values.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedMonthProvider = StateProvider((ref) => months.elementAt(DateTime.timestamp().toLocal().month - 1));
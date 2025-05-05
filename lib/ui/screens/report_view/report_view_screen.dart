import 'package:aspartec_plus/app/global/assets.dart';
import 'package:aspartec_plus/app/providers/home_providers.dart' show currentUserProvider;
import 'package:aspartec_plus/app/providers/use_cases_providers.dart' show subjectsUseCaseProvider;
import 'package:aspartec_plus/domain/models/report.dart';
import 'package:aspartec_plus/ui/shared/mixins/advice_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'widgets/save_button.dart';

class ReportViewScreen extends ConsumerStatefulWidget {
  const ReportViewScreen({super.key, required this.reportData});

  final Report reportData;

  @override
  ConsumerState<ReportViewScreen> createState() => _ReportViewScreenState();
}

class _ReportViewScreenState extends ConsumerState<ReportViewScreen> with AdviceFunctions {
  PdfDocument? templateDoc;
  Uint8List? reportBytes;

  @override
  void initState() {
    super.initState();
    rootBundle.load(Assets.reportTemplateV2Pdf)
      .then((bytes) => _generateReport(bytes));
  }

  @override
  void dispose() {
    if (templateDoc != null) {
      templateDoc?.dispose();
    }
    super.dispose();
  }

  _generateReport(ByteData bytes) async {
    templateDoc = PdfDocument(inputBytes: bytes.buffer.asUint8List());
    PdfForm form = templateDoc!.form;
    final fields = form.fields;

    final user = ref.read(currentUserProvider.notifier).state;
    final subjects = await ref.read(subjectsUseCaseProvider).getAdvisorSubjects(adviceTaught: user!.adviceTaught);
    final reportData = widget.reportData.toJsonForm(user, subjects.map((subject) => subject.name).toList());
    for(var i = 0; i < fields.count; i++) {
      final field = fields[i] as PdfTextBoxField;
      field.font = PdfStandardFont(PdfFontFamily.helvetica, 10);
      field.text = reportData[field.name];
    }
    form.flattenAllFields();
    reportBytes = templateDoc!.saveAsBytesSync();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reporte mensual'),
        actions: [
          if (reportBytes != null)
            SaveButton(
              pdfBytes: reportBytes!,
              fileName: 'Reporte_de_asesorias-${getDate(widget.reportData.date)}'
            )
        ],
      ),
      body: SafeArea(
        child: reportBytes == null 
          ? Center(child: CircularProgressIndicator()) 
          : SfPdfViewer.memory(reportBytes!),
      ),
    );
  }
}
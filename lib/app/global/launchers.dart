import 'package:aspartec_plus/ui/shared/index.dart' show Dialogs;
import 'package:url_launcher/url_launcher.dart';

class Launchers {
  static Future<bool?> openWhatsApp({
    required context,
    required String phoneNumber,
    required String name,
    required String subject,
    required bool isAdvisor,
  }) async {
    String message = isAdvisor
      ? '¡Hola!, Soy tu Asesor Par $name de AsparTec+, estoy listo(a) para resolver tus dudas de la materia de $subject, quedo pendiente de tu respuesta para empezar a  trabajar con tu inquietud, ¡Saludos!'
      : '¡Hola!, Soy $name, estoy solicitando una asesoría por medio de AsparTec+, referente a la materia de $subject, quedo pendiente de sus indicaciones para proceder a resolver mis dudas, ¡Saludos!';
      
    final url = 'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}';

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
      return true;
    } else {
      Dialogs.showInformativeDialog(context, 'No se pudo abrir WhatsApp, intenta ponerte en contacto con tu asesor a través del número proporcionado: $phoneNumber.');
      return false;
    }
  }
}
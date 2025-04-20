import 'package:aspartec_plus/app/global/assets.dart';
import 'package:aspartec_plus/app/global/enums.dart' show Role;
import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../pages/advice_page.dart';
import '../widgets/profile_action.dart';

class StudentScreen extends StatelessWidget {
  const StudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(defaultPadding / 2),
          child: brightness == Brightness.light
            ? SvgPicture.asset(Assets.aspartecLightLogoSvg)
            : SvgPicture.asset(Assets.aspartecDarkLogoSvg),
        ),
        title: const Text('Aspartec+'),
        actions: [
          const ProfileAction()
        ],
      ),
      body: SafeArea(
        child: const AdvicePage(role: Role.student),
      ),
    );
  }
}
import 'package:aspartec_plus/app/global/assets.dart';
import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class AspartecBanner extends StatelessWidget {
  const AspartecBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final brightness = Theme.of(context).brightness;

    return FittedBox(
      child: Column(
        spacing: defaultPadding,
        mainAxisSize: MainAxisSize.min,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: height * .45
            ),
            child: AspectRatio(
              aspectRatio: 4 / 3,
              child: SvgPicture.asset(
                brightness == Brightness.light 
                  ? Assets.aspartecLightLogoSvg
                  : Assets.aspartecDarkLogoSvg
              ),
            ),
          ),
          Text(
            'ASPARTEC',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium
              ?.copyWith(fontWeight: FontWeight.w900, letterSpacing: 5),
          ),
          Text(
            'Programa de\nAsesorías Acadédemicas',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
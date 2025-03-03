import 'package:aspartec_plus/app/global/assets.dart';
import 'package:flutter/material.dart';

class AspartecBanner extends StatelessWidget {
  const AspartecBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final brightness = Theme.of(context).brightness;

    return FittedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: height * .45
            ),
            child: AspectRatio(
              aspectRatio: 4 / 3,
              child: Image.asset(
                brightness == Brightness.light 
                  ? Assets.aspartecLightLogo
                  : Assets.aspartecDarkLogo 
              ),
            ),
          ),
          Text(
            'Programa de\n Asesorías Acadédemicas',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
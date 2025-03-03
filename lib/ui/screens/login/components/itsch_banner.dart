import 'package:aspartec_plus/app/global/assets.dart';
import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ItschBanner extends StatelessWidget {
  const ItschBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return FittedBox(
      child: Row(
        spacing: defaultPadding / 2,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(4))
            ),
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding / 8),
              child: SvgPicture.asset(Assets.itschLogo, height: 48),
            )
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Instituto Tecnólogico Superior',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700
                ),
              ),
              Text(
                'de Ciudad Hidalgo',
                style: Theme.of(context).textTheme.titleSmall
                  ?.copyWith(
                    fontWeight: FontWeight.w300,
                    color: brightness == Brightness.light ? Colors.black54 : Colors.white60
                  ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
import 'package:aspartec_plus/app/global/values.dart';
import 'package:flutter/material.dart';

import 'components/itsch_banner.dart';
import 'components/aspartec_banner.dart';
import 'components/login_buttons.dart';
import 'widgets/background_circles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final circles = getBackgroundCircles(MediaQuery.of(context).size);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            for (int i = 0; i < circles.length; i++) circles[i],
            Center(
              child: Column(
                spacing: defaultPadding,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: defaultPadding
                    ),
                    child: ItschBanner(),
                  ),
                  Expanded(child: AspartecBanner()),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: defaultPadding * 1.5
                    ),
                    child: LoginButtons()
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
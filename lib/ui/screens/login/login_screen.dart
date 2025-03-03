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

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            for (int i = 0; i < circles.length; i++) circles[i],
            const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(defaultPadding / 2),
                child: AspartecBanner(),
              ),
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.all(defaultPadding / 2),
                child: ItschBanner(),
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: defaultPadding * 3,
                  horizontal: defaultPadding / 2
                ),
                child: LoginButtons(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
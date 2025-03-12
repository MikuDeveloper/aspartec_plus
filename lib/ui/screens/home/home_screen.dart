import 'package:flutter/material.dart';

import 'advisor_module/advisor_module_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Add logic to show Advisor or Student module screen.
    return AdvisorModuleScreen();
  }
}
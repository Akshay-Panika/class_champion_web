import 'package:flutter/material.dart';

import '../../footer/screen/footer_screen.dart';
import '../../landing/screen/landing_screen.dart';
import '../../package/screen/package_screen.dart';
import '../../response/screen/responce_screen.dart';
import '../../trust_us/screen/trust_us_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LandingScreen(),
        ResponseScreen(),
        TrustUsScreen(),
        PackageScreen(),
      ],
    );
  }
}

import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
// import 'package:jagbandhu/pages/loginpage.dart';
import 'package:jagbandhu_service_provider/pages/login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  initState() {
    Timer(
      const Duration(seconds: 2),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers

    return Container(
      child: Image.asset('assets/images/splash.png'),
    );
  }
}

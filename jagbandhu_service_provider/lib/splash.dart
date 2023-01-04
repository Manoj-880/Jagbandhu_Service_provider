import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:jagbandhu_service_provider/local_database.dart';
import 'package:jagbandhu_service_provider/models/user_details_model.dart';
import 'package:jagbandhu_service_provider/pages/home_page.dart';
// import 'package:jagbandhu/pages/loginpage.dart';
import 'package:jagbandhu_service_provider/pages/login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  checkData() async {
    await database();
    userdata = await user();
    print(userdata);
    if (userdata.isEmpty) {
      Timer(
        const Duration(seconds: 2),
        () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        ),
      );
    } else {
      Timer(
        const Duration(seconds: 2),
        () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        ),
      );
    }
  }

  @override
  initState() {
    checkData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers

    return Container(
      child: Image.asset(
        'assets/images/splash.png',
        fit: BoxFit.cover,
      ),
    );
  }
}

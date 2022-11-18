import 'package:flutter/material.dart';

class PendingApproval extends StatelessWidget {
  const PendingApproval({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: const Color(0xffF5D7D2),
        height: size.height,
        width: size.width,
        child: const Center(
          child: Text(
            'Your application has sent to Jagbandhu Team,\nOur team has to approve your Creator account',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xff3B1D2C),
            ),
          ),
        ),
      ),
    );
  }
}

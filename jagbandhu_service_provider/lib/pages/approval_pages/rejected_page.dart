import 'package:flutter/material.dart';

class Rejected extends StatelessWidget {
  const Rejected({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding:
            EdgeInsets.symmetric(horizontal: 20, vertical: size.height * 0.3),
        color: const Color(0xffF5D7D2),
        height: size.height,
        width: size.width,
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.all(15),
              child: Image(
                image: AssetImage('assets/images/rejected.png'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Your application has been rejected byour Jagbandhu team\n Please try after 30 days to get approved',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xff3B1D2C),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

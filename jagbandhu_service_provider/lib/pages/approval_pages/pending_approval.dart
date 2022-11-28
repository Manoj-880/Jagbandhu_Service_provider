import 'package:flutter/material.dart';

class PendingApproval extends StatelessWidget {
  const PendingApproval({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding:
            EdgeInsets.symmetric(horizontal: 20, vertical: size.height * 0.25),
        color: const Color(0xffffeedf),
        height: size.height,
        width: size.width,
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.all(15),
              child: Image(
                image: AssetImage('assets/images/pending.png'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Your application has sent to Jagbandhu Team,\nOur team has to approve your Creator account',
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jagbandhu_service_provider/models/globalParams.dart';
import 'package:jagbandhu_service_provider/models/user_details_model.dart';
import 'package:jagbandhu_service_provider/pages/basic_registration.dart';
import 'package:jagbandhu_service_provider/pages/earnings.dart';
import 'package:jagbandhu_service_provider/pages/home_page.dart';
import 'package:jagbandhu_service_provider/pages/my_templates.dart';
import 'package:jagbandhu_service_provider/pages/pending_approval.dart';
// ignore: unused_import

import '../api_calls/otp_api.dart';
import 'login.dart';

class OTPPage extends StatefulWidget {
  final String phone;

  // ignore: use_key_in_widget_constructors
  const OTPPage(this.phone);

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  String serverotp = onetime;

  String otp = '';
  bool texterror = false;
  TextEditingController otpcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print('password from server is: $serverotp');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_image.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    ClipOval(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/logo.png'),
                        radius: 80,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    'Enter OTP $serverotp',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff3B1D2C),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xffFFD4AE)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            '+91-${widget.phone}',
                            style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xff3B1D2C),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: TextButton(
                            onPressed: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
                              );
                            },
                            child: const Text(
                              'Change number',
                              style: TextStyle(
                                  color: Color(0xff3B1D2C),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  // ignore: sized_box_for_whitespace
                  child: Container(
                    height: 60,
                    child: TextField(
                      maxLines: 1,
                      style: const TextStyle(fontSize: 18),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        filled: true,
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        fillColor: const Color(0xffFFD4AE),
                        contentPadding:
                            const EdgeInsets.only(left: 20, right: 20),
                        hintText: 'Enter OTP',
                        errorText: texterror ? "Enter valid OTP" : null,
                        hintStyle: const TextStyle(
                            color: Color(0xff3B1D2C),
                            fontWeight: FontWeight.w300),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(6)
                      ],
                      onChanged: (value) => otp = value,
                      controller: otpcontroller,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Card(
                      color: Colors.grey,
                      margin: const EdgeInsets.only(right: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Container(
                        height: 50,
                        width: 100,
                        //margin: const EdgeInsets.only(right: 20),
                        // ignore: sort_child_properties_last
                        child: TextButton(
                          onPressed: () async {
                            var values = await otpvalidation(otp);

                            if (values == 'New Provider!') {
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const BasicRegistration()),
                              );
                            } else if (values == 'Invalid OTP') {
                              texterror = true;
                            } else {
                              userdata = values;
                              newUser.status = userdata[0].status;
                              if (newUser.status == '0') {
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()),
                                );
                                // ignore: use_build_context_synchronously
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => const HomePage()),
                                // );
                              } else if (newUser.status == '1') {
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PendingApproval()),
                                );
                              } else if (newUser.status == '2') {
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Earnings()),
                                );
                              }
                            }
                          },
                          child: const Text(
                            'Verify',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: const Color(0xffF65D46),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Image(image: AssetImage("assets/images/bottom_image.png")),
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: Image(image: AssetImage("assets/images/top_image.png")),
            )
          ],
        ),
      ),
    );
  }
}

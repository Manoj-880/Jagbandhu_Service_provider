import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jagbandhu_service_provider/api_calls/login_api.dart';
import 'package:jagbandhu_service_provider/models/globalParams.dart';

import 'otp_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController fname = TextEditingController();
  bool texterror = false;
  String phoneNumber = '';
  // ignore: prefer_final_fields
  // TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    fname.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_image.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const ClipOval(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/logo.png'),
                      radius: 80,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "Creator's Login",
                  style: TextStyle(
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
                padding: const EdgeInsets.only(left: 20, right: 20),
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
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      fillColor: const Color(0xffFFD4AE),
                      contentPadding:
                          const EdgeInsets.only(left: 20, right: 20),
                      hintText: 'Mobile number',
                      errorText: texterror ? "Enter valid mobile number" : null,
                      hintStyle: const TextStyle(
                          color: Color(0xff3B1D2C),
                          fontWeight: FontWeight.w300),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10)
                    ],
                    controller: fname,
                    onChanged: (value) => phoneNumber = value,
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
                          if (fname.text.length < 10) {
                            //textfield minimum limit
                            setState(() {
                              texterror = true;
                            });
                          } else {
                            if (fname.text.isEmpty ||
                                !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$') //mobile number format
                                    .hasMatch(fname.text)) {
                              setState(() {
                                texterror = true;
                              });
                            } else {
                              setState(() {
                                texterror = false;
                              });
                              // ignore: unused_local_variable
                              //call to backend for otp.
                              var values = await userlogin(phoneNumber);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OTPPage(phoneNumber)),
                              );
                            }
                          }
                        },
                        child: const Text(
                          'Get OTP',
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
        ]),
      ),
    );
  }
}

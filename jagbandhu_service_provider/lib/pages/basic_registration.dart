import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:jagbandhu_service_provider/local_database.dart';
import 'package:jagbandhu_service_provider/models/user_details_model.dart';
import 'package:jagbandhu_service_provider/pages/optional_details.dart';

class BasicRegistration extends StatefulWidget {
  const BasicRegistration({super.key});

  @override
  State<BasicRegistration> createState() => _BasicRegistrationState();
}

class _BasicRegistrationState extends State<BasicRegistration> {
  String lastName = '';
  String? gender;
  final formKey = GlobalKey<FormState>();
  final List<String> items = [
    'Male',
    'Female',
    'Others',
  ];
  TextEditingController fname = TextEditingController();

  // ignore: non_constant_identifier_names
  TextEditingController Dateinput = TextEditingController();
  bool texterror = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formKey,
        child: Container(
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
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      'Enter your details',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff3B1D2C),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      maxLines: 1,
                      style: const TextStyle(fontSize: 18),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: const InputDecoration(
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffFFD4AE)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffFFD4AE)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        fillColor: Color(0xffffffff),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffFFD4AE)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffFFD4AE)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        contentPadding: EdgeInsets.only(left: 20, right: 20),
                        hintText: 'First Name',
                        errorStyle: TextStyle(fontSize: 10, height: 0.1),
                        hintStyle: TextStyle(
                            color: Color(0xff3B1D2C),
                            fontWeight: FontWeight.w300),
                      ),
                      controller: fname,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return '*This field is mandatory';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      maxLines: 1,
                      style: const TextStyle(fontSize: 18),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: const InputDecoration(
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffFFD4AE)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffFFD4AE)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        fillColor: Color(0xffffffff),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffFFD4AE)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffFFD4AE)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        contentPadding: EdgeInsets.only(left: 20, right: 20),
                        hintText: 'Last Name',
                        errorStyle: TextStyle(fontSize: 10, height: 0.1),
                        hintStyle: TextStyle(
                            color: Color(0xff3B1D2C),
                            fontWeight: FontWeight.w300),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return '*This field is mandatory';
                        }
                        return null;
                      },
                      onChanged: (value) => lastName = value,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Container(
                      height: 60,
                      // ignore: sort_child_properties_last
                      child: GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            controller: Dateinput,
                            readOnly: true,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textAlignVertical: TextAlignVertical.top,
                            keyboardType: TextInputType.name,
                            style: const TextStyle(
                              fontSize: 18,
                              letterSpacing: 0.9,
                            ),
                            onTap: () async {
                              final DateTime? datepick = await showDatePicker(
                                  context: context,
                                  initialDatePickerMode: DatePickerMode.day,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now());

                              if (datepick != null) {
                                String formattedDate =
                                    DateFormat('dd-MM-yyy').format(datepick);

                                setState(() {
                                  Dateinput.text = formattedDate;
                                });
                              }
                            },
                            decoration: const InputDecoration(
                              suffixIcon: Icon(
                                Icons.calendar_month,
                                size: 22,
                              ),
                              hintText: 'Date of Birth',
                              hintStyle: TextStyle(
                                  color: Color(0xff3B1D2C),
                                  fontWeight: FontWeight.w300),
                              focusedErrorBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              errorStyle: TextStyle(fontSize: 10, height: 0.2),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xffffffff),
                          border: Border.all(color: const Color(0xffFFD4AE))),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Container(
                      height: 60,
                      // ignore: sort_child_properties_last
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            hint: const Text(
                              'Gender',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff3B1D2C),
                                  fontWeight: FontWeight.normal),
                            ),
                            items: items
                                .map(
                                  (item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Color(0xff3B1D2C),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                )
                                .toList(),
                            value: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value as String;
                              });
                            },
                            buttonHeight: 40,
                            buttonWidth: double.infinity,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xffffffff),
                          border: Border.all(color: const Color(0xffFFD4AE))),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
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
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                newUser.firstName = fname.text;
                                newUser.lastname = lastName;
                                newUser.dob = Dateinput.text;
                                newUser.gender = gender;

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MoreDetails()),
                                );
                              }
                            },
                            child: const Text(
                              'Next',
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
                child:
                    Image(image: AssetImage("assets/images/bottom_image.png")),
              ),
              const Align(
                alignment: Alignment.topCenter,
                child: Image(image: AssetImage("assets/images/top_image.png")),
              )
            ],
          ),
        ),
      ),
    );
  }
}

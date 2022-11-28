import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:jagbandhu_service_provider/api_calls/login_api.dart';
import 'package:jagbandhu_service_provider/api_calls/user_details_api.dart';
import 'package:jagbandhu_service_provider/models/user_details_model.dart';
import 'package:jagbandhu_service_provider/pages/home_page.dart';

import 'approval_pages/pending_approval.dart';

class MoreDetails extends StatefulWidget {
  const MoreDetails({super.key});

  @override
  State<MoreDetails> createState() => _MoreDetailsState();
}

class _MoreDetailsState extends State<MoreDetails> {
  UserProfileData userdata = UserProfileData();
  final formKey = GlobalKey<FormState>();
  String countryValue = '';
  String stateValue = '';
  String cityValue = '';
  String address = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers, unused_local_variable
    GlobalKey<CSCPickerState> _cscPickerKey = GlobalKey();
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
                      'Need Some more details about you',
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
                        contentPadding: EdgeInsets.only(left: 20, right: 20),
                        hintText: 'E-mail',
                        hintStyle: TextStyle(
                            color: Color(0xff3B1D2C),
                            fontWeight: FontWeight.w300),
                        errorBorder: InputBorder.none,
                        errorStyle: TextStyle(fontSize: 10, height: 0.1),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return '*This field is mandatory';
                        }
                        return null;
                      },
                      onChanged: (value) => email = value,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: TextFormField(
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
                          contentPadding: EdgeInsets.only(left: 20, right: 20),
                          hintText: 'Address',
                          hintStyle: TextStyle(
                              color: Color(0xff3B1D2C),
                              fontWeight: FontWeight.w300),
                          focusedErrorBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          errorStyle: TextStyle(fontSize: 10, height: 0.2)),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return '*This field is mandatory';
                        }
                        return null;
                      },
                      onChanged: (value) => address = value,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: CSCPicker(
                      layout: Layout.vertical,
                      showStates: true,
                      defaultCountry: DefaultCountry.India,

                      /// Enable disable city drop down [OPTIONAL PARAMETER]
                      showCities: true,

                      ///Enable (get flag with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
                      flagState: CountryFlag.DISABLE,

                      ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)

                      dropdownDecoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                          color: Colors.white,
                          border: Border.all(
                              color: const Color(0xffFFD4AE), width: 1)),

                      ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
                      disabledDropdownDecoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                          color: Colors.grey.shade300,
                          border: Border.all(
                              color: const Color(0xffFFD4AE), width: 1)),

                      ///placeholders for dropdown search field
                      countrySearchPlaceholder: "Country",
                      stateSearchPlaceholder: "State",
                      citySearchPlaceholder: "City",

                      ///labels for dropdown
                      countryDropdownLabel: "*Country",
                      stateDropdownLabel: "*State",
                      cityDropdownLabel: "*City",

                      ///Default Country
                      //defaultCountry: DefaultCountry.India,

                      ///Disable country dropdown (Note: use it with default country)
                      //disableCountry: true,

                      ///selected item style [OPTIONAL PARAMETER]
                      selectedItemStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        height: 1.9,
                      ),

                      ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                      dropdownHeadingStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),

                      ///DropdownDialog Item style [OPTIONAL PARAMETER]
                      dropdownItemStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),

                      ///Dialog box radius [OPTIONAL PARAMETER]
                      dropdownDialogRadius: 10.0,

                      ///Search bar radius [OPTIONAL PARAMETER]
                      searchBarRadius: 10.0,
                      onCountryChanged: (value) {
                        setState(() {
                          ///store value in country variable
                          countryValue = value;
                        });
                      },

                      ///triggers once state selected in dropdown
                      onStateChanged: (value) {
                        setState(() {
                          if (value != null) {
                            stateValue = value;
                          }
                        });
                      },

                      ///triggers once city selected in dropdown
                      onCityChanged: (value) {
                        setState(() {
                          ///store value in city variable
                          if (value != null) {
                            cityValue = value;
                          }
                        });
                      },

                      ///triggers once country selected in dropdown
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        color: Colors.grey,
                        margin: const EdgeInsets.only(left: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Container(
                          height: 50,
                          width: 100,
                          //margin: const EdgeInsets.only(right: 20),
                          // ignore: sort_child_properties_last
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()),
                              );
                            },
                            child: const Text(
                              'Skip',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                // ignore: unnecessary_const
                                color: const Color(0xffF65D46),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xffF65D46)),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
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
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                newUser.email = email;
                                newUser.address = address;
                                newUser.city = cityValue;
                                newUser.state = stateValue;
                                newUser.country = countryValue;

                                userdetailsapi(
                                  newUser.firstName,
                                  newUser.lastname,
                                  newUser.dob,
                                  newUser.gender,
                                  newUser.email,
                                  newUser.phonenumber,
                                  newUser.address,
                                  newUser.city,
                                  newUser.country,
                                  newUser.state,
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PendingApproval()),
                                );
                              }
                            },
                            child: const Text(
                              'Submit',
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
    // ignore: avoid_unnecessary_containers
  }
}

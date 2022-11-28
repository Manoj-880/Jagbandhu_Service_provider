import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:jagbandhu_service_provider/api_calls/user_details_api.dart';
import 'package:jagbandhu_service_provider/pages/profile.dart';

import '../models/user_details_model.dart';
import '../sections/bottomNavBar.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  UserProfileData user = userdata[0];
  final formKey = GlobalKey<FormState>();
  late final TextEditingController firstname;
  late final TextEditingController lastname;
  late final TextEditingController email;
  late final TextEditingController address;

  String countryValue = '';
  String stateValue = '';
  String cityValue = '';

  @override
  void initState() {
    firstname = TextEditingController(text: user.firstName);
    lastname = TextEditingController(text: user.lastname);
    email = TextEditingController(text: user.email);
    address = TextEditingController(text: user.address);
    cityValue = user.city!;
    stateValue = user.state!;
    countryValue = user.country!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(user.id);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(
        index: -1,
      ),
      appBar: AppBar(
        toolbarHeight: size.height * 0.1,
        elevation: 0,
        backgroundColor: const Color(0xffFFA95D),
        centerTitle: true,
        title: const Text(
          'Edit Profile',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: TextButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  user.firstName = firstname.text;
                  user.lastname = lastname.text;
                  user.email = email.text;
                  user.address = address.text;
                  user.city = cityValue;
                  user.state = stateValue;
                  user.country = countryValue;

                  await updateuserdetailsapi(
                    user.id,
                    user.firstName,
                    user.lastname,
                    user.email,
                    user.address,
                    user.city,
                    user.state,
                    user.country,
                    user.phonenumber,
                  );

                  // ignore: use_build_context_synchronously
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyProfile()),
                  );
                }
              },
              child: const Text(
                'Save',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: size.height * 0.2,
            width: size.width,
            decoration: const BoxDecoration(
              color: Color(0xffFFEEDF),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ClipOval(
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/profile_pic.jpg'),
                    radius: 45,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                GestureDetector(
                  onTap: () {
                    // ignore: avoid_print
                    print('Change profile pic');
                  },
                  child: const Text(
                    'Change Photo',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Color(0xffF65D46),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Container(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'First Name',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff3B1D2C),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              maxLines: 1,
                              style: const TextStyle(fontSize: 18),
                              textAlignVertical: TextAlignVertical.center,
                              decoration: const InputDecoration(
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffFFD4AE)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffFFD4AE)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                fillColor: Color(0xffffffff),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffFFD4AE)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                errorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffFFD4AE)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                contentPadding:
                                    EdgeInsets.only(left: 20, right: 20),
                                hintText: 'First Name',
                                errorStyle:
                                    TextStyle(fontSize: 10, height: 0.1),
                                hintStyle: TextStyle(
                                    color: Color(0xff3B1D2C),
                                    fontWeight: FontWeight.w300),
                              ),
                              controller: firstname,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return '*This field is mandatory';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Last Name',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff3B1D2C),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              maxLines: 1,
                              style: const TextStyle(fontSize: 18),
                              textAlignVertical: TextAlignVertical.center,
                              decoration: const InputDecoration(
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffFFD4AE)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffFFD4AE)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                fillColor: Color(0xffffffff),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffFFD4AE)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                errorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffFFD4AE)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                contentPadding:
                                    EdgeInsets.only(left: 20, right: 20),
                                hintText: 'Last Name',
                                errorStyle:
                                    TextStyle(fontSize: 10, height: 0.1),
                                hintStyle: TextStyle(
                                    color: Color(0xff3B1D2C),
                                    fontWeight: FontWeight.w300),
                              ),
                              controller: lastname,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return '*This field is mandatory';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Email',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff3B1D2C),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              maxLines: 1,
                              style: const TextStyle(fontSize: 18),
                              textAlignVertical: TextAlignVertical.center,
                              decoration: const InputDecoration(
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffFFD4AE)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffFFD4AE)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                fillColor: Color(0xffffffff),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffFFD4AE)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                errorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffFFD4AE)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                contentPadding:
                                    EdgeInsets.only(left: 20, right: 20),
                                hintText: 'Email',
                                errorStyle:
                                    TextStyle(fontSize: 10, height: 0.1),
                                hintStyle: TextStyle(
                                    color: Color(0xff3B1D2C),
                                    fontWeight: FontWeight.w300),
                              ),
                              controller: email,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return '*This field is mandatory';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Address',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff3B1D2C),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              maxLines: 1,
                              style: const TextStyle(fontSize: 18),
                              textAlignVertical: TextAlignVertical.center,
                              decoration: const InputDecoration(
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffFFD4AE)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffFFD4AE)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                fillColor: Color(0xffffffff),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffFFD4AE)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                errorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffFFD4AE)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                contentPadding:
                                    EdgeInsets.only(left: 20, right: 20),
                                hintText: 'Address',
                                errorStyle:
                                    TextStyle(fontSize: 10, height: 0.1),
                                hintStyle: TextStyle(
                                    color: Color(0xff3B1D2C),
                                    fontWeight: FontWeight.w300),
                              ),
                              controller: address,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return '*This field is mandatory';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: CSCPicker(
                          layout: Layout.vertical,
                          showStates: true,
                          currentCountry: countryValue,
                          currentState: stateValue,
                          currentCity: cityValue,
                          showCities: true,
                          flagState: CountryFlag.DISABLE,
                          dropdownDecoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              color: Colors.white,
                              border: Border.all(
                                  color: const Color(0xffFFD4AE), width: 1)),
                          disabledDropdownDecoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              color: Colors.grey.shade300,
                              border: Border.all(
                                  color: const Color(0xffFFD4AE), width: 1)),
                          countrySearchPlaceholder: "Country",
                          stateSearchPlaceholder: "State",
                          citySearchPlaceholder: "City",
                          countryDropdownLabel: "*Country",
                          stateDropdownLabel: "*State",
                          cityDropdownLabel: "*City",
                          selectedItemStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            height: 1.9,
                          ),
                          dropdownHeadingStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                          dropdownItemStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          dropdownDialogRadius: 10.0,
                          searchBarRadius: 10.0,
                          onCountryChanged: (value) {
                            setState(() {
                              countryValue = value;
                            });
                          },
                          onStateChanged: (value) {
                            setState(() {
                              if (value != null) {
                                stateValue = value;
                              }
                            });
                          },
                          onCityChanged: (value) {
                            setState(() {
                              if (value != null) {
                                cityValue = value;
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

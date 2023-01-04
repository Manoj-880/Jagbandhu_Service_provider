// ignore_for_file: unused_import

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:jagbandhu_service_provider/api_calls/add_template_api.dart';
import 'package:jagbandhu_service_provider/models/layers_model.dart';
import 'package:jagbandhu_service_provider/models/user_details_model.dart';
import 'package:jagbandhu_service_provider/pages/assemble%20layers/add_image.dart';
import 'package:jagbandhu_service_provider/pages/assemble%20layers/assemble_layers.dart';

import '../sections/bottomNavBar.dart';

class AddTemplates extends StatefulWidget {
  const AddTemplates({super.key});

  @override
  State<AddTemplates> createState() => _AddTemplatesState();
}

class _AddTemplatesState extends State<AddTemplates> {
  UserProfileData user = userdata[0];
  final formKey = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  String? Title;
  TextEditingController disc = TextEditingController();
  String? Discription;
  TextEditingController amount = TextEditingController();
  String? Price;
  List<bool> iscard = [];
  final List<String> items = [
    'event 1',
    'event 2',
    'event 3',
  ];
  String? category;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(
        index: -1,
      ),
      appBar: AppBar(
        toolbarHeight: size.height * 0.1,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffFFA95D),
        centerTitle: true,
        title: const Text(
          'Add Template',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.04,
                ),
                Container(
                  height: 60,
                  // ignore: sort_child_properties_last
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        hint: Text(
                          'Event Category',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff3B1D2C).withOpacity(0.4),
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
                        value: category,
                        onChanged: (value) {
                          setState(() {
                            category = value as String;
                          });
                        },
                        buttonHeight: 40,
                        buttonWidth: double.infinity,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffffffff),
                      border:
                          Border.all(color: const Color(0xffFFA95D), width: 2)),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: title,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 18),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    filled: true,
                    enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffFFA95D), width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffFFA95D), width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    errorBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffFFA95D), width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    focusedErrorBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffFFA95D), width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    fillColor: const Color(0xffffffff),
                    contentPadding: const EdgeInsets.only(left: 20, right: 20),
                    hintText: 'Title :',
                    hintStyle: TextStyle(
                        color: const Color(0xff3B1D2C).withOpacity(0.4),
                        fontWeight: FontWeight.normal),
                  ),
                  onChanged: (value) => Title = value,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return '*This field is mandatory';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: disc,
                  maxLines: 5,
                  style: const TextStyle(fontSize: 18),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    filled: true,
                    errorBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffFFA95D), width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    focusedErrorBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffFFA95D), width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffFFA95D), width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffFFA95D), width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    fillColor: const Color(0xffffffff),
                    contentPadding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    hintText: 'Discription :',
                    hintStyle: TextStyle(
                        color: const Color(0xff3B1D2C).withOpacity(0.4),
                        fontWeight: FontWeight.normal),
                  ),
                  onChanged: (value) => Discription = value,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return '*This field is mandatory';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: amount,
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 18),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    filled: true,
                    focusedErrorBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffFFA95D), width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    errorBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffFFA95D), width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffFFA95D), width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffFFA95D), width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    fillColor: const Color(0xffffffff),
                    contentPadding: const EdgeInsets.only(left: 20, right: 20),
                    hintText: 'Price :',
                    hintStyle: TextStyle(
                        color: const Color(0xff3B1D2C).withOpacity(0.4),
                        fontWeight: FontWeight.normal),
                  ),
                  onChanged: (value) => Price = value,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return '*This field is mandatory';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddBackground(
                                  title: Title,
                                  description: Discription,
                                  price: Price,
                                  categorey: category,
                                )),
                      );
                    }
                  },
                  child: Container(
                    height: size.height * 0.06,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: const Color(0xffFFA95D),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Add Template',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

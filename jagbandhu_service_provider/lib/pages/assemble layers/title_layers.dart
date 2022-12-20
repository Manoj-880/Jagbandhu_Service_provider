import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Titleform extends StatefulWidget {
  TextEditingController editingController;
  int lykey;
  Titleform({super.key, required this.editingController, required this.lykey});

  @override
  State<Titleform> createState() => _TitleformState();
}

class _TitleformState extends State<Titleform> {
  TextEditingController editingController = TextEditingController();
  // ignore: prefer_typing_uninitialized_variables
  var valuekey;

  @override
  void initState() {
    valuekey = widget.lykey;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: size.width * 0.45,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      maxLines: 1,
                      style: const TextStyle(fontSize: 18),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        filled: true,
                        enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffFFA95D), width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffFFA95D), width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        fillColor: const Color(0xffffffff),
                        focusedErrorBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffFFA95D), width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        errorBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffFFA95D), width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        contentPadding:
                            const EdgeInsets.only(left: 20, right: 20),
                        hintText: 'Enter layer name',
                        errorStyle: const TextStyle(fontSize: 10, height: 0.1),
                        hintStyle: TextStyle(
                            color: const Color(0xff3B1D2C).withOpacity(0.6),
                            fontWeight: FontWeight.normal),
                      ),
                      controller: editingController,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // ignore: sized_box_for_whitespace
                  Container(
                    width: size.width * 0.45,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      maxLines: 1,
                      style: const TextStyle(fontSize: 18),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        filled: true,
                        enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffFFA95D), width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffFFA95D), width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        fillColor: const Color(0xffffffff),
                        focusedErrorBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffFFA95D), width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        errorBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffFFA95D), width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        contentPadding:
                            const EdgeInsets.only(left: 20, right: 20),
                        hintText: 'Enter layer Content',
                        errorStyle: const TextStyle(fontSize: 10, height: 0.1),
                        hintStyle: TextStyle(
                            color: const Color(0xff3B1D2C).withOpacity(0.6),
                            fontWeight: FontWeight.normal),
                      ),
                      controller: editingController,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'Alignment',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff3B1D2C)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: size.height * 0.18,
                    width: size.width * 0.4,
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.7, horizontal: 4.7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: const Color(0xffFFA95D), width: 1.5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // ignore: curly_braces_in_flow_control_structures
                                setState(() {
                                  valuekey = 1;
                                });
                              },
                              child: Container(
                                height: size.height * 0.033,
                                width: size.width * 0.122,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xffFFD4AE)),
                                    color: valuekey == 1
                                        ? const Color(0xffFFD4AE)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Center(
                                    child: Text(
                                  '1',
                                  style: TextStyle(color: Colors.black),
                                )),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  valuekey = 4;
                                });
                              },
                              child: Container(
                                height: size.height * 0.033,
                                width: size.width * 0.122,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xffFFD4AE),
                                    ),
                                    color: valuekey == 4
                                        ? const Color(0xffFFD4AE)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Center(
                                    child: Text(
                                  '4',
                                  style: TextStyle(color: Colors.black),
                                )),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  valuekey = 7;
                                });
                              },
                              child: Container(
                                height: size.height * 0.033,
                                width: size.width * 0.122,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xffFFD4AE),
                                    ),
                                    color: valuekey == 7
                                        ? const Color(0xffFFD4AE)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Center(
                                    child: Text(
                                  '7',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                )),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  valuekey = 10;
                                });
                              },
                              child: Container(
                                height: size.height * 0.033,
                                width: size.width * 0.122,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xffFFD4AE),
                                    ),
                                    color: valuekey == 10
                                        ? const Color(0xffFFD4AE)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Center(
                                    child: Text(
                                  '10',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                )),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  valuekey = 13;
                                });
                              },
                              child: Container(
                                height: size.height * 0.033,
                                width: size.width * 0.122,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xffFFD4AE),
                                    ),
                                    color: valuekey == 13
                                        ? const Color(0xffFFD4AE)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Center(
                                    child: Text(
                                  '13',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                )),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  valuekey = 2;
                                });
                              },
                              child: Container(
                                height: size.height * 0.033,
                                width: size.width * 0.122,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xffFFD4AE),
                                    ),
                                    color: valuekey == 2
                                        ? const Color(0xffFFD4AE)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Center(
                                    child: Text(
                                  '2',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                )),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  valuekey = 5;
                                });
                              },
                              child: Container(
                                height: size.height * 0.033,
                                width: size.width * 0.122,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xffFFD4AE),
                                    ),
                                    color: valuekey == 5
                                        ? const Color(0xffFFD4AE)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Center(
                                    child: Text(
                                  '5',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                )),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  valuekey = 8;
                                });
                              },
                              child: Container(
                                height: size.height * 0.033,
                                width: size.width * 0.122,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xffFFD4AE),
                                    ),
                                    color: valuekey == 8
                                        ? const Color(0xffFFD4AE)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Center(
                                    child: Text(
                                  '8',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                )),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  valuekey = 11;
                                });
                              },
                              child: Container(
                                height: size.height * 0.033,
                                width: size.width * 0.122,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xffFFD4AE),
                                    ),
                                    color: valuekey == 11
                                        ? const Color(0xffFFD4AE)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Center(
                                    child: Text(
                                  '11',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                )),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  valuekey = 14;
                                });
                              },
                              child: Container(
                                height: size.height * 0.033,
                                width: size.width * 0.122,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xffFFD4AE),
                                    ),
                                    color: valuekey == 14
                                        ? const Color(0xffFFD4AE)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Center(
                                    child: Text(
                                  '14',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                )),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  valuekey = 3;
                                });
                              },
                              child: Container(
                                height: size.height * 0.033,
                                width: size.width * 0.122,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xffFFD4AE),
                                    ),
                                    color: valuekey == 3
                                        ? const Color(0xffFFD4AE)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Center(
                                    child: Text(
                                  '3',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                )),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  valuekey = 6;
                                });
                              },
                              child: Container(
                                height: size.height * 0.033,
                                width: size.width * 0.122,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xffFFD4AE),
                                    ),
                                    color: valuekey == 6
                                        ? const Color(0xffFFD4AE)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Center(
                                    child: Text(
                                  '6',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                )),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  valuekey = 9;
                                });
                              },
                              child: Container(
                                height: size.height * 0.033,
                                width: size.width * 0.122,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xffFFD4AE),
                                    ),
                                    color: valuekey == 9
                                        ? const Color(0xffFFD4AE)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Center(
                                    child: Text(
                                  '9',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                )),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  valuekey = 12;
                                });
                              },
                              child: Container(
                                height: size.height * 0.033,
                                width: size.width * 0.122,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xffFFD4AE),
                                    ),
                                    color: valuekey == 12
                                        ? const Color(0xffFFD4AE)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Center(
                                    child: Text(
                                  '12',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                )),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  valuekey = 15;
                                });
                              },
                              child: Container(
                                height: size.height * 0.033,
                                width: size.width * 0.122,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xffFFD4AE),
                                    ),
                                    color: valuekey == 15
                                        ? const Color(0xffFFD4AE)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Center(
                                    child: Text(
                                  '15',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                )),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

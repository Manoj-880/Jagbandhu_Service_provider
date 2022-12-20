// ignore_for_file: prefer_final_fields, unused_field

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:jagbandhu_service_provider/api_calls/add_template_api.dart';
import 'package:jagbandhu_service_provider/api_calls/preview_template_api.dart';
import 'package:jagbandhu_service_provider/models/globalParams.dart';
import 'package:jagbandhu_service_provider/models/user_details_model.dart';
import 'package:jagbandhu_service_provider/pages/add_templates.dart';
import 'package:jagbandhu_service_provider/pages/assemble%20layers/title_layers.dart';
import 'package:jagbandhu_service_provider/pages/preview_template.dart';

import '../../models/layers_model.dart';
import '../../sections/bottomNavBar.dart';

class AssembleLayers extends StatefulWidget {
  const AssembleLayers({super.key});

  @override
  State<AssembleLayers> createState() => _AssembleLayersState();
}

class _AssembleLayersState extends State<AssembleLayers> {
  int lycount = 1;
  //UserProfileData user = userdata[0];

  List<TextEditingController> _title = [];
  List<TextEditingController> _content = [];
  var position = [];
  List<bool> ontap = [];
  var value;

  @override
  void initState() {
    value = List.generate(15, (index) => 1 + index);
    super.initState();
  }

  @override
  void dispose() {
    for (final title in _title) {
      title.dispose();
    }
    super.dispose();
    for (final content in _content) {
      content.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        bottomNavigationBar: const BottomNavBar(index: -1),
        appBar: AppBar(
          toolbarHeight: size.height * 0.1,
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xffFFA95D),
          centerTitle: true,
          title: const Text(
            'Adjust Layers',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: Column(children: [
          SizedBox(
            height: size.height * 0.015,
          ),
          addlayer(),
          Expanded(
              child: ListView.builder(
                  itemCount: position.length,
                  itemBuilder: ((context, index) {
                    return Container(
                      child: position[index],
                    );
                  }))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddTemplates()),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    height: size.height * 0.06,
                    width: size.width * 0.42,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(color: const Color(0xffFFA95D), width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Back',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFFA95D),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // var values = previewapi();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PreviewTemplate()),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    height: size.height * 0.06,
                    width: size.width * 0.42,
                    decoration: BoxDecoration(
                      color: const Color(0xffFFA95D),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]));
  }

  Widget addlayer() {
    Size size = MediaQuery.of(context).size;

    return ListTile(
        title: Row(
            mainAxisAlignment: lycount == 10
                ? MainAxisAlignment.start
                : MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Layers',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff3B1D2C)),
              ),
              if (lycount < 10)
                GestureDetector(
                  child: Row(
                    children: const [
                      Icon(
                        Icons.add_circle,
                        color: Color(0xff3B1D2C),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Add Layer',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff3B1D2C),
                        ),
                      ),
                    ],
                  ),
                )
            ]),
        onTap: () {
          final Title = TextEditingController();
          final content = TextEditingController();
          final layer = Container(
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            maxLines: 1,
                            style: const TextStyle(fontSize: 18),
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              filled: true,
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffFFA95D), width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffFFA95D), width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              fillColor: const Color(0xffffffff),
                              focusedErrorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffFFA95D), width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffFFA95D), width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              contentPadding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              hintText: 'Enter layer name',
                              errorStyle:
                                  const TextStyle(fontSize: 10, height: 0.1),
                              hintStyle: TextStyle(
                                  color:
                                      const Color(0xff3B1D2C).withOpacity(0.6),
                                  fontWeight: FontWeight.normal),
                            ),
                            controller: Title,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // ignore: sized_box_for_whitespace
                        Container(
                          width: size.width * 0.45,
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            maxLines: 1,
                            style: const TextStyle(fontSize: 18),
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              filled: true,
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffFFA95D), width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffFFA95D), width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              fillColor: const Color(0xffffffff),
                              focusedErrorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffFFA95D), width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffFFA95D), width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              contentPadding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              hintText: 'Enter layer Content',
                              errorStyle:
                                  const TextStyle(fontSize: 10, height: 0.1),
                              hintStyle: TextStyle(
                                  color:
                                      const Color(0xff3B1D2C).withOpacity(0.6),
                                  fontWeight: FontWeight.normal),
                            ),
                            controller: content,
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
                            height: size.height * 0.2,
                            width: size.width * 0.4,
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.7, horizontal: 4.7),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: const Color(0xffFFA95D),
                                    width: 1.5)),
                            child: GridView.builder(
                                itemCount: 15,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 10,
                                        mainAxisExtent: size.height * 0.032,
                                        mainAxisSpacing: 5),
                                itemBuilder: (context, index) {
                                  ontap.add(false);
                                  return GestureDetector(
                                    onTap: () async {
                                      ontap.replaceRange(0, 15, [
                                        for (int i = 0; i <= 15; i++) false
                                      ]);

                                      setState(() {
                                        ontap[index] = true;
                                      });
                                    },
                                    child: Container(
                                      height: size.height * 0.013,
                                      width: size.width * 0.08,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xffFFD4AE)),
                                          color: ontap[index] == true
                                              ? const Color(0xffFFD4AE)
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                          child: Text(
                                        '${value[index]}',
                                        style: const TextStyle(
                                            color: Colors.black),
                                      )),
                                    ),
                                  );
                                })),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
          setState(() {
            _title.add(Title);
            _content.add(content);
            position.add(layer);
          });
        });
  }
}

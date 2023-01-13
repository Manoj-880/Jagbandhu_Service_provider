// ignore_for_file: prefer_final_fields, unused_field, prefer_typing_uninitialized_variables, non_constant_identifier_names, sized_box_for_whitespace, duplicate_ignore
import 'package:flutter/material.dart';
import 'package:jagbandhu_service_provider/models/globalParams.dart';
import 'package:jagbandhu_service_provider/pages/add_templates.dart';
import 'package:jagbandhu_service_provider/pages/assemble%20layers/add_image.dart';
import '../../sections/bottomNavBar.dart';

class AssembleLayers extends StatefulWidget {
  const AssembleLayers({super.key});

  @override
  State<AssembleLayers> createState() => _AssembleLayersState();
}

class _AssembleLayersState extends State<AssembleLayers> {
  int lycount = 0;
  //UserProfileData user = userdata[0];

  List<TextEditingController> _title = [];
  List<TextEditingController> _content = [];
  var position = [];
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
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.015,
          ),
          ListTile(
              title: Row(
                  mainAxisAlignment: lycount == 15
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
                    if (lycount < 15)
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
                var layer;
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return layer = Dialog(
                        child: addlayer_popup(
                            size: size,
                            Title: Title,
                            content: content,
                            lycount: lycount,
                            stat: false,
                            value: value),
                      );
                    }).then((value) {
                  if (Title.text.isNotEmpty && content.text.isNotEmpty) {
                    setState(() {
                      _title.add(Title);
                      _content.add(content);
                      position.add(layer);
                    });
                  }
                });
              }),
          SizedBox(
            height: size.height * 0.03,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _content.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    final Title =
                        TextEditingController(text: _title[index].text);
                    final content =
                        TextEditingController(text: _content[index].text);
                    var layer;
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return layer = Dialog(
                            child: addlayer_popup(
                                size: size,
                                Title: Title,
                                content: content,
                                lycount: lycount,
                                stat: true,
                                value: value),
                          );
                        }).then((value) {
                      if (Title.text.isNotEmpty && content.text.isNotEmpty) {
                        setState(() {
                          _title[index] = Title;
                          _content[index] = content;
                          position[index] = layer;
                        });
                      }
                    });
                  },
                  child: Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      width: size.width,
                      height: size.height * 0.08,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffffd0c9),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _title[index].text,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff3B1D2C),
                                ),
                              ),
                              Text(
                                _content[index].text,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff3B1D2C),
                                ),
                              ),
                            ],
                          ),
                          lypos.isEmpty
                              ? SizedBox()
                              : Text(
                                  '${lypos[index] + 1}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff3B1D2C),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        child: Padding(
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
                  print('move to preview');
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
                      'Preview',
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
      ),
    );
  }
}

class addlayer_popup extends StatefulWidget {
  addlayer_popup({
    Key? key,
    required this.size,
    required this.Title,
    required this.content,
    required this.value,
    required this.lycount,
    required this.stat,
  }) : super(key: key);

  final Size size;
  final TextEditingController Title;
  final TextEditingController content;
  final value;
  bool stat;
  int lycount;

  @override
  State<addlayer_popup> createState() => _addlayer_popupState();
}

List<bool> ontap = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false
];

final validatekey = GlobalKey<FormState>();

class _addlayer_popupState extends State<addlayer_popup> {
  @override
  int selectedindex = -1;
  Widget build(BuildContext context) {
    return Form(
      key: validatekey,
      child: SingleChildScrollView(
        child: Container(
          width: widget.size.width * 0.95,
          height: widget.size.height * 0.55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.stat == false
                    ? const Text(
                        'Enter Layer details',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff3B1D2C)),
                      )
                    : const Text(
                        'Update Layer details',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff3B1D2C)),
                      ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: widget.size.width,
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
                              hintText: 'Enter Title',
                              errorStyle:
                                  const TextStyle(fontSize: 10, height: 0.1),
                              hintStyle: TextStyle(
                                  color:
                                      const Color(0xff3B1D2C).withOpacity(0.6),
                                  fontWeight: FontWeight.normal),
                            ),
                            controller: widget.Title,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return '*This field is mandatory';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: widget.size.width,
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
                              hintText: 'Enter Content',
                              errorStyle:
                                  const TextStyle(fontSize: 10, height: 0.1),
                              hintStyle: TextStyle(
                                  color:
                                      const Color(0xff3B1D2C).withOpacity(0.6),
                                  fontWeight: FontWeight.normal),
                            ),
                            controller: widget.content,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return '*This field is mandatory';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widget.stat == false
                            ? const Text(
                                'Select position of the layer',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff3B1D2C)),
                              )
                            : const Text(
                                'Update position of the layer',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff3B1D2C)),
                              ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: widget.size.height * 0.2,
                          width: widget.size.width,
                          padding: const EdgeInsets.symmetric(
                              vertical: 4.7, horizontal: 4.7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: const Color(0xffFFA95D), width: 1.5)),
                          child: GridView.builder(
                            itemCount: 15,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 10,
                                    mainAxisExtent: widget.size.height * 0.032,
                                    mainAxisSpacing: 5),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () async {
                                  setState(() {
                                    if (selectedindex != -1) {
                                      ontap[selectedindex] =
                                          !ontap[selectedindex];
                                    }
                                    selectedindex = index;
                                    lypos.add(selectedindex);
                                    ontap[index] = !ontap[index];
                                  });
                                },
                                child: Container(
                                  height: widget.size.height * 0.013,
                                  width: widget.size.width * 0.08,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xffFFD4AE)),
                                      color: ontap[index]
                                          ? const Color(0xffFFD4AE)
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                      child: Text(
                                    '${widget.value[index]}',
                                    style: const TextStyle(color: Colors.black),
                                  )),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        ontap = [
                          false,
                          false,
                          false,
                          false,
                          false,
                          false,
                          false,
                          false,
                          false,
                          false,
                          false,
                          false,
                          false,
                          false,
                          false
                        ];
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: widget.size.width * 0.25,
                        height: widget.size.height * 0.05,
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffFFA95D)),
                            borderRadius:
                                BorderRadius.circular(widget.size.height)),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffFFA95D),
                          ),
                        ),
                      ),
                    ),
                    widget.stat == false
                        ? GestureDetector(
                            onTap: () async {
                              if (validatekey.currentState!.validate()) {
                                validatekey.currentState!.save();
                                ontap = [
                                  false,
                                  false,
                                  false,
                                  false,
                                  false,
                                  false,
                                  false,
                                  false,
                                  false,
                                  false,
                                  false,
                                  false,
                                  false,
                                  false,
                                  false
                                ];
                                Navigator.pop(context);
                                setState(() {
                                  widget.lycount++;
                                });
                                print(widget.lycount);
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: widget.size.width * 0.25,
                              height: widget.size.height * 0.05,
                              decoration: BoxDecoration(
                                  color: const Color(0xffFFA95D),
                                  borderRadius: BorderRadius.circular(
                                      widget.size.height)),
                              child: const Text(
                                'Add',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () async {
                              if (validatekey.currentState!.validate()) {
                                validatekey.currentState!.save();
                                ontap = [
                                  false,
                                  false,
                                  false,
                                  false,
                                  false,
                                  false,
                                  false,
                                  false,
                                  false,
                                  false,
                                  false,
                                  false,
                                  false,
                                  false,
                                  false
                                ];
                                Navigator.pop(context);

                                print(widget.lycount);
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: widget.size.width * 0.25,
                              height: widget.size.height * 0.05,
                              decoration: BoxDecoration(
                                  color: const Color(0xffFFA95D),
                                  borderRadius: BorderRadius.circular(
                                      widget.size.height)),
                              child: const Text(
                                'Update',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

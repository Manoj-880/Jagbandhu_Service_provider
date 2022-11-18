import 'package:flutter/material.dart';
import 'package:jagbandhu_service_provider/models/layers_model.dart';
import 'package:jagbandhu_service_provider/pages/assemble_layers.dart';

import '../sections/bottomNavBar.dart';

class AddTemplates extends StatefulWidget {
  const AddTemplates({super.key});

  @override
  State<AddTemplates> createState() => _AddTemplatesState();
}

class _AddTemplatesState extends State<AddTemplates> {
  List<bool> iscard = [];
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
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                // ignore: avoid_print
                print('Upload file');
              },
              child: Container(
                height: size.height * 0.15,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: const Color(0xffFFA95D), width: 2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.file_upload_outlined,
                      size: 30,
                      color: const Color(0xff3B1D2C).withOpacity(0.4),
                    ),
                    Text(
                      'Upload template layers',
                      style: TextStyle(
                        fontSize: 16,
                        color: const Color(0xff3B1D2C).withOpacity(0.4),
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              maxLines: 1,
              style: const TextStyle(fontSize: 18),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                filled: true,
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffFFA95D), width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffFFA95D), width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                fillColor: const Color(0xffffffff),
                contentPadding: const EdgeInsets.only(left: 20, right: 20),
                hintText: 'Title :',
                hintStyle: TextStyle(
                    color: const Color(0xff3B1D2C).withOpacity(0.4),
                    fontWeight: FontWeight.normal),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              maxLines: 5,
              style: const TextStyle(fontSize: 18),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                filled: true,
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffFFA95D), width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffFFA95D), width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                fillColor: const Color(0xffffffff),
                contentPadding:
                    const EdgeInsets.only(left: 20, right: 20, top: 20),
                hintText: 'Discription :',
                hintStyle: TextStyle(
                    color: const Color(0xff3B1D2C).withOpacity(0.4),
                    fontWeight: FontWeight.normal),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              maxLines: 1,
              style: const TextStyle(fontSize: 18),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                filled: true,
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffFFA95D), width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffFFA95D), width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                fillColor: const Color(0xffffffff),
                contentPadding: const EdgeInsets.only(left: 20, right: 20),
                hintText: 'Price :',
                hintStyle: TextStyle(
                    color: const Color(0xff3B1D2C).withOpacity(0.4),
                    fontWeight: FontWeight.normal),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                    left: 20, top: 10, right: 20, bottom: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: const Color(0xffFFA95D), width: 2),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Select editable layers :',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: const Color(0xff3B1D2C).withOpacity(0.4),
                          ),
                        ),
                        Text(
                          '4/${layersData.length}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: const Color(0xff3B1D2C).withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 10,
                        childAspectRatio: size.height * 0.003,
                        crossAxisSpacing: 10,
                      ),
                      physics: const ClampingScrollPhysics(),
                      itemCount: layersData.length,
                      itemBuilder: (context, index) {
                        iscard.add(false);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              iscard[index] = !iscard[index];
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xffFFA95D)),
                                borderRadius: BorderRadius.circular(20),
                                color: iscard[index]
                                    ? const Color(0xffF65D46)
                                    : Colors.white),
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              layersData[index].name.trim(),
                              style: TextStyle(
                                  fontSize: 12,
                                  color: iscard[index]
                                      ? Colors.white
                                      : const Color(0xff3B1D2C)),
                            ),
                          ),
                        );
                      },
                    )),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AssembleLayers()),
                );
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
                    'Assemble Layers',
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
    );
  }
}

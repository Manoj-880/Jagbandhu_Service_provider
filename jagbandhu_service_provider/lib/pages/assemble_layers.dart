import 'package:flutter/material.dart';
import 'package:jagbandhu_service_provider/pages/add_templates.dart';
import 'package:jagbandhu_service_provider/pages/preview_template.dart';

import '../models/layers_model.dart';
import '../sections/bottomNavBar.dart';

class AssembleLayers extends StatefulWidget {
  const AssembleLayers({super.key});

  @override
  State<AssembleLayers> createState() => _AssembleLayersState();
}

class _AssembleLayersState extends State<AssembleLayers> {
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
          'Assemble Layers',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              height: size.height * 0.3,
              width: size.width,
              margin: const EdgeInsets.only(top: 20, bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xffFFA95D), width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Note :',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff3B1D2C),
                  ),
                ),
                // ignore: sized_box_for_whitespace
                Container(
                  width: size.width * 0.78,
                  child: const Text(
                    'Tap and move the layers to replace and make a template',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Color(0xff3B1D2C),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
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
                    Text(
                      'Uploaded layers :',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xff3B1D2C).withOpacity(0.4),
                      ),
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
                        return GestureDetector(
                          onTap: () {
                            setState(() {});
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xffFFA95D)),
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              layersData[index].name.trim(),
                              style: const TextStyle(
                                  fontSize: 12, color: Color(0xff3B1D2C)),
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
            Row(
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
                        'Edit Template',
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
            )
          ],
        ),
      ),
    );
  }
}

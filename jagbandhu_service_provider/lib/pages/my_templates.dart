import 'package:flutter/material.dart';
import 'package:jagbandhu_service_provider/models/my_templates_model.dart';
import 'package:jagbandhu_service_provider/sections/bottomnavbar.dart';

import 'add_templates.dart';

class MyTemplates extends StatefulWidget {
  const MyTemplates({super.key});

  @override
  State<MyTemplates> createState() => _MyTemplatesState();
}

class _MyTemplatesState extends State<MyTemplates> {
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
          'My Templates',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 15,
                  mainAxisExtent: size.height * 0.16,
                  crossAxisSpacing: 5,
                ),
                itemCount: mytemplatesData.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    child: Container(
                      padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(mytemplatesData[index].image),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            mytemplatesData[index].price,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: Color(0xff3B1D2C)),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(
        index: 2,
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          // ignore: avoid_print
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTemplates()),
          );
        },
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          color: const Color(0xffF65D46),
          child: const Icon(
            Icons.add_rounded,
            color: Colors.white,
            size: 50,
          ),
        ),
      ),
    );
  }
}

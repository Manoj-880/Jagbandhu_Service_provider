// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:jagbandhu_service_provider/api_calls/add_template_api.dart';
import 'package:jagbandhu_service_provider/models/imagepicker_cropper.dart';
import 'package:jagbandhu_service_provider/models/user_details_model.dart';
import 'package:jagbandhu_service_provider/pages/assemble%20layers/assemble_layers.dart';
import 'package:jagbandhu_service_provider/sections/bottomNavBar.dart';

class AddBackground extends StatefulWidget {
  String? title, description, price, categorey;
  AddBackground({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.categorey,
  });

  @override
  State<AddBackground> createState() => _AddBackgroundState();
}

class _AddBackgroundState extends State<AddBackground> {
  UserProfileData user = userdata[0];
  var image;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(index: -1),
      appBar: AppBar(
        toolbarHeight: size.height * 0.1,
        elevation: 0,
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xffFFA95D),
        centerTitle: true,
        title: const Text(
          'Add Background Image',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                await Utils.pickImageFromGallery().then((pickedFile) async {
                  // Step #2: Check if we actually picked an image. Otherwise -> stop;
                  if (pickedFile == null) return;

                  // Step #3: Crop earlier selected image
                  await Utils.cropSelectedImage(pickedFile.path)
                      .then((croppedFile) {
                    // Step #4: Check if we actually cropped an image. Otherwise -> stop;
                    if (croppedFile == null) return;

                    // Step #5: Display image on screen
                    setState(() {
                      image = croppedFile;
                    });
                  });
                });
              },
              child: Container(
                height: size.height * 0.1,
                width: size.width,
                margin: EdgeInsets.only(
                    right: 20, left: 20, top: size.height * 0.03),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffFFA95D)),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.file_upload_outlined),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      image == null
                          ? 'Add background Imge for template'
                          : 'Change background Image',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff3B1D2C),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (image != null)
              Container(
                child: Column(
                  children: [
                    Container(
                      height: size.height * 0.4,
                      width: size.width,
                      clipBehavior: Clip.hardEdge,
                      margin: const EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: Image.file(image!),
                    ),
                    GestureDetector(
                      onTap: () {
                        addtemplateapi(
                          user.id,
                          widget.categorey,
                          widget.title,
                          widget.description,
                          widget.price,
                          image ?? '',
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AssembleLayers()),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin:
                            const EdgeInsets.only(left: 40, right: 40, top: 20),
                        height: size.height * 0.08,
                        width: size.width,
                        decoration: BoxDecoration(
                            color: const Color(0xfff65d46),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          'Add Template',
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
              ),
          ],
        ),
      ),
    );
  }
}

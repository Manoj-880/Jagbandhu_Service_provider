import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jagbandhu_service_provider/models/user_details_model.dart';
import 'package:jagbandhu_service_provider/pages/add_templates.dart';
import 'package:jagbandhu_service_provider/pages/assemble%20layers/assemble_layers.dart';
import 'package:jagbandhu_service_provider/pages/my_templates.dart';
import 'package:jagbandhu_service_provider/pages/profile.dart';
import '../sections/bottomNavBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserProfileData user = userdata[0];

  @override
  Widget build(BuildContext context) {
    var image = base64.decode(user.image);
    print(user);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_image.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.2,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/dashboard_top.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Welcome',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Hi,',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              user.firstName!,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyProfile()),
                        );
                      },
                      child: CircleAvatar(
                        backgroundImage: MemoryImage(image),
                        radius: 40,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          // ignore: sort_child_properties_last
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                'Templates Created',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff3B1D2C)),
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 40),
                                // ignore: sort_child_properties_last
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: size.height * 0.1,
                                      width: size.height * 0.1,
                                      // ignore: sort_child_properties_last
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          const Text(
                                            '20',
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff3B1D2C)),
                                          ),
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              size.height * 0.05),
                                          color: const Color(0xffF5D7D2)),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        // ignore: use_build_context_synchronously
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const AssembleLayers()),
                                        );
                                      },
                                      // ignore: avoid_unnecessary_containers
                                      child: Container(
                                        child: Column(
                                          children: [
                                            const Icon(
                                              Icons.add_circle_rounded,
                                              size: 40,
                                              color: const Color(0xffF65D46),
                                            ),
                                            // ignore: sized_box_for_whitespace
                                            Container(
                                              width: size.width * 0.15,
                                              child: const Text(
                                                'Add new template',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Color(0xff3B1D2C)),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: const Color(0xffF5B8AF),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          // ignore: sort_child_properties_last
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                'Profile Insights',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff3B1D2C)),
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    top: 10, bottom: 10, left: 40, right: 50),
                                // ignore: sort_child_properties_last
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: size.height * 0.1,
                                      width: size.height * 0.1,
                                      // ignore: sort_child_properties_last
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          const Text(
                                            '20',
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff3B1D2C)),
                                          ),
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              size.height * 0.05),
                                          color: const Color(0xffF5D7D2)),
                                    ),
                                    Column(
                                      children: const [
                                        Text(
                                          'Profile viewers',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff3B1D2C)),
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          'Today',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w900,
                                              color: Color(0xff3B1D2C)),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: const Color(0xffF5B8AF),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          // ignore: sort_child_properties_last
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Recent Post',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff3B1D2C)),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      // ignore: use_build_context_synchronously
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MyTemplates()),
                                      );
                                    },
                                    child: const Text(
                                      'View all',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffF65D46)),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    top: 10, bottom: 10, left: 20, right: 20),
                                // ignore: sort_child_properties_last
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Card(
                                      elevation: 5,
                                      child: Image.asset(
                                        'assets/images/invitation.png',
                                        width: size.width * 0.15,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Template name',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff3B1D2C)),
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          'Discription',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300,
                                              color: Color(0xff3B1D2C)),
                                        )
                                      ],
                                    ),
                                    // ignore: avoid_unnecessary_containers
                                    Container(
                                      child: Row(
                                        children: const [
                                          Text(
                                            '33',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                                color: Color(0xff3B1D2C)),
                                          ),
                                          Icon(
                                            Icons.file_download_outlined,
                                            size: 14,
                                            color: Color(0xff3B1D2C),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: const Color(0xffF5B8AF),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(
        index: 0,
      ),
    );
  }
}

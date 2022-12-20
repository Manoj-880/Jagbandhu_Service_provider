import 'package:flutter/material.dart';
import 'package:jagbandhu_service_provider/api_calls/edit_profile_api.dart';
import 'package:jagbandhu_service_provider/models/user_details_model.dart';
import 'package:jagbandhu_service_provider/pages/edit_profile.dart';
import 'package:jagbandhu_service_provider/pages/login.dart';
import '../sections/bottomNavBar.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  UserProfileData user = userdata[0];
  bool basicinfo = true;
  bool bankdetails = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(
        index: 3,
      ),
      appBar: AppBar(
        toolbarHeight: size.height * 0.1,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffFFA95D),
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              icon: const Icon(Icons.logout_rounded),
              iconSize: 30,
            ),
          )
        ],
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.25,
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
                  Text(
                    user.firstName! + user.lastname!,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff3B1D2C),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                  GestureDetector(
                    onTap: () {
                      var values = edit_profile_api();
                      // ignore: avoid_print
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfile()),
                      );
                    },
                    child: const Text(
                      'Edit profile',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Color(0xffF65D46),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: size.height * 0.085,
              width: size.width,
              color: const Color(0xffF5B8AF).withOpacity(0.7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        basicinfo = true;

                        bankdetails = false;
                      });
                    },
                    child: Container(
                      height: size.height * 0.055,
                      width: size.width * 0.4,
                      decoration: BoxDecoration(
                        color: const Color(0xffFFA95D),
                        borderRadius: BorderRadius.circular(size.height),
                      ),
                      child: const Center(
                        child: Text(
                          'Basic Information',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        basicinfo = false;
                        bankdetails = true;
                      });
                    },
                    child: Container(
                      height: size.height * 0.055,
                      width: size.width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.height),
                      ),
                      child: const Center(
                        child: Text(
                          'Bank Details',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Color(0xff3B1D2C),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (basicinfo == true)
              Profile_basic()
            else if (bankdetails == true)
              const Profile_bank()
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class Profile_basic extends StatelessWidget {
  Profile_basic({
    Key? key,
  }) : super(key: key);
  UserProfileData user = userdata[0];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'First name :',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff3B1D2C),
                  ),
                ),
                const SizedBox(
                  width: 18,
                ),
                Text(
                  user.firstName!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff3B1D2C),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  'Last name :',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff3B1D2C),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  user.lastname!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff3B1D2C),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  'DOB :',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff3B1D2C),
                  ),
                ),
                const SizedBox(
                  width: 63,
                ),
                Text(
                  user.dob!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff3B1D2C),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  'Gender :',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff3B1D2C),
                  ),
                ),
                const SizedBox(
                  width: 47,
                ),
                Text(
                  user.gender!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff3B1D2C),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Email :',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff3B1D2C),
                  ),
                ),
                const SizedBox(
                  width: 58,
                ),
                Container(
                  width: 200,
                  child: Text(
                    user.email!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Color(0xff3B1D2C),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'Mobile\nnumber :',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff3B1D2C),
                  ),
                ),
                const SizedBox(
                  width: 47,
                ),
                Text(
                  user.phonenumber!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff3B1D2C),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Address :',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff3B1D2C),
                  ),
                ),
                const SizedBox(
                  width: 42,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "address",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff3B1D2C),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      user.city!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff3B1D2C),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      user.state!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff3B1D2C),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      user.country!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff3B1D2C),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class Profile_bank extends StatelessWidget {
  const Profile_bank({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Bank name :',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff3B1D2C),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Acount number :',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff3B1D2C),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'IFSC Code :',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff3B1D2C),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Bank name',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff3B1D2C),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Account number',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff3B1D2C),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'IFSC Code',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff3B1D2C),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

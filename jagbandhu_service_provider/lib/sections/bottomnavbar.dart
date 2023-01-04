// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:jagbandhu_service_provider/pages/earnings.dart';
import 'package:jagbandhu_service_provider/pages/my_templates.dart';

import '../pages/home_page.dart';
import '../pages/profile.dart';
import 'dart:math' as math;

class BottomNavBar extends StatefulWidget {
  final int? index;
  const BottomNavBar({super.key, this.index});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int _selectedIndex;
  @override
  BottomNavigationBar build(BuildContext context) {
    _selectedIndex = widget.index!;
    return (_selectedIndex == -1)
        ? BottomNavigationBar(
            backgroundColor: const Color(0xffFFA95D),
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                // iconFun(path:Icons.home,context: context )
                icon: Icon(
                  Icons.home_rounded,
                  color: Colors.white60,
                  size: 40,
                ),
                activeIcon: Icon(
                  Icons.home_rounded,
                  color: Colors.white60,
                  size: 40,
                ),
                label: 'Home',
                //  backgroundColor: Colors.red,
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_balance_wallet_rounded,
                  color: Colors.white60,
                  size: 40,
                ),
                activeIcon: Icon(
                  Icons.account_balance_wallet_rounded,
                  color: Colors.white,
                  size: 30,
                ),
                label: 'Earnings',
              ),
              BottomNavigationBarItem(
                icon: Transform(
                  transform: Matrix4.rotationZ(math.pi),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.style_rounded,
                    color: Colors.white60,
                    size: 40,
                  ),
                ),
                activeIcon: Transform(
                  transform: Matrix4.rotationZ(math.pi),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.style_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                label: 'My Templates',
                // backgroundColor: Colors.purple,
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_rounded,
                  color: Colors.white60,
                  size: 40,
                ),
                activeIcon: Icon(
                  Icons.person_rounded,
                  color: Colors.white,
                  size: 30,
                ),
                label: 'Profile',
                //   backgroundColor: Colors.pink,
              ),
            ],
            selectedItemColor: Colors.white60,

            //unselectedItemColor: Colors.transparent,
            onTap: (index) async {
              setState(() {
                _selectedIndex = index;
              });
              navigatetopage(_selectedIndex);
              // ignore: avoid_print
              print(_selectedIndex);
            })
        : BottomNavigationBar(
            backgroundColor: const Color(0xffFFA95D),
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                // iconFun(path:Icons.home,context: context )
                icon: Icon(
                  Icons.home_rounded,
                  color: Colors.white60,
                  size: 40,
                ),
                activeIcon: Icon(
                  Icons.home_rounded,
                  color: Colors.white,
                  size: 30,
                ),
                label: 'Home',
                //  backgroundColor: Colors.red,
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_balance_wallet_rounded,
                  color: Colors.white60,
                  size: 40,
                ),
                activeIcon: Icon(
                  Icons.account_balance_wallet_rounded,
                  color: Colors.white,
                  size: 30,
                ),
                label: 'Earnings',
              ),
              BottomNavigationBarItem(
                icon: Transform(
                  transform: Matrix4.rotationZ(math.pi),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.style_rounded,
                    color: Colors.white60,
                    size: 40,
                  ),
                ),
                activeIcon: Transform(
                  transform: Matrix4.rotationZ(math.pi),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.style_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                label: 'My Templates',
                // backgroundColor: Colors.purple,
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_rounded,
                  color: Colors.white60,
                  size: 40,
                ),
                activeIcon: Icon(
                  Icons.person_rounded,
                  color: Colors.white,
                  size: 30,
                ),
                label: 'Profile',
                //   backgroundColor: Colors.pink,
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            //unselectedItemColor: Colors.transparent,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
              navigatetopage(_selectedIndex);
              // ignore: avoid_print
              print(_selectedIndex);
            });
  }

  navigatetopage(index) async {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
    if (index == 1) {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Earnings()),
      );
    }
    if (index == 2) {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyTemplates()),
      );
    }
    if (index == 3) {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyProfile()),
      );
    }
  }
}

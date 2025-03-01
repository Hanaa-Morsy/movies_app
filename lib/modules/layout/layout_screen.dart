import 'package:flutter/material.dart';
import 'package:movies_app/modules/layout/browse/browse.dart';
import 'package:movies_app/modules/layout/home/home_screen.dart';
import 'package:movies_app/modules/layout/profile/profile.dart';
import 'package:movies_app/modules/layout/search/search.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  static const String routeName = 'layout';

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int selectedIndex = 0;
  List<Widget> screens = [
    Home(),
    Search(),
    Browse(),
    Profile(),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121312),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: BottomNavigationBar(


              backgroundColor: Color(0xff282A28),
              fixedColor: Colors.white,
              type: BottomNavigationBarType.fixed,

              onTap: (value) {
                selectedIndex = value;
                setState(() {});
              },
              currentIndex: selectedIndex,
              items: [
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.home_filled,
                color:
                    selectedIndex == 0 ? Color(0xffF6BD00) : Colors.white,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.search,
                color:
                    selectedIndex == 1 ? Color(0xffF6BD00) : Colors.white,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.open_in_browser_outlined,
                color:
                    selectedIndex == 2 ? Color(0xffF6BD00) : Colors.white,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.person_pin,
                color:
                    selectedIndex == 3 ? Color(0xffF6BD00) : Colors.white,
              ),
            ),
          ]),
        ),
    body: screens[selectedIndex],);
  }
}

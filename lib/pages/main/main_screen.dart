import 'package:flutter/material.dart';
import 'package:medhealth/pages/history/history_screen.dart';
import 'package:medhealth/pages/home/home_screen.dart';
import 'package:medhealth/pages/profile/profile.dart';
import 'package:medhealth/utils/constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
   int selectIndex = 0;

  final pageList = [
    const HomeScreen(),
    const HistoryScreen(),
    const ProfileScreen(),
  ];

  onTappedItem(int index) {
    setState(() {
      selectIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: pageList.elementAt(selectIndex),
      bottomNavigationBar: BottomNavigationBar(
        items:const  [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment), label: "History"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_rounded), label: "Profile"),
        ],
        currentIndex: selectIndex,
        onTap: onTappedItem,
        unselectedItemColor: grey35Color,
      ),
    );
  }
}
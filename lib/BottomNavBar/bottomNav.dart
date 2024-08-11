// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:IcarePro/ProfilePage/profilePage.dart';
import 'package:IcarePro/Test/labTest.dart';
import 'package:IcarePro/consult/quickConsult.dart';
import 'package:IcarePro/home/homeScreen.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int index = 0;
  final NotchBottomBarController _controller =
      NotchBottomBarController(index: 0);
  final List<Widget> bottomBarPages = [
    Homescreen(),
    LabTest(),
    QuickConsult(),
    Profilepage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: AnimatedNotchBottomBar(
        /// Provide NotchBottomBarController
        blurOpacity: double.infinity,
        notchBottomBarController: _controller,
        color: Colors.greenAccent,
        showLabel: true,
        textOverflow: TextOverflow.visible,
        maxLine: 1,
        shadowElevation: 5,
        kBottomRadius: 28.0,

        notchShader: const SweepGradient(
          startAngle: 0,
          endAngle: 3.14 / 2,
          colors: [Colors.red, Colors.green, Colors.orange],
          tileMode: TileMode.mirror,
        ).createShader(Rect.fromCircle(center: Offset.zero, radius: 8.0)),
        notchColor: Colors.black87,

        /// restart app if you change removeMargins
        removeMargins: false,
        // bottomBarWidth: 500,
        showShadow: false,
        durationInMilliSeconds: 300,

        itemLabelStyle: const TextStyle(fontSize: 10),

        elevation: 1,
        bottomBarItems: const [
          BottomBarItem(
            inActiveItem: Icon(
              Icons.home_filled,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.home_filled,
              color: Colors.blueAccent,
            ),
            itemLabel: 'Home',
          ),
          BottomBarItem(
            inActiveItem:
                Icon(CupertinoIcons.lab_flask, color: Colors.blueGrey),
            activeItem: Icon(
              CupertinoIcons.lab_flask,
              color: Colors.blueAccent,
            ),
            itemLabel: 'Lab Test',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              CupertinoIcons.captions_bubble,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              CupertinoIcons.captions_bubble,
              color: Colors.pink,
            ),
            itemLabel: 'Consult',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.person,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.person,
              color: Colors.yellow,
            ),
            itemLabel: 'Profile',
          ),
        ],
        onTap: (idx) {
          log('current selected index $idx');
          setState(() {
            index = idx;
          });
        },
        kIconSize: 24.0,
      ),
      body: bottomBarPages[index],
    );
  }
}

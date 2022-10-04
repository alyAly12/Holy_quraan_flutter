import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:holy_quraan/screen/audio_screen.dart';
import 'package:holy_quraan/screen/home%20page.dart';
import 'package:holy_quraan/screen/prayer_screen.dart';
import 'package:holy_quraan/screen/quraanscreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  int selectindex=0;
  final List<Widget>_list=[
    const HomeScreen(),
    const QuranScreen(),
    AudioScreen(),
    const PrayerScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: _list[selectindex],
          backgroundColor: Colors.white,
            bottomNavigationBar: ConvexAppBar(
              backgroundColor: const Color(0xff050D2C),
              activeColor: const Color(0xff8E9CD3),
              items: [
                TabItem(icon: Image.asset('images/icons8-mosque-130.png',fit: BoxFit.scaleDown,), title: 'Home'),
                TabItem(icon: Image.asset('images/icons8-quran-64.png'), title: 'Quran'),
                TabItem(icon: Image.asset('images/icons8-prayer-beads-96.png'), title: 'praise'),
                TabItem(icon: Image.asset('images/icons8-muslim-muslim-praying-prayer-islam-faith-mindful-128.png'), title: 'Prayer'),
              ],
              initialActiveIndex: 0,//optional, default as 0
              onTap: UpdateIndex,
            ),
        ),
    );
  }
  void UpdateIndex(index){
    setState(() {
      selectindex=index;
    });
  }
}




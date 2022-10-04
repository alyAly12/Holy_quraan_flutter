import 'package:flutter/material.dart';
import 'package:holy_quraan/constants/constant.dart';
import 'package:holy_quraan/screen/audio_screen.dart';
import 'package:holy_quraan/screen/juzscreen.dart';
import 'package:holy_quraan/screen/prayer_screen.dart';
import 'package:holy_quraan/screen/splashpage.dart';
import 'package:holy_quraan/screen/surahdetail.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Holly Quraan',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff8E9CD3),
        primarySwatch: Constant.kSwatchColor,
        primaryColor: Constant.kPrimary,
      ),
      home: const SplashPage(),
      routes: {
        JuzScreen.id:(context)=>JuzScreen(),
        SurahDetail.id:(context)=>const SurahDetail(),
        PrayerScreen.id:(context)=>const PrayerScreen(),
        AudioScreen.id:(context)=>const AudioScreen(),


      },
    );
  }
}


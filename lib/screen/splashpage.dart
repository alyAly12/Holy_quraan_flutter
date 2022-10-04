import 'dart:async';

import 'package:flutter/material.dart';
import 'package:holy_quraan/screen/mainscreen.dart';
import 'package:holy_quraan/screen/onbaordingscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  bool alreadyUsed=false;

  void getData()async{
    final prefs = await SharedPreferences.getInstance();
   alreadyUsed=prefs.getBool('alreadyUsed')?? false;
  }

  @override
  void initState() {
    super.initState();
    getData();
    Timer(const Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder:
                (context)=>alreadyUsed?const MainScreen(): const OnboardingScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              const Center(
                child: Text(
                  'Quran kareem',
                  style: TextStyle(
                      color: Colors.black,fontSize: 30
                ),
                  ),
              ),
              Positioned(
                bottom: 0,
                  left: 0,
                  right: 0,
                  child:Image.asset('images/—Pngtree—mosque transparent illustration_5435718.png')
              )
            ],
          ),
        )
    );
  }
}

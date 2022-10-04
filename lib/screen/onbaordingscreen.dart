import 'package:flutter/material.dart';
import 'package:holy_quraan/constants/constant.dart';
import 'package:holy_quraan/screen/mainscreen.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: 'القرآن الكريم',
            bodyWidget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('اقرأ القرآن',style: TextStyle(fontSize: 18),),
              ],
            ),
            image: Center(child: Image.asset('images/—Pngtree—ramadan kareem background with quran_5366067.png',fit: BoxFit.fitWidth,)),
          ),
          PageViewModel(
            title: 'أوقات الصلاة',
            bodyWidget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('اختر أذانك والصلاة التي تريد إعلامك بها',style: TextStyle(fontSize: 18),),
              ],
            ),
            image: Center(child: Image.asset('images/hand drawn cartoon praying ramadan_5351151.png',fit: BoxFit.fitWidth,)),
          ),
          PageViewModel(
            title: 'عادات أفضل',
            bodyWidget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('اجعل يومك مليئًا بالعادات الإسلامية',style: TextStyle(fontSize: 18),),
              ],
            ),
            image: Center(child: Image.asset('images/young man giving food or_7418572.png',fit: BoxFit.fitWidth,)),
          ),
        ],
        onDone: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const MainScreen()));
        },
        showBackButton: false,
        showNextButton: true,
        next: const Icon(
          Icons.navigate_next,
          color: Colors.black,
        ),
        done: const Text("Done",
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: Constant.kPrimary,
            color: Colors.grey,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
      ),
    ));
  }
}





import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



import '../models/api_screen.dart';



class PrayerScreen extends StatefulWidget {

  static const String id='Prayer_screen';
  const PrayerScreen({Key? key}) : super(key: key);
  @override
  State<PrayerScreen> createState() => _PrayerScreenState();
}
class _PrayerScreenState extends State<PrayerScreen> {

  ApiService apiService =ApiService();

  @override
  Widget build(BuildContext context) {
    final myCoordinates = Coordinates(31.205753, 29.924526);
    final params= CalculationMethod.egyptian.getParameters();
    params.madhab=Madhab.hanafi;
    final prayerTimes=PrayerTimes.today(myCoordinates, params);
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white70,
          body:Container(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            margin: const EdgeInsets.all(16),
            child: ListView(
              padding: const EdgeInsets.all(8),
              children:<Widget> [
                const SizedBox(height: 50,child: Center(child: Text('PrayerTimes   أوقات الصلاة',
                  style:TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff050D2C)
                  ) 
                  ,)
                  ,),
                ),
                const SizedBox(height: 15,),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(25),
                    color: const Color(0xff050D2C)
                  ),
                  child: Center(
                    child: Text('Fajr ${DateFormat.jm().format(prayerTimes.fajr)} الفجر ',
                      style:const TextStyle(
                        letterSpacing: 1,
                        wordSpacing: 3,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white70
                      ) ,
                    ),
                  ),
                  ),
                const SizedBox(height: 25,),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(25),
                      color: const Color(0xff050D2C)
                  ),
                  child: Center(
                    child: Text('Sunrise ${DateFormat.jm().format(prayerTimes.sunrise)} الضحي',
                      style:const TextStyle(
                          letterSpacing: 1,
                          wordSpacing: 3,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white70
                      ) ,
                    ),
                  ),
                ),
                const SizedBox(height: 25,),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(25),
                      color: const Color(0xff050D2C)
                  ),
                  child: Center(
                    child: Text('Duhr ${DateFormat.jm().format(prayerTimes.dhuhr)}  الظهر',
                      style:const TextStyle(
                          letterSpacing: 1,
                          wordSpacing: 3,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white70
                      ) ,
                    ),
                  ),
                ),
                const SizedBox(height: 25,),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(25),
                      color: const Color(0xff050D2C)
                  ),
                  child: Center(
                    child: Text('Asr ${DateFormat.jm().format(prayerTimes.asr)}  العصر',
                      style:const TextStyle(
                          letterSpacing: 1,
                          wordSpacing: 3,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white70
                      ) ,
                    ),
                  ),
                ),
                const SizedBox(height: 25,),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(25),
                      color: const Color(0xff050D2C)
                  ),
                  child: Center(
                    child: Text('Maghrib ${DateFormat.jm().format(prayerTimes.maghrib)}  المغرب',
                      style:const TextStyle(
                          letterSpacing: 1,
                          wordSpacing: 3,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white70
                      ) ,
                    ),
                  ),
                ),
                const SizedBox(height: 25,),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(25),
                      color: const Color(0xff050D2C)
                  ),
                  child: Center(
                    child: Text('Isha ${DateFormat.jm().format(prayerTimes.isha)}  العشاء',
                      style:const TextStyle(
                          letterSpacing: 1,
                          wordSpacing: 3,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white70
                      ) ,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:holy_quraan/models/api_screen.dart';
import 'package:holy_quraan/models/ayaOftheDay.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final ApiService _apiService=ApiService();
  AyaOfTheDay?data;

  void setData()async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('alreadyUsed', true);
  }

  @override
  void initState() {
    super.initState();
    setData();
  }

  @override
  Widget build(BuildContext context) {
    HijriCalendar.setLocal('ar');
    var _hijri =HijriCalendar.now();
    var day=DateTime.now();
    var format = DateFormat('EEE , d MMM yyyy');
    var _size=MediaQuery.of(context).size;
    var Formatted= format.format(day);
    


    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                height: _size.height*0.22,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/new.png.png'),
                    fit: BoxFit.cover
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Formatted,style: const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                    RichText(
                        text: TextSpan(
                          children:<InlineSpan> [
                            WidgetSpan(
                              child: Padding(padding: const EdgeInsets.all(4.0),
                              child:Text(_hijri.hDay.toString(),style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),
                              ),
                              ),
                            ),
                            WidgetSpan(
                              child: Padding(padding: const EdgeInsets.all(4.0),
                                child: Text(_hijri.longMonthName,style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),
                                ),
                              )
                            ),
                            WidgetSpan(
                              child: Padding(padding: const EdgeInsets.all(4.0),
                              child: Text('${_hijri.hYear}AH',style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),
                              ),
                              ),
                            ),
                          ]
                        )
                    ),
                  ],
                ),
              ),
              Expanded(
                  child:SingleChildScrollView(
                    padding: const EdgeInsetsDirectional.only(top: 10,bottom: 20),
                    child: Column(
                      children: [
                        FutureBuilder<AyaOfTheDay>(
                          future:_apiService.getAyaOfTheDay().then((value) => data=value),
                          builder: (context,snapshot){
                            switch(snapshot.connectionState){
                              case ConnectionState.none:
                                return const Icon(Icons.sync_problem);
                              case ConnectionState.waiting:
                              case ConnectionState.active:
                                return const CircularProgressIndicator();
                              case ConnectionState.done:
                                return Container(
                                  margin: const EdgeInsets.all(16),
                                  padding: const EdgeInsetsDirectional.all(20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(32),
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 3,
                                        spreadRadius: 1,
                                        offset: Offset(0, 1)
                                      )
                                    ]
                                  ),
                                  child: Column(
                                    children: [
                                      const Text(
                                        'آية اليوم',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      const Divider(color: Colors.black,thickness: 0.5,),

                                      Text(
                                        '${snapshot.data?.arText}',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),

                                      Text(
                                        '${snapshot.data?.enTran}',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      RichText(
                                          text:TextSpan(
                                              children:<InlineSpan> [
                                                WidgetSpan(
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text(
                                                         '${snapshot.data?.suraNumber}',style: const TextStyle(
                                                        fontWeight: FontWeight.bold
                                                      ),
                                                      ),
                                                    )
                                                ),
                                                WidgetSpan(
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text(
                                                          '${snapshot.data?.suraName}',style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold
                                                      ),
                                                      ),
                                                    )
                                                ),
                                              ]
                                          )
                                      ),
                                    ],
                                  ),
                                );
                            }
                          },
                        ),

                      ],
                    ),
                  )
              ),
            ],
          )
        )
    );
  }
}

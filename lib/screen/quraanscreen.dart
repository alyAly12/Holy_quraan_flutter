import 'package:flutter/material.dart';
import 'package:holy_quraan/constants/sajdacustome.dart';
import 'package:holy_quraan/models/api_screen.dart';
import 'package:holy_quraan/screen/juzscreen.dart';
import 'package:holy_quraan/screen/surahdetail.dart';

import '../constants/constant.dart';
import '../constants/surahcustomlist.dart';
import '../models/sajda.dart';
import '../models/surah.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({Key? key}) : super(key: key);

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {

  ApiService apiService=ApiService();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
        length: 3,
        child: SafeArea(
            child:Scaffold(
              appBar: AppBar(
                backgroundColor: const Color(0xff050D2C),
                title: const Text('القرآن',style: TextStyle(
                    fontWeight: FontWeight.w900,fontFamily: 'fonts/Poppins-Bold.ttf',fontSize: 25,
                ),
                ),
                centerTitle: true,
                bottom: const TabBar(
                    tabs:[
                      Text(
                          'سورة',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'سجدة',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'جزء',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                      ),
                      ),
                    ]
                ),
              ),
              body: TabBarView(
                  children: <Widget>[
                    FutureBuilder(
                      future: apiService.getSurah(),
                        builder:(BuildContext context,AsyncSnapshot<List<Surah>>snapshot){
                          if(snapshot.hasData){List<Surah>? surah=snapshot.data;
                            return ListView.builder(
                              itemCount: surah!.length,
                                itemBuilder:(context,index)=>SurahCustomListTitle(surah:surah[index],
                                context:context,ontap:(){
                                  setState(() {
                                    Constant.surahIndex =(index+1);
                                  });
                                  Navigator.pushNamed(context, SurahDetail.id);
                                    }
                                ),
                            );
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                    ),
                    FutureBuilder(
                      future: apiService.getSajda(),
                        builder: (context,AsyncSnapshot<SajdaList>snapshot){
                        if(snapshot.hasError){
                          return const Center(child: Text('something went wrong'),);
                        }
                        if(snapshot.connectionState==ConnectionState.waiting){
                          return const Center(child: CircularProgressIndicator(),);
                        }
                        return ListView.builder(
                          itemCount: snapshot.data!.sajdaAyahs.length,
                            itemBuilder: (context ,index)=>SajdaCustomTitle(snapshot.data!.sajdaAyahs[index], context)
                        );
                        }
                    ),
                   GestureDetector(
                     child: Container(
                       padding: const EdgeInsets.all(8.0),
                       child: GridView.builder(
                           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                           itemCount: 30,
                           itemBuilder: (context,index){
                             return GestureDetector(
                               onTap: (){
                                 setState(() {
                                   Constant.juzIndex=(index+1);
                                 });
                                 Navigator.pushNamed(context,JuzScreen.id );
                               },
                               child: Card(
                                 elevation: 4,
                                 color: Colors.blueGrey,
                                 child: Center(
                                   child: Text('${index+1}',style: const TextStyle(color: Colors.white,fontSize: 20),),
                                 ),
                               ),
                             );
                           }
                       ),
                     ),
                   )
                  ]
              ),
            )
        ),
    );
  }
}

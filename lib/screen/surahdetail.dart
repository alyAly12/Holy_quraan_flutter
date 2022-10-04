import 'package:flutter/material.dart';
import 'package:holy_quraan/constants/constant.dart';
import 'package:holy_quraan/constants/customtranslation.dart';
import 'package:holy_quraan/models/api_screen.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

import '../models/surahtranslation.dart';

enum Translation{Spanish,german,english,french}

class SurahDetail extends StatefulWidget {
  const SurahDetail({Key? key}) : super(key: key);

  static const String id='surahDetail_screen';

  @override
  State<SurahDetail> createState() => _SurahDetailState();
}

class _SurahDetailState extends State<SurahDetail> {
  SolidController _controller = SolidController();
  ApiService apiService=ApiService();
  Translation? _translation= Translation.english;
  @override
  Widget build(BuildContext context) {
    print(_translation!.index);
    return Scaffold(
      body: FutureBuilder(
        future: apiService.getTranslation(Constant.surahIndex!,_translation!.index),
          builder: (BuildContext context,AsyncSnapshot<SurahTranslationList>snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }else if(snapshot.hasData){
            return Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: ListView.builder(
                itemCount: snapshot.data!.translationList.length,
                  itemBuilder: (context,index){
                  return TranslationTile(
                      index: index,
                      surahTranslation:snapshot.data!.translationList[index]
                  );
                  }
              ),
            );
          }
          else{
            return const Center(child: Text('translation not found'),
          );
          }
          }
      ),
      bottomSheet: SolidBottomSheet(
        controller: _controller,
          headerBar: Container(
            color: Theme.of(context).primaryColor,
            height: 50,
            child: const Center(
              child: Text('swipe up   اسحب للاعلى',style: TextStyle(color: Colors.white,fontSize: 15),),
            ),
          ),
          body: Container(
            color: Colors.white,
            height: 30,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children:<Widget> [
                    ListTile(
                      title: const Text('spanish   اللغة الإسبانية',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      leading: Radio(
                          value: Translation.Spanish,
                          groupValue: _translation,
                          onChanged: (Translation? value){
                            setState(() {
                              _translation =value;
                            });
                          }
                      ),
                    ),
                    ListTile(
                      title: const Text('german   اللغة الالمانية',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      leading: Radio(
                          value: Translation.german,
                          groupValue: _translation,
                          onChanged: (Translation? value){
                            setState(() {
                              _translation =value;
                            });
                          }
                      ),
                    ),
                    ListTile(
                      title: const Text('english   اللغة الإنجليزية',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      leading: Radio(
                          value: Translation.english,
                          groupValue: _translation,
                          onChanged: (Translation? value){
                            setState(() {
                              _translation =value;
                            });
                          }
                      ),
                    ),
                    ListTile(
                      title: const Text('french    اللغة الفرنسية',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      leading: Radio(
                          value: Translation.french,
                          groupValue: _translation,
                          onChanged: (Translation? value){
                            setState(() {
                              _translation =value;
                            });
                          }
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}

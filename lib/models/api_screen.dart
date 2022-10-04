

import 'dart:convert';
import 'dart:math';
import 'package:holy_quraan/models/juzmodel.dart';
import 'package:holy_quraan/models/sajda.dart';
import 'package:holy_quraan/models/surahtranslation.dart';
import 'package:http/http.dart'as http ;
import 'package:holy_quraan/models/ayaOftheDay.dart';
import 'package:holy_quraan/models/surah.dart';

class ApiService {

  final endPointUrl='http://api.alquran.cloud/v1/surah';
  List<Surah>list=[];


  Future<AyaOfTheDay> getAyaOfTheDay() async {
    String url = 'http://api.alquran.cloud/v1/ayah/${random(1, 6237)}/editions/quran-uthmani,en.asad,en.pickthall';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return AyaOfTheDay.fromJSON(json.decode(response.body));
    } else {
      throw Exception('failed to load post');
    }
  }

  random(min, max) {
    var rn =  Random();
    return min + rn.nextInt(max - min);
  }

  Future<List<Surah>>getSurah()async{
    final http.Response res=await http.get(Uri.parse(endPointUrl));
    if(res.statusCode==200){
      Map<String ,dynamic>json=jsonDecode(res.body);
      json['data'].forEach((element){
        if(list.length<114){
          list.add(Surah.fromJson(element));
        }
      });
      print('ol${list.length}');
      return list;
      }else{
      throw('cant get surah');
    }
  }

  Future<JuzModel>getJuzz(int index)async{
    String url='http://api.alquran.cloud/v1/juz/$index/quran-uthmani';
    final response=await http.get(Uri.parse(url));

    if(response.statusCode==200){
      return JuzModel.fromJSON(json.decode(response.body));
    }else{
      print('failed to load');
      throw Exception('failed to load post');
      
    }
  }

  Future<SajdaList>getSajda()async{
    String url='http://api.alquran.cloud/v1/sajda/en.asad';
    final response= await http.get(Uri.parse(url));

    if(response.statusCode==200){
      return SajdaList.fromJSON(json.decode(response.body));
    }else{
      print('failed to load');
      throw Exception('failed to load post');
    }
  }

  Future<SurahTranslationList>getTranslation(int index, int translationIndex)async{

    String lan='';
    if(translationIndex==0){
      lan ='spanish_garcia';
    }else if(translationIndex==1){
      lan = 'german_bubenheim';
    }else if(translationIndex==2){
      lan ='english_saheeh';
    }else if(translationIndex==3){
      lan = 'french_montada';
    }

    final url='https://quranenc.com/api/translation/sura/$lan/$index';
    var res= await http.get(Uri.parse(url));
    return SurahTranslationList.fromJson(json.decode(res.body));
  }

}

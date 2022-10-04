import 'package:flutter/material.dart';
import 'package:holy_quraan/constants/constant.dart';
import 'package:holy_quraan/constants/juzcustom.dart';
import 'package:holy_quraan/models/api_screen.dart';
import 'package:holy_quraan/models/juzmodel.dart';


class JuzScreen extends StatelessWidget {
  static const String id='juz_screen';

  ApiService apiService =ApiService();

  JuzScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: FutureBuilder<JuzModel>(
            future: apiService.getJuzz(Constant.juzIndex!),
              builder: (context,AsyncSnapshot<JuzModel>snapshot){
              if(snapshot.connectionState==ConnectionState.waiting){
                return const Center(child: CircularProgressIndicator(),);
              }else if(snapshot.hasData){
                print('${snapshot.data!.juzAyahs.length}length');
                return ListView.builder(
                  itemCount: snapshot.data!.juzAyahs.length,
                    itemBuilder: (context,index){
                    return JuzzCustomTitle(list:snapshot.data!.juzAyahs,index:index);
                    }
                );
              }else{
                return const Center(child: Text('data not found'),);
              }
              }
          )
        )
    );
  }
}

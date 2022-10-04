

import 'package:flutter/material.dart';





class AudioScreen extends StatefulWidget  {
  static const String id='Audio_Screen';

  const AudioScreen({Key? key}) : super(key: key);
  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  int _counter = 0;


  void incrementCounter(){
    setState(() {
      _counter++;
    });
  }
  
  void decreaseCounter(){
    setState(() {
      _counter=0;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white70,
      appBar: AppBar(
        backgroundColor: const Color(0xff050D2C),
        title: const Text('prase',textAlign: TextAlign.center,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
      ),
      body: Stack(
        children:[
          Positioned(

              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset('images/pngwing.com.png')
          ),
          Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('الا بذكر الله تطمئن القلوب ',style: TextStyle(color: Colors.black54,fontSize: 25,fontWeight: FontWeight.bold),),

              Text(
                '$_counter',
                style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w700,color: Colors.black),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.transparent),
                      onPressed: incrementCounter,
                      child: const Text(
                          'الله أكبر',
                          style: TextStyle(
                              color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),
                      ),
                    ),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.transparent),
                      onPressed: incrementCounter,
                      child: const Text(
                          'الحمد لله',
                          style: TextStyle(
                              color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),
                      ),
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.transparent),
                      onPressed: incrementCounter,
                      child: const Text(
                          'سبحان الله',
                          style: TextStyle(
                              color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),
                      ),
                  ),

                ],
              ),
              FloatingActionButton(
                backgroundColor: Colors.blueGrey,
                  onPressed: decreaseCounter,
                child: const Icon(Icons.wifi_protected_setup,size: 35,color: Colors.white70,),
              ),

            ],
          ),
        ),

      ]
      ),
    );
  }
}

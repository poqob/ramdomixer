import 'package:flutter/material.dart';
import 'package:ramdomizer/mainScreen.dart';
import 'package:flutter/services.dart';
import 'package:ramdomizer/firstPage.dart';

import 'addPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //fullscreen bitches
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    return MaterialApp(

      initialRoute: '/',
      routes: {
       // '/secondPage': (context) =>  const AddedPage(),
        '/thirdPage': (context) =>  const AddPeople(),
        '/mainPage':(context)=> const mainPage(),
      },
      title: 'Randomiser',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const FirstPage(),
    );
  }
}

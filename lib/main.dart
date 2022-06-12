import 'package:flutter/material.dart';

import 'screens/bmi_screen.dart';

void main () {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor:const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21), 
      ),
      home: BmiScreen(),
    );
  }
}
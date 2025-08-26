import 'package:flutter/material.dart';
import 'package:phoenix/screens/home_screen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp UI',
      theme: ThemeData(
        primaryColor: Color(0xFF075E54),
        secondaryHeaderColor: Color(0xFF25D366),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
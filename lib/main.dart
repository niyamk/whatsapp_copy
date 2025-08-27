import 'package:flutter/material.dart';
import 'package:phoenix/home_screen.dart';
import 'package:phoenix/variables.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp UI',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
        tabBarTheme: TabBarTheme(
          labelColor: Colors.green,
          unselectedLabelColor: Colors.grey,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide.none,
            // borderSide: BorderSide(color: Colors.green, width: 2),
            // insets: EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      // home: WhatsAppUI(),
    );
  }
}

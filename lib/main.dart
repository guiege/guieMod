import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ModernBottomNav.dart';
import 'package:http/http.dart' as http;
import 'dart:ui' as ui;


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Guiegemod',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'SF-Pro',
      ),
      home: const Scaffold(
        body: Center(
          child: ModernBottomNavBar(),
        ),
      ),
    );
  }
}
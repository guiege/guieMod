import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:simple_gradient_text/simple_gradient_text.dart';

class SettingsState extends StatefulWidget{
  const SettingsState({super.key});

  @override
  State<SettingsState> createState() => _SettingsState();

}

class _SettingsState extends State<SettingsState>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        elevation: 0,
        toolbarHeight: 80,
        title: GradientText(
          'SETTINGS',
          style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 25,
              height: 1,
              letterSpacing: 2
          ),
          colors: const [
            Color(0xff485461),
            Color(0xff28313B),
          ],
        ),
        centerTitle: true,
      ),
    );
  }
}
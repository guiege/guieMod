import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:ftpconnect/ftpConnect.dart';

class TransferState extends StatefulWidget{
  const TransferState({super.key});

  @override
  State<TransferState> createState() => _TransferState();

}

class _TransferState extends State<TransferState>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        elevation: 0,
        toolbarHeight: 80,
        title: GradientText(
            'TRANSFER',
            style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25,
                height: 1,
                letterSpacing: 2
            ),
            colors: const [
              Color(0xffB91372),
              Color(0xff6B0F1A),
            ],
        ),
        centerTitle: true,
      ),
    );
  }
}
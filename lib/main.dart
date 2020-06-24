import 'package:flutter/material.dart';
import 'tela.dart';


void main() {
  runApp(MaterialApp(
  home: MyApp(),
  debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Tela();
    
  }
}

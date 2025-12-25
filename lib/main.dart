import 'package:flutter/material.dart';
import 'package:project_aa/screen/spalsh.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'NotoSansKR',
      ),
      debugShowCheckedModeBanner: false,
      home: SpalshScreen()
    );
  }
}

import 'package:flutter/material.dart';
import 'package:text_qr/screens/scan_code.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Safe Life',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scanner(),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:penjualan/penjualan.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ApkHome(),
    );
  }
}

import 'package:dinamiknotortalamasihesaplama/constants/app_constants.dart';
import 'package:dinamiknotortalamasihesaplama/widgets/ortalama_hesapla_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dinamik Ortalama Hesapla',
      theme: ThemeData(
        primarySwatch: Sabitler.anarenk,
        visualDensity: VisualDensity
            .adaptivePlatformDensity, //uygulamayı yatay yada dikey şekilde ayarlayabilir.
      ),
      home: OrtalamaHesaplaPage(),
    );
  }
}

import 'package:dinamiknotortalamasihesaplama/model/ders.dart';
import 'package:flutter/material.dart';

class DataHelper {
  static List<Ders> tumEklenecekDersler = [];

  static dersEkle(Ders ders) {
    tumEklenecekDersler.add(ders);
  }

  static double ortalamaHesapla() {
    double toplamNot = 0;
    double toplamKredi = 0;

    tumEklenecekDersler.forEach((element) {
      toplamNot = toplamNot + (element.krediDegeri + element.harfDegeri);
      toplamKredi += element.krediDegeri;
    });
    double ortalama = toplamNot / toplamKredi;
    return double.parse(ortalama.toStringAsFixed(2)); //ortalamanın virgülden sonra 2 basamagını aldık
  }

  static List<String> _tumdersHarfleri() {
    return [
      'AA',
      'BA',
      'BB',
      'CB',
      'CC',
      'DC',
      'DD',
      'FD',
      'FF',
    ];
  }

  static double _harfleriNotaCevir(String harf) {
    switch (harf) {
      case 'AA':
        return 4;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1;
      case 'FD':
        return 0.5;
      case 'FF':
        return 0.0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> tumDerslerinHarfleri() {
    return _tumdersHarfleri()
        .map(
          (e) => DropdownMenuItem(
            child: Text(e),
            value: _harfleriNotaCevir(e),
          ),
        )
        .toList();
  }

  static List<int> _tumkrediler() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> tumDerslerinKredileri() {
    return _tumkrediler()
        .map(
          (e) => DropdownMenuItem(
            child: Text(e.toString()),
            value: e.toDouble(),
          ),
        )
        .toList();
  }
}

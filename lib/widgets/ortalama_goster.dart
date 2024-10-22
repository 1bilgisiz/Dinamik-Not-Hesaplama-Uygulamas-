import 'package:dinamiknotortalamasihesaplama/constants/app_constants.dart';
import 'package:flutter/material.dart';

class OrtalamaGoster extends StatelessWidget {
  final double ortalama;
  final int dersSayisi;
  const OrtalamaGoster(
      {required this.dersSayisi, required this.ortalama, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dersSayisi > 0 ? "$dersSayisi Ders girildi " : "Ders seçiniz",
          style: Sabitler.ortalamaBaslikStyle,
        ),
        Text(
          ortalama > 0 ? "$ortalama " : "0.0",
          style: Sabitler.ortalamaBodyStyle,
        ),
        Text(
          "Ortlama ",
          style: Sabitler.ortalamaStyle,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabitler {
  static const anarenk = Colors.indigo;
  static const baslikText = 'Ortalama Hesapla';
  static final TextStyle baslikStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: anarenk);
  static BorderRadius borderRadius = BorderRadius.circular(16);

  static final TextStyle ortalamaBaslikStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: anarenk);

  static final TextStyle ortalamaBodyStyle = GoogleFonts.quicksand(
      fontSize: 55, fontWeight: FontWeight.w900, color: anarenk);

  static final TextStyle ortalamaStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: anarenk);

  static final EdgeInsets dropDowwnPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);

  static final EdgeInsets yatayPadding = EdgeInsets.symmetric(horizontal: 8);
}

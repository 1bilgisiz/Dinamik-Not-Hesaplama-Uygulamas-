import 'package:dinamiknotortalamasihesaplama/constants/app_constants.dart';
import 'package:dinamiknotortalamasihesaplama/helper/data_helper.dart';
import 'package:dinamiknotortalamasihesaplama/model/ders.dart';
import 'package:dinamiknotortalamasihesaplama/widgets/ders_listesi.dart';
import 'package:dinamiknotortalamasihesaplama/widgets/ortalama_goster.dart';
import 'package:flutter/material.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  var formKey = GlobalKey<FormState>();
  double secilendeger = 4;
  double secilenKrediDeger = 1;
  String girilenDersAdi = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
            child: Text(
              Sabitler.baslikText,
              style: Sabitler.baslikStyle,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildForm(),
                ),
                Expanded(
                    flex: 1,
                    child: OrtalamaGoster(
                      dersSayisi: DataHelper.tumEklenecekDersler.length,
                      ortalama: DataHelper.ortalamaHesapla(),
                    ))
              ],
            ),
            Expanded(
              child: DersListesi(),
            )
          ],
        ));
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: Sabitler.yatayPadding,
            child: _buildTextFormField(),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding,
                  child: _buildHarfler(),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding,
                  child: _builKredi(),
                ),
              ),
              IconButton(
                onPressed: _dersEkleveOrtalamaHesapla,
                icon: Icon(Icons.arrow_forward_ios_sharp),
                color: Sabitler.anarenk,
                iconSize: 30,
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          girilenDersAdi = deger!;
        });
      },
      validator: (s) {
        if (s!.length <= 0) {
          return "ders adını girinizi";
        } else
          return null;
      },
      decoration: InputDecoration(
        hintText: "MAtematik",
        border: OutlineInputBorder(borderRadius: Sabitler.borderRadius),
        fillColor: Sabitler.anarenk.shade100.withOpacity(0.3),
        filled: true,
      ),
    );
  }

  _buildHarfler() {
    return Container(
      padding: Sabitler.dropDowwnPadding,
      decoration: BoxDecoration(
          color: Sabitler.anarenk.shade100.withOpacity(0.3),
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
        value: secilenKrediDeger,
        elevation: 16,
        iconEnabledColor: Sabitler.anarenk.shade200,
        onChanged: (deger) {
          setState(() {
            secilenKrediDeger = deger!;
          });
        },
        underline: Container(),
        items: DataHelper.tumDerslerinHarfleri(),
      ),
    );
  }

  _builKredi() {
    return Container(
      padding: Sabitler.dropDowwnPadding,
      decoration: BoxDecoration(
          color: Sabitler.anarenk.shade100.withOpacity(0.3),
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
        value: secilendeger,
        elevation: 16,
        iconEnabledColor: Sabitler.anarenk.shade200,
        onChanged: (deger) {
          setState(() {
            secilendeger = deger!;
          });
        },
        underline: Container(),
        items: DataHelper.tumDerslerinKredileri(),
      ),
    );
  }

  _dersEkleveOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          ad: girilenDersAdi,
          krediDegeri: secilenKrediDeger,
          harfDegeri: secilendeger);
      DataHelper.dersEkle(eklenecekDers);
      print(DataHelper.tumEklenecekDersler);
    }
  }
}

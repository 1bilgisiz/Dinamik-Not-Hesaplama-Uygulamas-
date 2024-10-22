import 'package:dinamiknotortalamasihesaplama/constants/app_constants.dart';
import 'package:dinamiknotortalamasihesaplama/helper/data_helper.dart';
import 'package:dinamiknotortalamasihesaplama/model/ders.dart';
import 'package:flutter/material.dart';

class DersListesi extends StatelessWidget {
  const DersListesi({super.key});

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenecekDersler;

    return tumDersler.isNotEmpty
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  DataHelper.tumEklenecekDersler.removeAt(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(tumDersler[index].ad),
                      leading: CircleAvatar(
                        backgroundColor: Sabitler.anarenk,
                        child: Text(
                          (tumDersler[index].harfDegeri *
                                  tumDersler[index].krediDegeri)
                              .toStringAsFixed(1),
                        ),
                      ),
                      subtitle: Text(
                          '${tumDersler[index].krediDegeri} Kredi, Not degeri: ${tumDersler[index].harfDegeri}'),
                    ),
                  ),
                ),
              );
            },
          )
        : Center(
            child: Text(
              "Lütfen ders ekleyiniz",
              style: Sabitler.baslikStyle,
            ),
          );
  }
}

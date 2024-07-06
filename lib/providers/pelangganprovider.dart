import 'package:dataxfirebase/models/pelanggan.dart';
import 'package:flutter/material.dart';

class PelangganProvider extends ChangeNotifier {
  List<Pelanggan> pelanggan = [
    Pelanggan(nama: "ikrar aprianto", alamat: "Galampa", noTelepon: 087777),
    Pelanggan(nama: "sarif", alamat: "wameo", noTelepon: 08888),
    Pelanggan(nama: "agus", alamat: "btn wanabakti", noTelepon: 08333),
    Pelanggan(nama: "adam", alamat: "lastrada", noTelepon: 089878),
  ];

  void addPelanggan(Pelanggan p) {
    pelanggan.add(p);
    notifyListeners();
  }
}

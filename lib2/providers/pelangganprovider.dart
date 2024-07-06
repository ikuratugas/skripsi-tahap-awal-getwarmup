import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dataxfirebase/models/pelanggan.dart';
import 'package:flutter/material.dart';

class PelangganProvider extends ChangeNotifier {
  List<Pelanggan> pelanggan = [
    Pelanggan(
        nama: "ikrar aprianto",
        alamat: "Galampa",
        noTelepon: 087777,
        penagihan: [
          Penagihan(
              status: false,
              jatuhTempo: Timestamp.fromDate(DateTime(2024, 7, 5)))
        ]),
    Pelanggan(nama: "sarif", alamat: "wameo", noTelepon: 08888, penagihan: [
      Penagihan(
          status: false, jatuhTempo: Timestamp.fromDate(DateTime(2024, 8, 8)))
    ]),
    Pelanggan(
        nama: "agus",
        alamat: "btn wanabakti",
        noTelepon: 08333,
        penagihan: [
          Penagihan(
              status: false,
              jatuhTempo: Timestamp.fromDate(DateTime(2024, 4, 21)))
        ]),
    Pelanggan(nama: "adam", alamat: "lastrada", noTelepon: 089878, penagihan: [
      Penagihan(
          status: true, jatuhTempo: Timestamp.fromDate(DateTime(2024, 11, 12)))
    ]),
  ];

  List<Pelanggan> get belumSelesaiPelanggan =>
      pelanggan.where((p) => !p.penagihan[0].status).toList();

  List<Pelanggan> get selesaiPelanggan =>
      pelanggan.where((p) => p.penagihan[0].status).toList();

  void addPelanggan(Pelanggan p) {
    pelanggan.add(p);
    notifyListeners();
  }

  void editSelesai(Pelanggan p) {
    p.penagihan[0].status = true;
    notifyListeners();
  }
}

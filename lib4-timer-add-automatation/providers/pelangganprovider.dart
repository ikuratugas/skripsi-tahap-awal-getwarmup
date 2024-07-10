import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dataxbulan/models/pelanggan.dart';
import 'package:flutter/material.dart';

class PelangganProvider extends ChangeNotifier {
  final List<Pelanggan> _pelangganList = [
    Pelanggan(nama: 'John Doe', langganan: []),
    Pelanggan(nama: 'Jane Smith', langganan: []),
  ];

  List<Pelanggan> get pelangganList => _pelangganList;

  Timer? timer;

  PelangganProvider() {
    mulaiIni();
  }

  void mulaiIni() {
    timer = Timer.periodic(
        const Duration(seconds: 5), (Timer t) => addBulananEntry());
  }

  void addBulananEntry() {
    for (var pelanggan in _pelangganList) {
      pelanggan.langganan.add(Bulanan(jatuTempo: Timestamp.now()));
    }
    for (int i = 0; i < pelangganList[0].langganan.length; i++) {
      print(
          "pelanggan ${pelangganList[0].langganan[i].jatuTempo.toDate().toString()}");
    }
    notifyListeners();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:serius_mode/models/pelanggan.dart';
import 'package:uuid/uuid.dart';

class ExpProvider extends ChangeNotifier {
  final List<Pelanggan> _pelangganExp = [
    Pelanggan(
      uuid: const Uuid().v4(),
      nama: 'Ikrar Aprianto',
      sandi: 'ikrar123',
      alamat: 'galampa',
      noTelepon: '1234567890',
      tagihanBulanan: [
        PelangganBulanan(
            jatuhTempo: Timestamp.fromDate(DateTime(2024, 5, 5)),
            sudahBayar: true),
        PelangganBulanan(
            jatuhTempo: Timestamp.fromDate(DateTime(2024, 6, 5)),
            sudahBayar: true),
        PelangganBulanan(
            jatuhTempo: Timestamp.fromDate(DateTime(2024, 7, 5)),
            sudahBayar: false),
      ],
    ),
    Pelanggan(
      uuid: const Uuid().v4(),
      nama: 'Sarif',
      sandi: 'sarif123',
      alamat: 'wameo',
      noTelepon: '1234567890',
      tagihanBulanan: [],
    ),
    Pelanggan(
      uuid: const Uuid().v4(),
      nama: 'Adam Ramadhan',
      sandi: 'adam123',
      alamat: 'lastarda',
      noTelepon: '2345678901',
      tagihanBulanan: [
        PelangganBulanan(
            jatuhTempo: Timestamp.fromDate(DateTime(2024, 5, 10)),
            sudahBayar: true),
        PelangganBulanan(
            jatuhTempo: Timestamp.fromDate(DateTime(2024, 6, 10)),
            sudahBayar: true),
        PelangganBulanan(
            jatuhTempo: Timestamp.fromDate(DateTime(2024, 7, 10)),
            sudahBayar: true),
      ],
    ),
    Pelanggan(
      uuid: const Uuid().v4(),
      nama: 'Almin',
      sandi: 'almin123',
      alamat: 'pasarwajo',
      noTelepon: '446565656',
      tagihanBulanan: [
        PelangganBulanan(
            jatuhTempo: Timestamp.fromDate(DateTime(2024, 5, 15)),
            sudahBayar: true),
        PelangganBulanan(
            jatuhTempo: Timestamp.fromDate(DateTime(2024, 6, 15)),
            sudahBayar: true),
        PelangganBulanan(
            jatuhTempo: Timestamp.fromDate(DateTime(2024, 7, 15)),
            sudahBayar: false),
      ],
    ),
  ];
  List<Pelanggan> get pelangganExp => _pelangganExp;

  final witZoneTime = DateTime.now().toUtc().add(const Duration(hours: 8));

  ExpProvider() {
    checkAndAddMonthlyData();
  }

  // Add new data per month if today is the 1st
  void addMonthTimeStampPelangganBulanan() {
    for (var pelanggan in _pelangganExp) {
      DateTime lastDate = pelanggan.tagihanBulanan.isNotEmpty
          ? pelanggan.tagihanBulanan.last.jatuhTempo
              .toDate()
              .toUtc()
              .add(const Duration(hours: 8))
          : DateTime.now();

      DateTime newJatuhTempo = DateTime(
        lastDate.year,
        lastDate.month + 1,
        lastDate.day,
      );

      if (newJatuhTempo.month == 1 && lastDate.month == 12) {
        newJatuhTempo = DateTime(newJatuhTempo.year + 1, 1, newJatuhTempo.day);
      }

      // Add only if the new date is in the future
      if (newJatuhTempo.isAfter(DateTime.now())) {
        pelanggan.tagihanBulanan.add(PelangganBulanan(
          jatuhTempo: Timestamp.fromDate(newJatuhTempo),
          sudahBayar: false,
        ));
        print("Added new due date: $newJatuhTempo");
      }
      for (var pelangan in _pelangganExp) {
        print("nama : ${pelangan.nama}");
        for (var bulanan in pelangan.tagihanBulanan) {
          print("--bulan${bulanan.jatuhTempo.toDate()}");
          print("--bulan${bulanan.sudahBayar}\n");
        }
      }
    }

    notifyListeners();
  }

  // Check if today is the 1st of the month and add data if needed
  void checkAndAddMonthlyData() {
    DateTime now = DateTime.now().toUtc().add(const Duration(hours: 8));
    if (now.day == 4) {
      addMonthTimeStampPelangganBulanan();
    }
  }
}

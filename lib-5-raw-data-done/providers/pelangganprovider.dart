import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:serius_mode/models/chat.dart';
import 'package:serius_mode/models/pelanggan.dart';
import 'package:uuid/uuid.dart';

class PelangganProvider extends ChangeNotifier {
  final List<Pelanggan> _pelanggans = [
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
      nama: 'almin',
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
  List<Pelanggan> get pelanggan => _pelanggans;

  // ini masuk bagian methodnya

  void addPelanggan(Pelanggan pelanggan) {
    _pelanggans.add(pelanggan);
    notifyListeners();
  }

  void updatePelanggan(String? uuid, Pelanggan pelangganEdit) {
    final index = _pelanggans.indexWhere((pelanggan) => pelanggan.uuid == uuid);

    if (index != -1) {
      _pelanggans[index] = pelangganEdit;
      notifyListeners();
    }
  }

  void deletePelanggan(String? uuid) {
    _pelanggans.removeWhere((pelanggan) => pelanggan.uuid == uuid);
    notifyListeners();
  }

  // ============ chatgpt ji..
  List<Pelanggan> _filteredPelanggan = [];

  PelangganProvider() {
    _filteredPelanggan = _pelanggans;
  }

  void filterPelanggan(String query) {
    if (query.isEmpty) {
      _filteredPelanggan = _pelanggans;
    } else {
      _filteredPelanggan = _pelanggans.where((pelanggan) {
        return pelanggan.nama.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  List<Pelanggan> getFilteredPelanggan() {
    return _filteredPelanggan;
  }

  List<PelangganBulanan> getTagihanBulananForCurrentMonth(Pelanggan pelanggan) {
    final currentMonth = DateTime.now().month;
    final currentYear = DateTime.now().year;
    return pelanggan.tagihanBulanan.where((tagihan) {
      final jatuhTempo = tagihan.jatuhTempo.toDate();
      return jatuhTempo.month == currentMonth && jatuhTempo.year == currentYear;
    }).toList();
  }

  List<PelangganBulanan> getTagihanBulananBelumBayar(Pelanggan pelanggan) {
    final currentMonth = DateTime.now().month;
    final currentYear = DateTime.now().year;
    return pelanggan.tagihanBulanan.where((tagihan) {
      final jatuhTempo = tagihan.jatuhTempo.toDate();
      return jatuhTempo.month == currentMonth &&
          jatuhTempo.year == currentYear &&
          tagihan.sudahBayar == false;
    }).toList();
  }

  List<PelangganBulanan> getTagihanBulananSudahBayar(Pelanggan pelanggan) {
    final currentMonth = DateTime.now().month;
    final currentYear = DateTime.now().year;
    return pelanggan.tagihanBulanan.where((tagihan) {
      final jatuhTempo = tagihan.jatuhTempo.toDate();
      return jatuhTempo.month == currentMonth &&
          jatuhTempo.year == currentYear &&
          tagihan.sudahBayar == true;
    }).toList();
  }

  void updateKeBelumBayar(Pelanggan pelanggan) {
    for (var tagihan in pelanggan.tagihanBulanan) {
      if (tagihan.jatuhTempo.toDate().month == DateTime.now().month &&
          tagihan.jatuhTempo.toDate().year == DateTime.now().year) {
        tagihan.sudahBayar = false;
      }
    }
    notifyListeners();
  }

  void updateSudahBayar(Pelanggan pelanggan) {
    for (var tagihan in pelanggan.tagihanBulanan) {
      if (tagihan.jatuhTempo.toDate().month == DateTime.now().month &&
          tagihan.jatuhTempo.toDate().year == DateTime.now().year) {
        tagihan.sudahBayar = true;
      }
    }
    notifyListeners();
  }

  // INI UNTUK USER
  // validasi login
  // Method to validate login
  bool validateLogin(String nama, String sandi) {
    for (var pelanggan in _pelanggans) {
      if (pelanggan.nama == nama && pelanggan.sandi == sandi) {
        return true;
      }
    }
    return false;
  }

  Pelanggan? login(String username, String password) {
    try {
      return _pelanggans.firstWhere(
        (p) => p.nama == username && p.sandi == password,
      );
    } catch (e) {
      return null;
    }
  }

  // isi chat
  List<ChatFromUser> chatDariUser = [
    ChatFromUser(
        nama: "Ikrar Aprianto",
        isiChat: "Ganti Channel min ke siaran liga Inggris di Channel 2"),
    ChatFromUser(
        nama: "Rina Sari",
        isiChat: "Bisa tolong perbaiki sinyal di Channel 5?"),
    ChatFromUser(
        nama: "Budi Santoso",
        isiChat: "Ada masalah dengan suara di Channel 7, tolong cek"),
    ChatFromUser(
        nama: "Dina Rahmawati",
        isiChat: "Kapan siaran bola berikutnya dimulai?"),
    ChatFromUser(
        nama: "Eka Pratama",
        isiChat: "Channel berita tidak muncul di TV saya, tolong bantu"),
    ChatFromUser(
        nama: "Joko Widodo",
        isiChat:
            "Saya ingin menambah paket channel olahraga, bagaimana caranya?"),
    ChatFromUser(
        nama: "Siti Nurhaliza",
        isiChat: "Tolong update jadwal tayang film terbaru di Channel 10"),
    ChatFromUser(
        nama: "Arif Hidayat",
        isiChat: "Ganti ke channel dokumenter di Channel 8"),
    ChatFromUser(
        nama: "Lina Marlina",
        isiChat: "Ada gangguan gambar di Channel 4, mohon diperiksa"),
    ChatFromUser(
        nama: "Hadi Nugroho",
        isiChat:
            "Bagaimana cara mengatur ulang TV jika ada masalah dengan remote?")
  ];

  void addChat(String nama, String isiChat) {
    ChatFromUser data = ChatFromUser(nama: nama, isiChat: isiChat);
    chatDariUser.add(data);
    for (var chat in chatDariUser) {
      print('\n ${chat.nama}');
      print('\n ${chat.isiChat}\n\n');
    }
    notifyListeners();
  }
}

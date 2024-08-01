import 'package:cloud_firestore/cloud_firestore.dart';

class Pelanggan {
  String? uuid;
  String nama;
  String sandi;
  String alamat;
  String noTelepon;
  List<PelangganBulanan> tagihanBulanan;

  Pelanggan({
    this.uuid,
    required this.nama,
    required this.sandi,
    required this.alamat,
    required this.noTelepon,
    required this.tagihanBulanan,
  });
}

class PelangganBulanan {
  Timestamp jatuhTempo;
  bool sudahBayar;

  PelangganBulanan({required this.jatuhTempo, required this.sudahBayar});
}

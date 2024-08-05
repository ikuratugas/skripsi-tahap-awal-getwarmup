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

  // ini method digunakan untuk merubah data atau edit datanya
  Pelanggan copyWith({
    String? uuid,
    String? nama,
    String? sandi,
    String? alamat,
    String? noTelepon,
    List<PelangganBulanan>? tagihanBulanan,
  }) {
    return Pelanggan(
      uuid: uuid ?? this.uuid!,
      nama: nama ?? this.nama,
      sandi: sandi ?? this.sandi,
      alamat: alamat ?? this.alamat,
      noTelepon: noTelepon ?? this.noTelepon,
      tagihanBulanan: tagihanBulanan ?? this.tagihanBulanan,
    );
  }
}

class PelangganBulanan {
  Timestamp jatuhTempo;
  bool sudahBayar;

  PelangganBulanan({required this.jatuhTempo, required this.sudahBayar});
}

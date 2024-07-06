import 'package:cloud_firestore/cloud_firestore.dart';

class Pelanggan {
  String nama;
  String alamat;
  double noTelepon;
  List<Penagihan> penagihan;

  Pelanggan(
      {required this.nama,
      required this.alamat,
      required this.noTelepon,
      required this.penagihan});
}

class Penagihan {
  bool status;
  Timestamp jatuhTempo;

  Penagihan({required this.status, required this.jatuhTempo});
}

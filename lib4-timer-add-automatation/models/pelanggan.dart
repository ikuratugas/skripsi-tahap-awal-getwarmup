import 'package:cloud_firestore/cloud_firestore.dart';

class Pelanggan {
  String nama;
  List<Bulanan> langganan;

  Pelanggan({
    required this.nama,
    required this.langganan,
  });
}

class Bulanan {
  Timestamp jatuTempo;
  Bulanan({required this.jatuTempo});
}

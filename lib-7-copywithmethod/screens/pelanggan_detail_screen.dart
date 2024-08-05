import 'package:flutter/material.dart';
import 'package:serius_mode/models/pelanggan.dart'; // Import your Pelanggan model

class PelangganDetailScreen extends StatelessWidget {
  final Pelanggan pelanggan;

  const PelangganDetailScreen({super.key, required this.pelanggan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail of ${pelanggan.nama}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama: ${pelanggan.nama}',
                style: const TextStyle(fontSize: 18)),
            Text('Sandi: ${pelanggan.sandi}',
                style: const TextStyle(fontSize: 18)),
            Text('Alamat: ${pelanggan.alamat}',
                style: const TextStyle(fontSize: 18)),
            Text('No Telepon: ${pelanggan.noTelepon}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            const Text('Tagihan Bulanan:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: pelanggan.tagihanBulanan.length,
                itemBuilder: (context, index) {
                  final tagihan = pelanggan.tagihanBulanan[index];
                  return ListTile(
                    title: Text('Jatuh Tempo: ${tagihan.jatuhTempo.toDate()}'),
                    trailing: Text(tagihan.sudahBayar ? 'Paid' : 'Unpaid'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

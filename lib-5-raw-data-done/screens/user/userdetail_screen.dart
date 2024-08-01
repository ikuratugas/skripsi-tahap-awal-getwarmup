import 'package:flutter/material.dart';
import 'package:serius_mode/models/pelanggan.dart';

class UserDetailScreen extends StatelessWidget {
  final Pelanggan pelanggan;

  const UserDetailScreen({required this.pelanggan, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pelanggan.nama),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama: ${pelanggan.nama}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Alamat: ${pelanggan.alamat}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('No. Telepon: ${pelanggan.noTelepon}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            const Text('Tagihan Bulanan:', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: pelanggan.tagihanBulanan.length,
                itemBuilder: (context, index) {
                  final tagihan = pelanggan.tagihanBulanan[index];
                  return ListTile(
                    title: Text('Jatuh Tempo: ${tagihan.jatuhTempo.toDate()}'),
                    trailing: Icon(
                      tagihan.sudahBayar ? Icons.check : Icons.close,
                      color: tagihan.sudahBayar ? Colors.green : Colors.red,
                    ),
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

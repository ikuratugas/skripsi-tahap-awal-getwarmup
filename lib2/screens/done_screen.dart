import 'package:dataxfirebase/providers/pelangganprovider.dart';
import 'package:dataxfirebase/screens/tambah_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PelangganProvider>(
      builder: (context, state, child) => Scaffold(
        appBar: AppBar(
          title: const Text("Lihat Data"),
        ),
        body: ListView.builder(
          itemCount: state.selesaiPelanggan.length,
          itemBuilder: (context, index) {
            final pelanggan = state.selesaiPelanggan[index];
            return ListTile(
              title: Text(pelanggan.nama),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TambahScreen(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

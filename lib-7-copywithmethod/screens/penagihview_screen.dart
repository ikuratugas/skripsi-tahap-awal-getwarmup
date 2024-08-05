import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serius_mode/providers/pelangganprovider.dart';
import 'package:serius_mode/screens/pelanggan_detail_screen.dart'; // Import the new screen
import 'package:serius_mode/screens/penagihcreate_screen.dart';

class PenagihViewScreen extends StatelessWidget {
  const PenagihViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pelanggan List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PenagihCreateScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer<PelangganProvider>(
        builder: (context, pelangganProvider, child) {
          final pelanggans = pelangganProvider.pelanggan;

          return ListView.builder(
            itemCount: pelanggans.length,
            itemBuilder: (context, index) {
              final pelanggan = pelanggans[index];
              return ListTile(
                title: Text(pelanggan.nama),
                subtitle: Text(pelanggan.noTelepon),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                PenagihCreateScreen(pelanggan: pelanggan),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        pelangganProvider.deletePelanggan(pelanggan.uuid);
                      },
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          PelangganDetailScreen(pelanggan: pelanggan),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => PenagihCreateScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

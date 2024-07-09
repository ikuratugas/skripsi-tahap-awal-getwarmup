import 'package:dataxfirebase/providers/pelangganprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PelangganProvider>(
      builder: (context, state, child) => Scaffold(
        body: ListView.builder(
          itemCount: state.filteredSelesaiPelanggan.length,
          itemBuilder: (context, index) {
            final pelanggan = state.filteredSelesaiPelanggan[index];
            return ListTile(
              title: Text(pelanggan.nama),
            );
          },
        ),
      ),
    );
  }
}

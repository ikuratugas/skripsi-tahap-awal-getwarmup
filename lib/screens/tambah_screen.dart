import 'package:dataxfirebase/models/pelanggan.dart';
import 'package:dataxfirebase/providers/inputtambahprovider.dart';
import 'package:dataxfirebase/providers/pelangganprovider.dart';
import 'package:dataxfirebase/screens/lihat_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TambahScreen extends StatelessWidget {
  const TambahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Pelanggan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer2<InputTambahProvider, PelangganProvider>(
          builder: (context, customerData, state, child) {
            return Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    onChanged: (newValue) {
                      customerData.updateName(newValue);
                    },
                    decoration: const InputDecoration(
                      labelText: 'Nama',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    onChanged: (newValue) {
                      customerData.updatePhone(double.parse(newValue));
                    },
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'No. Telepon',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    onChanged: (newValue) {
                      customerData.updateAddress(newValue);
                    },
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'Alamat',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        final p = Pelanggan(
                            nama: customerData.name,
                            alamat: customerData.address,
                            noTelepon: customerData.phone);
                        state.addPelanggan(p);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LihatScreen()));
                      },
                      child: const Text('Tambah Pelanggan'),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serius_mode/models/pelanggan.dart';
import 'package:serius_mode/providers/pelangganprovider.dart';
import 'package:uuid/uuid.dart';

class PenagihCreateScreen extends StatelessWidget {
  final Pelanggan? pelanggan;

  PenagihCreateScreen({super.key, this.pelanggan});

  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _sandiController = TextEditingController();
  final _alamatController = TextEditingController();
  final _noTeleponController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Initialize controllers with existing data if editing
    if (pelanggan != null) {
      _namaController.text = pelanggan!.nama;
      _sandiController.text = pelanggan!.sandi;
      _alamatController.text = pelanggan!.alamat;
      _noTeleponController.text = pelanggan!.noTelepon;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(pelanggan == null ? 'Add Pelanggan' : 'Edit Pelanggan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(labelText: 'Nama'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _sandiController,
                decoration: const InputDecoration(labelText: 'Sandi'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _alamatController,
                decoration: const InputDecoration(labelText: 'Alamat'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _noTeleponController,
                decoration: const InputDecoration(labelText: 'No Telepon'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Consumer<PelangganProvider>(
                builder: (context, pelangganProvider, child) {
                  return ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final p = Pelanggan(
                          nama: _namaController.text,
                          sandi: _sandiController.text,
                          alamat: _alamatController.text,
                          noTelepon: _noTeleponController.text,
                          tagihanBulanan: pelanggan?.tagihanBulanan ??
                              [
                                PelangganBulanan(
                                    jatuhTempo: Timestamp.fromDate(
                                        DateTime(2024, 5, 1)),
                                    sudahBayar: false),
                                PelangganBulanan(
                                    jatuhTempo: Timestamp.fromDate(
                                        DateTime(2024, 6, 1)),
                                    sudahBayar: false),
                                PelangganBulanan(
                                    jatuhTempo: Timestamp.fromDate(
                                        DateTime(2024, 7, 1)),
                                    sudahBayar: false),
                              ],
                        );

                        if (pelanggan == null) {
                          final pelangganBaru = Pelanggan(
                              uuid: const Uuid().v4(),
                              nama: p.nama,
                              sandi: p.sandi,
                              alamat: p.alamat,
                              noTelepon: p.noTelepon,
                              tagihanBulanan: p.tagihanBulanan);
                          pelangganProvider.addPelanggan(pelangganBaru);
                        } else {
                          pelangganProvider.updatePelanggan(pelanggan!.uuid, p);
                        }

                        Navigator.of(context).pop();
                      }
                    },
                    child: Text(pelanggan == null ? 'Add' : 'Update'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

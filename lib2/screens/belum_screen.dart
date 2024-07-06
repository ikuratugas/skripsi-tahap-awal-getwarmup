import 'package:dataxfirebase/providers/pelangganprovider.dart';
import 'package:dataxfirebase/screens/tambah_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BelumScreen extends StatelessWidget {
  const BelumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PelangganProvider>(
      builder: (context, state, child) => Scaffold(
        appBar: AppBar(
          title: const Text("Lihat Data"),
        ),
        body: ListView.builder(
          itemCount: state.belumSelesaiPelanggan.length,
          itemBuilder: (context, index) {
            final pelanggan = state.belumSelesaiPelanggan[index];
            return Dismissible(
              key: Key(pelanggan.nama),
              direction: DismissDirection.startToEnd,
              confirmDismiss: (direction) async {
                return await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Confirm"),
                      content: const Text(
                          "Are you sure you want to delete this item?"),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: const Text("No"),
                        ),
                        TextButton(
                          onPressed: () {
                            state.editSelesai(pelanggan);
                            Navigator.of(context).pop(true);
                          },
                          child: const Text("Yes"),
                        ),
                      ],
                    );
                  },
                );
              },
              onDismissed: (direction) {
                state.pelanggan.removeAt(index);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${pelanggan.nama} dismissed")),
                );
              },
              background: Container(
                  color: Colors.red,
                  child: const Icon(Icons.delete, color: Colors.white)),
              child: ListTile(
                title: Text(pelanggan.nama),
              ),
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

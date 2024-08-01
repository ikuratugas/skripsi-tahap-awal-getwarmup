import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serius_mode/providers/pelangganprovider.dart';

class TagihanScreen extends StatelessWidget {
  const TagihanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PelangganProvider>(
        builder: (context, pelangganProvider, child) {
      return Scaffold(
        body: ListView.builder(
            itemCount: pelangganProvider.pelanggan.length,
            itemBuilder: (contex, index) {
              final pelanggan = pelangganProvider.pelanggan[index];

              // Filter tagihanBulanan for the current month
              final currentMonthTagihan =
                  pelangganProvider.getTagihanBulananBelumBayar(pelanggan);

              // If no tagihanBulanan for the current month, return an empty widget
              if (currentMonthTagihan.isEmpty) {
                return const SizedBox.shrink();
              }
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
                    pelangganProvider.updateSudahBayar(pelanggan);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("${pelanggan.nama} dismissed")),
                    );
                  },
                  background: Container(
                      color: Colors.green,
                      child: const Icon(Icons.done, color: Colors.white)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          pelanggan.nama,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: currentMonthTagihan.length,
                        itemBuilder: (context, billIndex) {
                          final bill = currentMonthTagihan[billIndex];
                          final tampilTanggal = bill.jatuhTempo.toDate();
                          String formattedDate =
                              '${tampilTanggal.year.toString().padLeft(4, '0')}-'
                              '${tampilTanggal.month.toString().padLeft(2, '0')}-'
                              '${tampilTanggal.day.toString().padLeft(2, '0')}';
                          return ListTile(
                            title: Text(
                              'Jatuh Tempo: $formattedDate',
                            ),
                            subtitle: Text("masih dalam ${bill.sudahBayar}"),
                          );
                        },
                      ),
                      const Divider(),
                    ],
                  ));
            }),
      );
    });
  }
}

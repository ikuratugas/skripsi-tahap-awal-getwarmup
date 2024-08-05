import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serius_mode/providers/pelangganprovider.dart';

class PenagihTagihanScreen extends StatelessWidget {
  const PenagihTagihanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PelangganProvider>(
      builder: (context, pelangganProvider, child) {
        return ListView.builder(
          itemCount: pelangganProvider.pelanggan.length,
          itemBuilder: (context, index) {
            final pelanggan = pelangganProvider.pelanggan[index];
            // Filter tagihanBulanan for the current month
            final currentMonthTagihan =
                pelangganProvider.getTagihanBulananForCurrentMonth(pelanggan);

            // If no tagihanBulanan for the current month, return an empty widget
            if (currentMonthTagihan.isEmpty) {
              return const SizedBox.shrink();
            }

            return Column(
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
                    );
                  },
                ),
                const Divider(),
              ],
            );
          },
        );
      },
    );
  }
}

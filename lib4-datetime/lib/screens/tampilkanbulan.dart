import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TampilkanBulan extends StatelessWidget {
  const TampilkanBulan({super.key});

  @override
  Widget build(BuildContext context) {
    // Mendapatkan nama bulan saat ini
    String currentMonth = DateFormat.MMMM('id_ID').format(DateTime.now());

    return Scaffold(
      body: Center(
        child: Text(
          'Bulan ini adalah $currentMonth',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

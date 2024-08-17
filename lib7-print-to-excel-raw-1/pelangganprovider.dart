import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:serius_mode/models/chat.dart';
import 'package:serius_mode/models/pelanggan.dart';
import 'package:uuid/uuid.dart';

class PelangganProvider extends ChangeNotifier {
  final List<Pelanggan> _pelanggans = [
    Pelanggan(
      uuid: const Uuid().v4(),
      nama: 'Ikrar Aprianto',
      sandi: 'ikrar123',
      alamat: 'galampa',
      noTelepon: '1234567890',
      tagihanBulanan: [
        PelangganBulanan(
            jatuhTempo: Timestamp.fromDate(DateTime(2024, 5, 5)),
            sudahBayar: true),
        PelangganBulanan(
            jatuhTempo: Timestamp.fromDate(DateTime(2024, 6, 5)),
            sudahBayar: true),
        PelangganBulanan(
            jatuhTempo: Timestamp.fromDate(DateTime(2024, 7, 5)),
            sudahBayar: false),
      ],
    ),
    Pelanggan(
      uuid: const Uuid().v4(),
      nama: 'Adam Ramadhan',
      sandi: 'adam123',
      alamat: 'lastarda',
      noTelepon: '2345678901',
      tagihanBulanan: [
        PelangganBulanan(
            jatuhTempo: Timestamp.fromDate(DateTime(2024, 5, 10)),
            sudahBayar: true),
        PelangganBulanan(
            jatuhTempo: Timestamp.fromDate(DateTime(2024, 6, 10)),
            sudahBayar: true),
        PelangganBulanan(
            jatuhTempo: Timestamp.fromDate(DateTime(2024, 7, 10)),
            sudahBayar: true),
      ],
    ),
    Pelanggan(
      uuid: const Uuid().v4(),
      nama: 'almin',
      sandi: 'almin123',
      alamat: 'pasarwajo',
      noTelepon: '446565656',
      tagihanBulanan: [
        PelangganBulanan(
            jatuhTempo: Timestamp.fromDate(DateTime(2024, 5, 15)),
            sudahBayar: true),
        PelangganBulanan(
            jatuhTempo: Timestamp.fromDate(DateTime(2024, 6, 15)),
            sudahBayar: true),
        PelangganBulanan(
            jatuhTempo: Timestamp.fromDate(DateTime(2024, 7, 15)),
            sudahBayar: false),
      ],
    ),
  ];
  List<Pelanggan> get pelanggan => _pelanggans;

  // untuk memprint ke bentuk excel

  Future<void> exportToExcel() async {
    var excel = Excel.createExcel();
    Sheet sheetObject = excel['Pelanggan Data'];

    // Add header row
    final greenStyle = CellStyle(
      backgroundColorHex: ExcelColor.green, // Green for Yes
    );
    final redStyle = CellStyle(
      backgroundColorHex: ExcelColor.red, // Red for No
    );

    // Add header row
    sheetObject.appendRow([
      const TextCellValue('UUID'),
      const TextCellValue('Nama'),
      const TextCellValue('Sandi'),
      const TextCellValue('Alamat'),
      const TextCellValue('No Telepon'),
      const TextCellValue('Tagihan Bulanan (Jatuh Tempo)'),
      const TextCellValue('Tagihan Bulanan (Sudah Bayar)')
    ]);

    // Add data rows
    for (var pelanggan in _pelanggans) {
      // Start the row with pelanggan data
      List<CellValue> row = [
        TextCellValue(pelanggan.uuid!),
        TextCellValue(pelanggan.nama),
        TextCellValue(pelanggan.sandi),
        TextCellValue(pelanggan.alamat),
        TextCellValue(pelanggan.noTelepon),
      ];

      // Append each tagihan's sudahBayar value horizontally
      for (var tagihan in pelanggan.tagihanBulanan) {
        String value =
            '${tagihan.jatuhTempo.toDate().month}/${tagihan.jatuhTempo.toDate().year} - ${tagihan.sudahBayar ? 'Sudah' : 'Belum'}';
        row.add(TextCellValue(value));
      }

      // Append the row to the sheet

      // Append the row to the sheet
      sheetObject.appendRow(row);
    }
    // Save file
    var fileBytes = excel.save();
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/pelanggan_data.xlsx')
      ..createSync(recursive: true)
      ..writeAsBytesSync(fileBytes!);

    // Provide feedback
    if (kDebugMode) {
      print('Excel file saved at: ${file.path}');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:timerdateexperiment/screens/tampilkanbulan.dart';

void main() async {
  // Inisialisasi locale
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const TampilkanBulan());
  }
}

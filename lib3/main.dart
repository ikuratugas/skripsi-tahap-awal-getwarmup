import 'package:dataxfirebase/providers/inputtambahprovider.dart';
import 'package:dataxfirebase/providers/pelangganprovider.dart';
import 'package:dataxfirebase/screens/penagihan_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => PelangganProvider())),
        ChangeNotifierProvider(create: ((context) => InputTambahProvider())),
      ],
      child: MaterialApp(
          title: 'dataxfire',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const PenagihanScreen()),
    );
  }
}

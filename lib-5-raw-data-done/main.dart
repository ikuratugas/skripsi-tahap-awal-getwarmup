import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serius_mode/providers/pelangganprovider.dart';
import 'package:serius_mode/screens/fitur_masukan/masukan_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PelangganProvider())
      ],
      child: MaterialApp(
        home: Scaffold(body: MasukanScreen()),
      ),
    );
  }
}

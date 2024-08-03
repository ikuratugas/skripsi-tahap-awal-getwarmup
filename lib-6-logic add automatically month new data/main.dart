import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serius_mode/providers/exp/exp_provider.dart';
import 'package:serius_mode/providers/pelangganprovider.dart';
import 'package:serius_mode/screens/exp/exp_scree.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PelangganProvider()),
        ChangeNotifierProvider(create: (context) => ExpProvider()),
      ],
      child: const MaterialApp(
        home: Scaffold(body: ExpScreen()),
      ),
    );
  }
}
